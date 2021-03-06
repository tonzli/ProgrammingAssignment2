## In order to reduce the time it takes to calculate matrix inverses,
## makeCacheMatrix caches the matrix and its inverse (if already calculated) in
## a list object, and cacheSolve returns the inverse. If the inverse is already
## calculated and cached, then cacheSolve returns the cached inverse. Otherwise,
## cacheSolve calculates the inverse and stores in the cache.


## makeCacheMatrix creates a list object that can store a matrix and it's
## inverse to cache. 
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(m) {
        x <<- m
        inv <<- NULL
    }
    get <- function() x
    setInv <- function(invert) inv <<- invert
    getInv <- function() inv
    
    list(set=set, get=get, setInv=setInv, getInv=getInv)
}

## cacheSolve solves the inverse of the matrix made in makeCacheMatrix.
## First checks whether the inverse is already calculated and cached. 
cacheSolve <- function(x, ...) {
    inv <- x$getInv()
    
    if(!is.null(inv)){
        message("Getting cached inverse")
        return(inv)
    }
    
    m <- x$get()
    inv <- solve(m, ...)
    x$setInv(inv)
    inv
}
