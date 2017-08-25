#integer

x<-2L

typeof(x)

#double
y<-2.5
typeof(y)

#complex
z<-3+2i

typeof(z)


#Character
a<-"h"
typeof(a)


#logical Variables
q1<- T
typeof(q1)
q2<- FALSE

#Using Variable

A<-10
B<-5

c<-A+B

var1<-2.5
var2<-4

result <-var1/var2
result

answer<-sqrt(var2)
answer


greet<-"Hello"
name<-"Aji"
message<-paste(greet,name)
message

#Logical: 
# True T
# False F

4<5
4==5

result<- 4<5
result
typeof(result)

result2<-!(5>1)

result | result2

result & result2

isTRUE(result)


#While loop

while(TRUE){
  print("hello")
}


counter<-1
while(counter<12)
{
  print(counter)
  counter<-counter+1
}



#for loop
#1:5 is a vector has values 1,2,3,4,5
for(i in 1:5){
  print("hello")
}



#If 
rm(answer) #rm is to remove a variable
x<-rnorm(1)

if(x>1){
answer<-"between -1 and 1"

}else{
answer<-"less than 1"
}
