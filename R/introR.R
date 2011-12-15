
# Chapter: Introduction to R
# All code released under GPL Version 3

getOption("defaultPackages")

2 + 3       # add
4 * 5 / 6   # multiply and divide
7^8         # 7 to the 8th power

options(digits = 16)
10/3                 # see more digits
sqrt(2)              # square root
exp(1)               # Euler's constant, e
pi       
options(digits = 7)  # back to default

x <- 7*41/pi   # don't see the calculated value
x              # take a look

sqrt(-1)              # isn't defined
sqrt(-1+0i)           # is defined
sqrt(as.complex(-1))  # same thing
(0 + 1i)^2            # should be -1
typeof((0 + 1i)^2)

x <- c(74, 31, 95, 61, 76, 34, 23, 54, 96)
x

seq(from = 1, to = 5)
seq(from = 2, by = -0.1, length.out = 4)

1:5

x[1]
x[2:4]
x[c(1,3,4,8)]
x[-c(1,3,4,8)]

LETTERS[1:5]
letters[-(6:24)]

x <- 1:5
sum(x)
length(x)
min(x)
mean(x)      # sample mean
sd(x)        # sample standard deviation

intersect

rev

methods(rev)

rev.default

wilcox.test
methods(wilcox.test)

exp
