#named Vectors
Aji<-1:5
Aji

#give names
names(Aji)<-c("a","b","c","d","e")
names(Aji)
Aji

#Now Aji is a named vector

Aji["d"]

#clear names

names(Aji)<-NULL
Aji



#Naming Matrix Dimensions 1
temp.vec<-rep(c("a","b","c"),3)
temp.vec

A<-matrix(temp.vec,3,3)
a
A

rownames(A)<-c("How","are","you")
A
colnames(A)<-c("A","B","C")
A


A["are","B"]<-0
A

rownames(A)<-NULL
A  
