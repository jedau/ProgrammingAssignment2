###################################################################################################

## R Programming (rprog-005) Peer Assesment : Lexical Scoping
## Jed Aureus Gonzales
## https://github.com/jedau/

#cachematrix.R file description:
# - Forked from https://github.com/rdpeng/ProgrammingAssignment2 as part of the
#   requirement of the peer assesment assignment.
# - Has two (2) main functions: makeCacheMatrix and cacheSolve
# - makeCacheMatrix subfunctions:
#       * GetMatrix: returns the cached matrix
#       * SetMatrix: assigns a new matrix to the cache
#       * GetInverse: returns the inverse of the cached matrix
#       * SetInverse: assigns the inverse of the new matrix to the cache

###################################################################################################



makeCacheMatrix <- function(cache = matrix()) {
    # Contains subfunctions for the manipulation of the matrix.
    #
    # Args:
    #   cache: The matrix to be assigned into the cache
    #
    # Returns:
    #   A list of its subfunctions.
    inverse <- NULL
    # Get-Set functions for the matrix
    GetMatrix <- function() cache
    SetMatrix <- function(newMatrix) {
        cache <<- newMatrix
        inverse <<- NULL
    }
    # Get-Set functions for the inverse
    GetInverse <- function() inverse
    SetInverse <- function(solve) inverse <<- solve
    
    list(GetMatrix = GetMatrix, SetMatrix = SetMatrix, 
         GetInverse = GetInverse, SetInverse = SetInverse)
}


cacheSolve <- function(x, ...) {
    # Evaluates whether a given matrix has a cached inverse and returns it.
    # If there is none, it inverses the matrix and sets its value in the cache.
    #
    # Args:
    #   x: The matrix to be evaluated
    #
    # Returns:
    #   The inverse (or cached inverse) of x and puts it in the cache.
    inverse <- x$GetInverse()
    if(!is.null(inverse)) {
        message("Retrieving cached data. . .")
        return(inverse)
    }
    cached <- x$GetMatrix()
    inverse <- solve(cached, ...)
    x$SetInverse(inverse)
    inverse
}