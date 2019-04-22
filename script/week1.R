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

fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file ( fileUrl2, destfile = "./data/gas.xlsx" ,"curl" )
list.files("./data")
dateDownloaded <- date ( )
dateDownloaded

gas<-read.xlsx("./data/gas.xlsx",colNames = T,rows = 18:23,cols = 7:15)
sum(gas$Zip*gas$Ext,na.rm=T)

fileUrl3<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc<- xmlTreeParse(fileUrl3,useInternalNodes  =T)
rootNode<-xmlRoot(doc)


DT<- fread( "./data/housing.csv")
pwgtp15
