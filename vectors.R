firstVector<-c(3,4,5,6)
is.numeric(firstVector)
is.integer(firstVector)#integers are stored as double
is.double(firstVector)

v2<-c(12L,13L,2L)
is.integer(v2)


v3<-c("a","b","d")

v4<-c("a","b","d",7) #7 will be also considered as a character
v4

seq() #sequence -like ":"
rep() #replicate

seq(1,15) # inside function use comma
1:15

seq(1,15,2) #2 is the step

z<-seq(1,15,4)
z


rep(3,50)
d<-rep(3,50)

rep("d",10)

x<-c(80,20)
y<-rep(x,10)
y
  
x<-c(45,50,64)
x[1]
x[2]


w<-c("c","d","e")
w[1]
w[-1]
w[-3]
v<-w[-3]
w[1:3]
w[3:5]
w[c(1,3,5)]
w[c(-2,-4)]

#Vectorized operations

x<-rnorm(5)
x
# R specific programming loop
for(i in x){
  print(i)
}


print(x[1])

#conventional programming loop
for(j in 1:5){
print(x[j])
}



########

N<-100
a<-rnorm(N)
b<-rnorm(N)

#vectorized approach
c<-a*b


#de-vectorized approach

d<-rep(NA,N)

for(i in 1:N){
  d[i]<-a[i]*b[i]
}