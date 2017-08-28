#Data inport
Chicago<-read.csv(file.choose(),row.names = 1)
NewYork<-read.csv(file.choose(),row.names = 1)
Houston<-read.csv(file.choose(),row.names = 1)
SanFrancisco<-read.csv(file.choose(),row.names = 1)

#Check
Chicago
NewYork
Houston
SanFrancisco
#These are Data Frames
is.data.frame(Chicago)
#Converting to matrices

Chicago<-as.matrix(Chicago)
NewYork<-as.matrix(NewYork)
SanFrancisco<-as.matrix(SanFrancisco)
Houston<-as.matrix(Houston)

#Check
is.matrix(Chicago)

#Lists

Weather<-list(Chicago=Chicago,NewYork=NewYork,Houston=Houston,SanFrancisco=SanFrancisco)
Weather
Weather[[3]]
Weather$Houston

#Apply functions
?apply

apply(Chicago,1,mean)

apply(Chicago,1,max)
apply(Chicago,1,min)
apply(Chicago,2,mean)

#Compare
apply(Chicago,1,mean)
apply(NewYork,1,mean)
apply(SanFrancisco,1,mean)
apply(Houston,1,mean)

#Apply using bacic for loops
output<-NULL
for(i in 1:5){
  output[i]<-mean(Chicago[i,])
}
output
names(output)<-rownames(Chicago)
output

#Sames can be done using
apply(Chicago,1,mean)

#lapply returns a list
?lapply
Chicago
t(Chicago)
Weather
#1. Transpose a list
lapply(Weather,t) #list(t(Weather$Chicago),t(Weather$SanFrancisco),t(Weather$Houston),t(Weather$NewYork))

newlist<-lapply(Weather,t)


rbind(Chicago,NewRow=1:12)
# 2. adding a new row to list
lapply(Weather,rbind,NewRow=1:12)

# 3. rowmeans
?rowMeans
rowMeans(Chicago)
lapply(Weather,rowMeans)

#rowMeans
#colMeans
#rowSums
#colSums

#Combining lapply with []
Weather
Weather[[1]][1,1]
Weather$Chicago[1,1]

lapply(Weather,"[",1,1)
lapply(Weather,"[",1,)
lapply(Weather,"[",,3)
  

#Adding Functions
lapply(Weather,rowMeans)
lapply(Weather,function(x)x[1,]) #GIves the first row

lapply(Weather,function(x)x[5,]) #GIves the fifth row
lapply(Weather,function(x)x[,12]) #GIves the dec column

lapply(Weather,function(z)z[1,]-z[2,])
lapply(Weather,function(z)round((z[1,]-z[2,])/z[2,],2))#Tempearture Fluctuations

#sapply
?sapply
Weather
#AvgHigh_F for july
lapply(Weather,"[",1,7)
sapply(Weather,"[",1,7)#Returns a vector

#AvgHigh_F for 4th quater
lapply(Weather,"[",1,10:12)
sapply(Weather,"[",1,10:12)

lapply(Weather,rowMeans)
sapply(Weather,rowMeans)
round(sapply(Weather,rowMeans),2)

lapply(Weather,function(z)round((z[1,]-z[2,])/z[2,],2))
sapply(Weather,function(z)round((z[1,]-z[2,])/z[2,],2))

sapply(Weather,rowMeans,simplify = FALSE) #same as lapply

#Nesting apply functions
Weather
lapply(Weather,rowMeans)
#Row maximums
Chicago
apply(Chicago,1,max)
lapply(Weather,function(x)apply(x,1,max))
sapply(Weather,function(x)apply(x,1,max))

lapply(Weather,apply,1,max)


#Final
sapply(Weather,apply,1,max)
sapply(Weather,apply,1,min)

#Which.max specifies the location
?which.max
which.max(Chicago[1,])
names(which.max(Chicago[1,]))
apply(Chicago,1,function(x)names(which.max(x)))
lapply(Weather,function(x)apply(x,1,function(y)names(which.max(y))))
sapply(Weather,function(x)apply(x,1,function(y)names(which.max(y))))




