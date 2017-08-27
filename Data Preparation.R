fin <- read.csv(file.choose())
fin <- read.csv(file.choose(),na.strings = c(""))
# fin <- read.csv("Future-500.csv")

#Basic Explorations
head(fin,10)
tail(fin,10)
str(fin)
summary(fin)

#Changing nonFactor to Factor

fin$ID<-factor(fin$ID)
summary(fin)
str(fin)

fin$Inception<-factor(fin$Inception)
summary(fin)
str(fin)

#factor variable Trap
a<-c("12","1","14","17","19")
a
typeof(a)
b<-as.numeric(a)
b
typeof(b)
#Converting into Numerics for Factors
z<-factor(a<-c("12","1","14","12","12"))
z
typeof(z)
y<-as.numeric(z)
y
typeof(y)# factor variable trap

#Correct way: First convert it inot charcter variable 
#then to numeric to avoid the factor variable trap as shown below
x<-as.numeric(as.character(z))
x
typeof(x)

#FVT Example
#For example profit is considered as factor

#fin$Profit<-factor(fin$Profit)
head(fin)
str(fin)

#fin$Profit<-as.numeric(fin$Profit) #FVT... this is "wrong" this cant be redone 
head(fin)
str(fin)

#sub() and gsub()
#Expenses
fin$Expenses<-gsub(" Dollars","",fin$Expenses)
head(fin)
fin$Expenses<-gsub(",","",fin$Expenses)
head(fin)
str(fin)

#Revenue
fin$Revenue<-gsub("\\$","",fin$Revenue) # "\\$ is used as $ is considered as a spl character
head(fin)
fin$Revenue<-gsub(",","",fin$Revenue)
head(fin)
str(fin)

#Growth
fin$Growth<-gsub("%","",fin$Growth)
head(fin)
str(fin)
#gsub converts it into char
#Converting character to numeric

fin$Expenses<-as.numeric(fin$Expenses)
fin$Revenue<-as.numeric(fin$Revenue)
fin$Growth<-as.numeric(fin$Growth)

head(fin)
str(fin)

#what is NA

summary(fin)

# Locating the missing data
head(fin,24)

fin[!complete.cases(fin),] #returns True or false if the row elements are filled or not
#fin <- read.csv(file.choose(),na.strings = c("")) is added in the top

str(fin)


#filtering using which() for missing data
head(fin)
fin[fin$Revenue==9746272,]
which(fin$Revenue==9746272)
fin[which(fin$Revenue==9746272),]

head(fin)
fin[which(fin$Employees==45),]


#filtering using the .na() for missing data
head(fin)

a<-c(1,24,45,NA,789)
is.na(a)

is.na(fin$Expenses)
fin[is.na(fin$Expenses),]


#Removing records with missing data
#Industry
fin_backup<-fin
fin<-fin_backup
fin[!complete.cases(fin),]
fin[is.na(fin$Industry),]
fin[!is.na(fin$Industry),]

fin<-fin[!is.na(fin$Industry),]
fin
fin[!complete.cases(fin),]


#Resetting the dataframe
rownames(fin)<-1:nrow(fin)
fin

rownames(fin)<-NULL
fin

#Replacing missing data with factual analysis States with NA values can be replaced by knowing the City
#State

fin[!complete.cases(fin),]

fin[is.na(fin$State),]

fin[is.na(fin$State)&fin$City=="New York",]
fin[is.na(fin$State)&fin$City=="New York","State"]<-"NY"

fin[is.na(fin$State)&fin$City=="San Francisco","State"]<-"CA"

fin[!complete.cases(fin),]


#Replacing the missing data with median
#Number of Employees
fin[!complete.cases(fin),]
#Retail
med_emp_retail<-median(fin[fin$Industry=="Retail","Employees"],na.rm = TRUE)
med_emp_retail

fin[is.na(fin$Employees)& fin$Industry=="Retail","Employees"]<-med_emp_retail
fin[3,]
#Financial Services
med_emp_Financial_Services <-median(fin[fin$Industry=="Financial Services","Employees"],na.rm = TRUE)
med_emp_Financial_Services
fin[is.na(fin$Employees)& fin$Industry=="Financial Services","Employees"]<-med_emp_Financial_Services
fin[!complete.cases(fin),]

#Construction and Growth
med_grwth_Construction <-median(fin[fin$Industry=="Construction","Growth"],na.rm = TRUE)
med_grwth_Construction

fin[is.na(fin$Growth)& fin$Industry=="Construction","Growth"]<-med_grwth_Construction
fin[!complete.cases(fin),]

#Construction and Revenue
med_Rev_Construction<-median(fin[fin$Industry=="Construction","Revenue"],na.rm = TRUE)
med_Rev_Construction
fin[is.na(fin$Revenue)& fin$Industry=="Construction","Revenue"]<-med_Rev_Construction
fin[!complete.cases(fin),]
#Construction and Expenses
med_Exp_Construction<-median(fin[fin$Industry=="Construction","Expenses"],na.rm = TRUE)
med_Exp_Construction
fin[is.na(fin$Expenses)& fin$Industry=="Construction"&is.na(fin$Profit),"Expenses"]<-med_Exp_Construction
fin[!complete.cases(fin),]

#Replacinf missing data using derived values
fin[is.na(fin$Profit),"Profit"]<-fin[is.na(fin$Profit),"Revenue"]-fin[is.na(fin$Profit),"Expenses"]
fin[!complete.cases(fin),]

fin[is.na(fin$Expenses),"Expenses"]<-fin[is.na(fin$Expenses),"Revenue"]-fin[is.na(fin$Expenses),"Profit"]
fin[!complete.cases(fin),]


#Scatterplot
library(ggplot2)

p<-ggplot(data = fin)
p
p+geom_point(aes(x=Revenue,y=Expenses,color=Industry,size=Profit))

d<-ggplot(data = fin,aes(x=Revenue,y=Expenses,color=Industry,size=Profit))
d+geom_point()+
  geom_smooth(fill=NA,size=1.2)


#Boxplot
f<-ggplot(data=fin,aes(x=Industry,y=Growth,color=Industry))
f+geom_jitter()+
  geom_boxplot(size=1,alpha=0.6,outlier.colour = NA)