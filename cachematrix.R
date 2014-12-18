## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# makeCacheMatrix is a function that returns a list of functions
# Its puspose is to store a martix and a cached value of the inverse of the 
  # matrix. Contains the following functions:
  # * setMatrix      set the value of a matrix
  # * getMatrix      get the value of a matrix
  # * cacheInverse   get the cahced value (inverse of the matrix)
  # * getInverse     get the cahced value (inverse of the matrix)
  #

makeCacheMatrix <- function(x = numeric()) {
          
            # holds the cached value or NULL if nothing is cached
            
            cache <- NULL
          
            # The setmatrix function is used to store a matrix
            
            setMatrix <- function(newValue) {
                      x <<- newValue
                      # Flush the cache since  a new value is assigned to Matrix
                        cache <<- NULL
              }
  
            # The getmatrix function returns the stored matrix
            
            getMatrix <- function() {
                      x
              }
            
            # This code caches the given argument 
                    cacheInverse <- function(solve) {
                              cache <<- solve
                      }
            
            # This code is to get the cached value
                      getInverse <- function() {
                                cache
                        }
                    
                      # Below step returns a list
            
                      list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
            }
  

# The following function calculates the inverse of  matrix created by above function

  cacheSolve <- function(y, ...) {
            # get the cached value
              
              inverse <- y$getInverse()
              
            # if a cached value exists return that value
            
              if(!is.null(inverse)) {
                        message("fetching cached data")
                        return(inverse)
                }
            # if not then get the matrix, caclulate the inverse and store it in cache
              
              data <- y$getMatrix()
            inverse <- solve(data)
            y$cacheInverse(inverse)
            
              # return the inverse of matrix
              inverse
    }
