## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
    #place holder for the matrix inverse
    matrix <- NULL
    #set the input matrix
    set <- function(y) {
        x <<- y
        matrix <<- NULL
    }
    #get the input matrix
    get <- function() {
        x
    }
    #set the inverse to the place holder
    setmatrix <- function(solve) {
        matrix <<- solve
    }
    #get the inverse
    getmatrix <- function() {
        matrix
    }
    list(set = set, get = get,
         setmatrix = setmatrix,
         getmatrix = getmatrix)        
}


## Write a short comment describing this function
#computes the inverse of the input matrix
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getmatrix()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    #no cache found, get the input matrix
    data <- x$get()
    #compute the inverse
    m <- solve(data, ...)
    #set the inverse to the cache
    x$setmatrix(m)
    m
}
