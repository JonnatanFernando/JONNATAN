## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# These Function will obtain the inverse matrix that is stored in a special "matrix"

makeCacheMatrix <- function(x = matrix()) {  #Create a function called makeCacheMatrix
  minv <- NULL            #create an space were the information will be stored, NULL is used because the value is undefined
  #This part of the function assign a value to an object in an environment that is different from the current environment
  # (Information take it from the R example in Coursera) 
  
   set <- function(y) {
    x <<- y
    minv <<- NULL
   }
   
  get <- function() x
  setinverse <- function(inverse) m <<- inverse   # assigns to a parent environment
  getinverse <- function() minv   #get the value
  list(set = set, get = get,   #the list of the diferent actions to create the matrix, get the matrix, crete the inverse and get the inverse
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
#The following function calculates the inverse of the special "matrix"
#created with the above function. However, it first checks to see if the
#inverse has already been calculated. If so, it `get`s the inverse from the
#cache and skips the computation. Otherwise, it calculates the inverse using th function solve

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
       minv <- x$getinverse()
       if(!is.null(minv)) {
            message("getting cached data")
            return(minv)
         }
        data <- x$get()
        Minv <- solve(data, ...)
        x$setinverse(minv)
        minv
}
