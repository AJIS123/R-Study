x<-c("a","b","c","d","e")
x
x[c(1,5)]
x[1]

Games

Games[1:3,6:10]

Games[c(1,10),]

Games[,c("2008","2009")]

#Visualisation
Data<-MinutesPlayed[1:3,]
matplot(t(Data),type="b",pch=15:18,col=c(1:4,6))
legend("bottomleft",inset = 0.01,legend = Players[1:3],col=c(1:4,6),pch=15:18,horiz=FALSE)

Data<-MinutesPlayed[1,,drop=F] # the drop is used so that its not consider as a vector
matplot(t(Data),type="b",pch=15:18,col=c(1:4,6))
legend("bottomleft",inset = 0.01,legend = Players[1],col=c(1:4,6),pch=15:18,horiz=FALSE)
