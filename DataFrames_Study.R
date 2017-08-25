#Selecting the file manually
stats<- read.csv(file.choose())

#Method 2 Set working working directory and Read data

getwd()

setwd("D:\\Udemy\\R\\Section 5\\DataFrames")
rm(stats)
stats<-read.csv("DemographicData.csv")
stats



# Data Exploring
stats
nrow(stats)
ncol(stats)
#imported 195 rows and 5 columns
head(stats)

tail(stats)

head(stats,n=10)

tail(stats,n=10)
#str structure: a quick description
str(stats)
#runif() random numbers with uniform distribution
runif(stats)
#summary
summary(stats)


#Using the $
head(stats)
stats[3,3]
stats[3,"Birth.rate"]
stats[,"Internet.users"]
stats$Internet.users
stats$Internet.users[2]

levels(stats$Income.Group)

# Basic operation with a DF
stats[,1:5]
stats[1:10,]
stats[c(3,100),]

stats[1,]
is.data.frame(stats[1,])
is.data.frame(stats[,1])
is.data.frame(stats[,1,drop=F])


stats$Birth.rate*stats$Internet.users
stats$Birth.rate+stats$Internet.users

stats$mycol<-stats$Birth.rate*stats$Internet.users
head(stats)


stats$abc<-1:5
head(stats)

stats$abc<-NULL
stats$mycol<-NULL
head(stats)


#filtering dataframes

head(stats)
filter<-stats$Internet.users<2
stats[filter,]


stats[stats$Birth.rate>40,]
stats[stats$Birth.rate>40 & stats$Internet.users<2,]

stats[stats$Income.Group=="High income",]

stats[stats$Country.Name=="Malta",]

#Qplot
library(ggplot2)
qplot()


qplot(data=stats,x=Internet.users)
qplot(data=stats,x=Income.Group,y=Birth.rate)
qplot(data=stats,x=Income.Group,y=Birth.rate,size =3)
qplot(data=stats,x=Income.Group,y=Birth.rate,size =I(10),color=I("Blue"))
qplot(data=stats,x=Income.Group,y=Birth.rate,geom="boxplot")

#Visualisation
qplot(data=stats,x=Internet.users,y=Birth.rate)
qplot(data=stats,x=Internet.users,y=Birth.rate,size=I(4),color=I("Red"))
qplot(data=stats,x=Internet.users,y=Birth.rate,size=I(4),color=Income.Group)



#Creating a DataFrames
mydf<-data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
mydf
head(mydf,10)
colnames(mydf)<-c("Country","Code","Region")
head(mydf)

rm(mydf)


mydf<-data.frame(Country=Countries_2012_Dataset,Code=Codes_2012_Dataset,Region=Regions_2012_Dataset)

head(mydf)
summary(mydf)


#Merging Data Frames
head(stats)
head(mydf)

merged<-merge(stats,mydf,by.x = "Country.Code",by.y = "Code")
head(merged)

merged$Country<-NULL
head(merged)

#Final Visualisation
qplot(data = merged,x=Internet.users,y=Birth.rate)
qplot(data = merged,x=Internet.users,y=Birth.rate,color=Region)

#shapes
qplot(data = merged,x=Internet.users,y=Birth.rate,color=Region,size=I(5),shape=I(23))

#Transparency (alpha)
qplot(data = merged,x=Internet.users,y=Birth.rate,color=Region,size=I(5),
      shape=I(19),alpha=I(0.6))
#Title(main)
qplot(data = merged,x=Internet.users,y=Birth.rate,color=Region,size=I(5),
      shape=I(19),alpha=I(0.6),main = "Birth Rate vs Internet Users")
