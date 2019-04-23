
### Connecting and listing databases
ucscDb<-dbConnect(MySQL(), user="genome",host="genome-mysql.soe.ucsc.edu")
result<-dbGetQuery(ucscDb, "SHOW DATABASES")

dbDisconnect(ucscDb)
result

### Connecting to hg19 and listing tables
hg19<- dbConnect(MySQL(), user="genome",db="hg19",host="genome-mysql.soe.ucsc.edu")
allTables<-dbListTables(hg19)
length(allTables)
allTables[1:5]

#Get dimensions of a specific table
dbListFields(hg19, "affyU133Plus2")

#Read from the table
dbGetQuery(hg19, "SELECT count(*) from affyU133Plus2")

## Read from the table
affyData<-dbReadTable(hg19, "affyU133Plus2")
head(affyData)

## Select a specific subset
query<- dbSendQuery(hg19, "SELECT * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <-fetch(query)
quantile(affyMis$ misMatches)

affyMisSmall <-fetch(query, n=10)  #top ten rows
dbClearResult(query)

dim(affyMisSmall)

#### Don't forget to close the connection!
dbDisconnect(hg19)

####################
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)
dbGetQuery(con, "SELECT * FROM mtcars")

dbDisconnect(con);

dbGetQuery(con, "SELECT * FROM USArrests")

con <- dbConnect(RSQLite::SQLite(), ":memory:")
data(USArrests)
dbWriteTable(con, "USArrests", USArrests)
dbListTables(con)
dbGetQuery(con, "SELECT * FROM USArrests")
