#Loading the data and basic data exploration
util <- read.csv(file.choose(),na.strings = NA)
head(util,24)
str(util)
summary(util)
nrow(util)

#Derive utilisation column
util$Utilization<-1-util$Percent.Idle
head(util)

#handling Date-TImes 
tail(util)
# To find whether if the date is in UK or US(mm/dd/yyyy) format 
?POSIXct
util$PosixTime<-as.POSIXct(util$Timestamp,format="%d/%m/%Y %H:%M")
head(util)
summary(util)


#Rearrange the column
util$Timestamp<-NULL
head(util)
util<-util[,c(4,1,2,3)]
head(util)

#lists
RL1<-util[util$Machine=="RL1",]
head(util)
head(RL1)
summary(RL1)
RL1$Machine<-factor(RL1$Machine)#To remove the temp memory
summary(RL1)

util_stats_rl1<-c(min(RL1$Utilization,na.rm=TRUE),mean(RL1$Utilization,na.rm=TRUE),
                  max(RL1$Utilization,na.rm=TRUE))
summary(RL1)
util_stats_rl1


which(RL1$Utilization<0.90)

length(which(RL1$Utilization<0.90))

util_under_90_flag<-length(which(RL1$Utilization<0.90))>0
util_under_90_flag

list_rl<-list("RL1",util_stats_rl1,util_under_90_flag)
list_rl

#Naming the components of LIsts
names(list_rl)
names(list_rl)<-c("Machine","Stats","LowThreshold")
list_rl

#Another way
rm(list_rl)
list_rl
list_rl<-list(Machine="RL1",Stats=util_stats_rl1,LowThreshold=util_under_90_flag)
list_rl

#Extracting the components of a lists
#[] will always returns a list
#[[]] will always return actual object
#$ sames as [[]] 

list_rl
list_rl[1]
list_rl[[1]]
list_rl$Machine


list_rl[2]
typeof(list_rl[2])
list_rl[[2]]
typeof(list_rl[[2]]) #double
list_rl$Stats
typeof(list_rl$Stats)


#How to access the third element of the vector(max)
list_rl$Stats[3]
list_rl[[2]][3]


#Adding and deleting list components
list_rl
list_rl[4]<-"New Information"
list_rl

#Another way
RL1
RL1[is.na(RL1$Utilization),"PosixTime"]
list_rl$UnknownHours<-RL1[is.na(RL1$Utilization),"PosixTime"]
list_rl

#Removing componets...numeration will be shifted
#list_rl$UnknownHours<-NULL
list_rl
list_rl[4]<-NULL
list_rl

list_rl$Data<-RL1
list_rl
summary(list_rl)
str(list_rl)


#Subsetting
list_rl[[4]][1]
list_rl$UnknownHours[1]
list_rl[1]
list_rl[1:3]
list_rl[c(1,4)]

sublist_rl<-list_rl[c("Machine","Stats")]
sublist_rl
sublist_rl[2]

#Double square brackets is for accessing the list 


#TimeSeries plot
library(ggplot2)
p<- ggplot(data = util)
p+geom_line(aes(x=PosixTime,y=Utilization,color=Machine),size=1.2)+
  facet_grid(Machine~.)+geom_hline(yintercept = 0.9,color='Gray',size=1.2,linetype=3)

myplot<-p+geom_line(aes(x=PosixTime,y=Utilization,color=Machine),size=1.2)+
  facet_grid(Machine~.)+geom_hline(yintercept = 0.9,color='Gray',size=1.2,linetype=3)
myplot
#Adding the plot to the list
list_rl$Plot<-myplot
list_rl

summary(list_rl)
str(list_rl)
