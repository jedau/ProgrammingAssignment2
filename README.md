### Introduction

*(Forked from [Roger Peng's repository](https://github.com/rdpeng/ProgrammingAssignment2) as part of the requirement)*

The second programming assignment required students to write an R function that is able to cache potentially time-consuming computations. The operation that was required was to cache matrix inversion operations. For the purpose of this exercise, the `solve` function was used for matrix inversion.

### Usage

Source the code in R and type in the following code:

	> mat <- matrix(c(1,2,3,1,0,0,0,1,0),3,3)
	> x <- makeCacheMatrix(mat)
	> summary(x)
	           Length Class  Mode
	GetMatrix  1      -none- function
	SetMatrix  1      -none- function
	GetInverse 1      -none- function
	SetInverse 1      -none- function
	> x$GetMatrix(x)
		[,1] [,2] [,3]
	[1,]    1    1    0
	[2,]    2    0    1
	[3,]    3    0    0
	> cacheSolve(x)
		[,1] [,2] [,3]
	[1,]    0    0    0.3333333
	[2,]    1    0 	  -0.3333333
	[3,]    0    1 	  -0.6666667

