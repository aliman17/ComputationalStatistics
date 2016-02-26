## Computational Statistics -- R tutorial
## Author: Ales Omerzel
## Date: 26. 2. 2016
## Comment: Let's review some basics again

# getting started
z <- c( 8, 13, 21 )
2*z

# computing with vectors
fib <- c( 1, 1, 2, 3, 5, z )      # vector with 8 Fibonacci numbers
fib  
2*fib+1                           # element-wise operations
fib*fib                           # element wise multiplication
log(fib)                          # takes the log of each element
s <- 2*(1:3)                      # vector holding 2, 4, 6
s <- seq( 2, 6, by=2)             # same vector as s
s                      
fib[3]                            # third element of fib
fib[4:7]                          # 4th, 5th and 6th element of fib
fib[c(3,5)]                       # 3th and 5th element of fib
fib[-c(3,5)]                      # vector fib without 3th and 5th element
x <- c(1, -3, 5, -1, 8, 9, -2, 1) # new vector x
x > 0                             # elements 1, 3, 5, 6 and 8 of x are > 0
fib[x > 0]                        # elements 1, 3, 5, 6 adn 8 of fib

# metrices: creation and computation
x <- 1:4                          # vector x
y <- 5:8                          # vector y
mat1 <- cbind(x, y)               # [column bind] mat1 is a matrix; 1st column is x, 2nd column is y
mat1
mat2 <- rbind(x, y, x+y)          # [row bind] mat2 is a matrix: 1st row is x, 2nd row is y, 3th row is x+y
mat2
mat2[3,2]                         # returns element at position (3,2) which is 8
mat2[2,]                          # returns 2nd row, which is 5, 6, 7 and 8
mat2[,1]                          # returns 1st column, which is 1, 5 and 6

# metrices: aritmetics
mat2 %*% mat1                     # matrix product

# data frames (generalized matices, where every column can have different data type)

# reading and looking at datasets
no2 <- read.table( "http://stat.ethz.ch/Teaching/Datasets/no2Basel.dat", header=TRUE)
no2
no2[, "NO2"]                      # access "NO2" column
no2$NO2                           # access "NO2" column (option2, faster)
str(no2)                          # display structure of a table (name, data types, column elements)
summary(no2)                      # exstract most important info from objects (min, max, median, mean, quartiles)

# graphics
par(mfrow = c(1,2))               # number of pictures one below the other [1]
                                  # number of pictures side by side [2]
hist(no2$NO2)                     # plot histogram

# regression line of the NO2-content agains temperature
lm.T <- lm(NO2 ~ Temp, data = no2) # first regression
plot(NO2 ~ Temp, data = no2)
abline(lm.T, col = 4, lty = 2)    # col: colour, lty=2: dashed line
summary(lm.T)                     # regression summary
title("First sample plot")        # add title to the graphics

# help
help(plot)                        # opens documentation
?plot                             # opens documentation (option 2, faster)
example(plot)                     # plot the example at the end of the plot documentation
help.search("histogram")          # returns list of functions correspond to the keyword
# require(package)                # load a package

# end
write.table                       # save environment variables
# q()                             # quit R session