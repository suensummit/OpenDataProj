library(XML)
library(RSelenium)

pJS <- phantom()
Sys.sleep(5)
remDr <- remoteDriver(browserName = 'phantomjs')
remDr$open()

url <- 'http://www.cpbl.com.tw/stats_hr.aspx'
remDr$navigate(url)

hr_tables <- list()

year <- seq(1990, 2014)
for (i in 1:length(year)) {
  option <- remDr$findElement(using = 'xpath', paste0("//*/option[@value = '",year[i],"']"))
  option$clickElement()
  src <- option$getPageSource()
  hr_tables[i] <- readHTMLTable(src[[1]], stringAsFactors = FALSE, encoding = "utf8")
}

## View(hr_tables)

remDr$close()
pJS$stop()

year <- seq(1990, 2014)
for (i in 1:length(year)) {
  hr_table <- hr_tables[[i]]
  names2 <- names(hr_table)
  names2 <- c("NUMBER", "YEAR", "GID", "DATE", "STADIUM", "BATTER", "BATTERTEAM", "PITCHER", "PITCHERTEAM", "RBI", "REMARK")
  names(hr_table) <- names2
  hr_tables[[i]] <- hr_table
}

save(hr_tables, file = "Documents//OpenDataProj//hr_tables.RData")
