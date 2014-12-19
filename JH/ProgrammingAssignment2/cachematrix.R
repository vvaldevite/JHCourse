## @author: Victor Valdevite Pinto
## Create a cache of the inverse of a Matrix and returns this cache when avaiable


## Create a cache of the inverse of the matrix X

makeCacheMatrix <- function(x = matrix()) {
    inverted <- NULL
    
    setMatrix <- function(mat){
        x <<- mat
        inverted <<- NULL
    }
    getMatrix <- function() x
    
    getInverse <- function() inverted
    setInverse <- function(inv) inverted <<- inv
    
    list(setMatrix = setMatrix, getMatrix = getMatrix, setInverse = setInverse, getInverse = getInverse)
}


## Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
    inverted <- x$getInverse()
    
    if(is.null(inverted)){
        mat <- x$getMatrix()
        inv <- solve(mat, ...)
        x$setInverse(inv)
        inv
    } else {
        print("Getting inverted matrix...")
        x$getInverse()
    }
}
