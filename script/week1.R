if (!file.exists("data")){
  dir.create("data")
}

fileUrl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv "
download.file ( fileUrl, destfile = "./data/housing.csv" )
list.files("./data")
dateDownloaded <- date ( )
dateDownloaded

housedata<- read.csv("./data/housing.csv")
sum(housedata$VAL==24 ,na.rm =T)

fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx "
download.file ( fileUrl2, destfile = "./data/gas.xlsx" )
list.files("./data")
dateDownloaded <- date ( )
dateDownloaded

gas<-read.xlsx ("./data/gas.xlsx", header=TRUE)
