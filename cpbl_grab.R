library(RCurl)
library(XML)

df <- data.frame(
  game_id = numeric(),
  team_id = character(), 
  ab = numeric(),
  r = numeric(),
  h= numeric(),
  rbi = numeric(),
  bb = numeric(),
  so = numeric(),
  sb = numeric(),
  hr_num = numeric(),
  err_sum = numeric(),
  duration = numeric(),
  att = numeric(),
  score = numeric(),
  lose_point = numeric(),
  place = character(),
  weekday = character(), 
  net_scores = numeric(), 
  #inning_nodes = array(), 
  stringsAsFactors = FALSE) 


for (i in 7:9) {
  url <- paste('http://www.cpbl.com.tw/game/box.aspx?gameno=01&year=2013&game=', i, sep='')
  page <- htmlParse(url, encoding = "utf-8")
  for (team_idx in 1:2) {
    box <- ifelse(team_idx==1, "box_a", "box_b")
    ## AB  R  H  RBI	BB	SO	SB
    tableNodes = getNodeSet(page, paste("//*[@class='",box,"']/table",sep=''))
    tb = readHTMLTable(tableNodes[[1]], stringsAsFactors = FALSE, header=FALSE, skip.rows=1, na.rm=FALSE)
    hiter_sum <- as.numeric(tb[length(tb$V1),2:8])
    hr_num <- 0
    err_sum <- 0
    result <- 0
    others<-gsub("\\s","",sapply(getNodeSet(page, paste("//*[@class='", box, "']/p/text()",sep='')),xmlValue))
    
    ## home run number
    if(length(grep("HR:",others, value=TRUE))){
      hr_num <- length(grep("\\D\\d+\\D",others, value=TRUE))
    }
    ## error number
    if(length(grep("E:",others, value=TRUE))){
      err_sum <- sum(match(others,","), na.rm=TRUE) + 1
    }
    ## TIME ATT
    time_att <- gsub("\\s","",sapply(getNodeSet(page, "//*[@class='box']/p[2]/text()"),xmlValue))
    du_time <- as.numeric(unlist(strsplit(gsub("TIME:", "", time_att[length(time_att) - 1]), ":")))
    du <- du_time[1]*60 + du_time[2]
    att <- gsub("ATT:", "", time_att[length(time_att)])
    # header box
    nodes <- getNodeSet(page,"//*[@class='info01']/table/tr/td[1]")
    nodes <-gsub("\\s"," ",sapply(getNodeSet(page, "//*[@class='info01']/table/tr"),xmlValue))
    nodes <- gsub("．"," ",nodes)
    gameinfo <- unlist(strsplit(nodes, "\\s+"))
    team_name <- c(gameinfo[6],gameinfo[8])
    scores <- as.numeric(c(gameinfo[7],gameinfo[9]))
    score <- scores[team_idx]
    lose_point <- ifelse(team_idx==1, scores[2], scores[1])
    net_scores <- score - lose_point
    place <- gameinfo[10]
    year <- gameinfo[2]
    month <- gameinfo[3]
    day <- gameinfo[4]
    weekday <- gameinfo[5]
    # inning_box
    inning_nodes <- gsub("\\s","",sapply(getNodeSet(page, "//*[@class='bg']/text()"),xmlValue))
    team_a <- matrix(as.numeric(inning_nodes[seq(1,length(inning_nodes) - 6,2)]), nrow = 1)
    team_b <- matrix(as.numeric(inning_nodes[seq(2,length(inning_nodes) - 6,2)]), nrow = 1)
    inning_box <- list(team_a, team_b)
    
    newRow <- data.frame(game_id=i,
                         team_id = team_name[team_idx],
                         hiter_sum[1],
                         hiter_sum[2],
                         hiter_sum[3],
                         hiter_sum[4],
                         hiter_sum[5],
                         hiter_sum[6],
                         hiter_sum[7],
                         hr_num,
                         err_sum,
                         du,
                         att,
                         score,
                         lose_point,
                         place,
                         weekday,
                         net_scores)
                         
    df <- rbind(df, newRow)
    print(newRow)
    print(team_a[1,])
    print(team_b[1,])
    print(" ================= ")
  }
}

df$team_id <- as.factor(df$team_id)
df$place <- as.factor(df$place)
df$weekday <- as.factor(df$weekday)
df$net_scores <- as.factor(df$net_scores)

