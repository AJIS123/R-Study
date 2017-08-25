movies<-read.csv(file.choose())
head(movies)
colnames(movies)<-c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")
head(movies)
tail(movies)
str(movies)
summary(movies)

#Factors
factor(movies$Year)
movies$Year<-factor(movies$Year)
summary(movies)
str(movies)


#Aesthetics
library(ggplot2)

ggplot(data = movies,aes(x=CriticRating,y=AudienceRating))

#add geometry
ggplot(data = movies,aes(x=CriticRating,y=AudienceRating))+geom_point()

#Add color
ggplot(data = movies,aes(x=CriticRating,y=AudienceRating,color=Genre))+
  geom_point()

#Add size
ggplot(data = movies,aes(x=CriticRating,y=AudienceRating,color=Genre,size=Genre))+
  geom_point()

#add size modified
ggplot(data = movies,aes(x=CriticRating,y=AudienceRating,color=Genre,size=BudgetMillions))+
  geom_point()

#plotting with Layers
p<-ggplot(data = movies,aes(x=CriticRating,y=AudienceRating,color=Genre,size=BudgetMillions))


#points
p+ geom_point()
#lines
p+geom_line()
#multiple
p+geom_point()+geom_line()
p+geom_line()+geom_point()


#Overriding Aesthetics
q<-ggplot(data = movies,aes(x=CriticRating,y=AudienceRating,color=Genre,size=BudgetMillions))

#Adding geom layer
q+geom_point()

#Overiding aes
#1
q+geom_point(aes(size=CriticRating))

#2
q+geom_point(aes(color=BudgetMillions))


#q remains sames
q+geom_point()

#3
q+geom_point(aes(x=BudgetMillions))+xlab("Budget Millions $$$")
#4
q+geom_line(size=1)+geom_point()


#mapping vs Setting
r<- ggplot(data=movies, aes(x=CriticRating,y=AudienceRating))
r+geom_point()


#Addin color
#1 Mapping
r+geom_point(aes(color=Genre)) #aes is used if we need to color a particular column   
#2Setting
r+geom_point(color="DarkGreen")


#1 Mapping
r+geom_point(aes(size=BudgetMillions))
#2 Setting
r+geom_point(size=5)


#Histograms and density charts
s<-ggplot(data=movies,aes(x=BudgetMillions))
s+geom_histogram(binwidth = 10)

#add color
s+geom_histogram(binwidth = 10,aes(fill=Genre))

#Add border
s+geom_histogram(binwidth = 10,aes(fill=Genre),color="Black")

#Density Charts
s+geom_density(aes(fill=Genre),position = "stack")


#Layer Tips

t<-ggplot(data=movies,aes(x=AudienceRating))
t+geom_histogram(binwidth = 10,fill="White",color="Blue")

#Another way
t<-ggplot(data = movies)
t+geom_histogram(binwidth = 10,aes(x=AudienceRating),fill="White",color="Blue")


t+geom_histogram(binwidth = 10,aes(x=CriticRating),fill="White",color="Blue")

t<-ggplot()

#Statistical transformation
#geom_smooth

u<-ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,color=Genre))
u+geom_point()+geom_smooth(fill=NA)


#boxplots
u<-ggplot(data=movies,aes(x=Genre,y=AudienceRating,color=Genre))
u+geom_boxplot()
u+geom_boxplot(size=1.2)
u+geom_boxplot(size=1.2)+geom_point()

u+geom_boxplot(size=1.2)+geom_jitter()

u+geom_jitter()+geom_boxplot(size=1.2,alpha=.5)

a<-ggplot(data=movies,aes(x=Genre,y=CriticRating,color=Genre))
a+geom_jitter()+geom_boxplot(size=1.2,alpha=.5)


#Facets
v<-ggplot(data=movies,aes(x=BudgetMillions))
v+geom_histogram(binwidth = 10,
                 aes(fill=Genre),
                 color="Black")
#using facets
v+geom_histogram(binwidth = 10,
                 aes(fill=Genre),
                 color="Black")+
  facet_grid(Genre~.,scales="free")

#Scatterplots
w<-ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,color=Genre))
w+geom_point(size=3)

#facets
w+geom_point(size=3)+
  facet_grid(Genre~.)
w+geom_point(size=3)+
  facet_grid(.~Year)
w+geom_point(size=3)+
  facet_grid(Genre~Year)

w+geom_point(size=3)+geom_smooth()+
  facet_grid(Genre~Year)

#Coordinate...limits.....zoom
m<-ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,
                          size=BudgetMillions,color=Genre))
m+geom_point()

m+geom_point()+xlim(50,100)+ylim(50,100)


n<-ggplot(data=movies,aes(x=BudgetMillions))  
n+geom_histogram(binwidth = 10,aes(fill=Genre),color="Black")
n+geom_histogram(binwidth = 10,aes(fill=Genre),color="Black")+
  ylim(0,50)
n+geom_histogram(binwidth = 10,aes(fill=Genre),color="Black")+
  coord_cartesian(ylim = c(0,50))



w+geom_point(aes(size=BudgetMillions))+geom_smooth()+
  facet_grid(Genre~Year)+ coord_cartesian(ylim=c(0,100))


#Themes

o<-ggplot(data=movies,aes(x=BudgetMillions))
h<-o+geom_histogram(binwidth = 10,aes(fill=Genre),color="Black")

#labels
h+xlab("Money Axis")+ylab("Number of Movies")
h+xlab("Money Axis")+ylab("Number of Movies")+
  theme(axis.title.x=element_text(color="Dark Green",size = 30),
        axis.title.y=element_text(color="Red",size = 30))
#tick mark formatting
h+xlab("Money Axis")+ylab("Number of Movies")+
  theme(axis.title.x=element_text(color="Dark Green",size = 30),
        axis.title.y=element_text(color="Red",size = 30),
        axis.text.x=element_text(size = 20),
        axis.text.y=element_text(size = 20))

#legend Formatting

h+xlab("Money Axis")+ylab("Number of Movies")+
  theme(axis.title.x=element_text(color="Dark Green",size = 30),
        axis.title.y=element_text(color="Red",size = 30),
        axis.text.x=element_text(size = 20),
        axis.text.y=element_text(size = 20),
        legend.title=element_text(size = 30),
        legend.position=c(1,1),
        legend.justification=c(1,1))
#title

h+xlab("Money Axis")+ylab("Number of Movies")+
  ggtitle("Movie Budget Distribution")+
  theme(axis.title.x=element_text(color="Dark Green",size = 30),
        axis.title.y=element_text(color="Red",size = 30),
        axis.text.x=element_text(size = 20),
        axis.text.y=element_text(size = 20),
        legend.title=element_text(size = 30),
        legend.position=c(1,1),
        legend.justification=c(1,1),
        plot.title=element_text(color="DarkBlue",size = 40,
                                family = "Courier"))
