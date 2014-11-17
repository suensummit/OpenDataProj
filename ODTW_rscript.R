setwd("Documents/OpenDataProj/")

lai <- read.csv("第1屆臺南市市長參選人賴清德.csv", header = F)
chu <- read.csv("第1屆新北市市長參選人朱立倫.csv", header = F)

lai$V1 <- as.Date(lai$V1, format = "%Y-%m-%d")
chu$V1 <- as.Date(chu$V1, format = "%Y-%m-%d")

lai2 <- lai["2012-12-31" > lai$V1 & lai$V1 > "2010-01-01",]
chu2 <- chu["2012-12-31" > chu$V1 & chu$V1 > "2010-01-01",]

ggplot(lai2, aes(x = V1, y = V2)) + geom_line() + scale_x_date() + xlab("") + ylab("Daily Campaign")
ggplot(chu2, aes(x = V1, y = V2)) + geom_line() + scale_x_date() + xlab("") + ylab("Daily Campaign")
