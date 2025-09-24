#####
#Packages - downloading a software on your computer
#####
install.packages(DBI)
install.packages(RMySQL)
#####
#Libraries - execution of those packages 
#####
library (DBI)
library (RMySQL)

dbListTables(con)
#####
#Body of code
#####

con <- dbConnect (MySQL(), dbname='sec', user='root',
                 password='root', host='localhost')

# brah what is the password lmfao

myFirstQuery <- 'SELECT * FROM student;'
df <- dbGetQuery(con, myFirstqQuery)
str(df)
df

mySecondQuery <- dbGetQuery(con, 'SELECT * FROM studnet WHERE advID=11;')
mySecondQuery 

