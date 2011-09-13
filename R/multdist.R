
library(prob)

library(prob)  
S <- rolldie(2, makespace = TRUE)
S <- addrv(S, FUN = max, invars = c("X1","X2"), name = "U")
S <- addrv(S, FUN = sum, invars = c("X1","X2"), name = "V")
head(S)

UV <- marginal(S, vars = c("U", "V"))
head(UV)

xtabs(round(probs,3) ~ U + V, data = UV)

marginal(UV, vars = "U")
head(marginal(UV, vars = "V"))

temp <- xtabs(probs ~ U + V, data = UV)
rowSums(temp)
colSums(temp)

Eu <- sum(S$U*S$probs)
Ev <- sum(S$V*S$probs)
Euv <- sum(S$U*S$V*S$probs)
Euv - Eu * Ev

library(mvtnorm)
x <- y <- seq(from = -3, to = 3, length.out = 30)
f <- function(x,y) dmvnorm(cbind(x,y), mean = c(0,0), sigma = diag(2))
z <- outer(x, y, FUN = f)
persp(x, y, z, theta = -30, phi = 30, ticktype = "detailed")

library(mvtnorm)
x <- y <- seq(from = -3, to = 3, length.out = 30)
f <- function(x,y) dmvnorm(cbind(x,y), mean = c(0,0), sigma = diag(2))
z <- outer(x, y, FUN = f)
persp(x, y, z, theta = -30, phi = 30, ticktype = "detailed")

postscript(file="ps/mvnorm-pdf.ps")
  library(mvtnorm)
  x <- y <- seq(from = -3, to = 3, length.out = 30)
  f <- function(x,y) dmvnorm(cbind(x,y), mean = c(0,0), sigma = diag(2))
  z <- outer(x, y, FUN = f)
  persp(x, y, z, theta = -30, phi = 30, ticktype = "detailed")
dev.off()

svg(file="svg/mvnorm-pdf.svg")
  library(mvtnorm)
  x <- y <- seq(from = -3, to = 3, length.out = 30)
  f <- function(x,y) dmvnorm(cbind(x,y), mean = c(0,0), sigma = diag(2))
  z <- outer(x, y, FUN = f)
  persp(x, y, z, theta = -30, phi = 30, ticktype = "detailed")
dev.off()

library(combinat)

library(combinat)
tmp <- t(xsimplex(3, 6))
p <- apply(tmp, MARGIN = 1, FUN = dmultinom, prob = c(36,27,37))
library(prob)
S <- probspace(tmp, probs = p)
ProbTable <- xtabs(probs ~ X1 + X2, data = S)
round(ProbTable, 3)

library(lattice)
print(cloud(probs ~ X1 + X2, data = S, type = c("p","h"), lwd = 2, 
            pch = 16, cex = 1.5), screen = list(z = 15, x = -70))

postscript(file="ps/multinom-pmf2.ps")
  library(lattice)
  print(cloud(probs ~ X1 + X2, data = S, type = c("p","h"), lwd = 2, 
              pch = 16, cex = 1.5), screen = list(z = 15, x = -70))
dev.off()

svg(file="svg/multinom-pmf2.svg")
  library(lattice)
  print(cloud(probs ~ X1 + X2, data = S, type = c("p","h"), lwd = 2, 
              pch = 16, cex = 1.5), screen = list(z = 15, x = -70))
dev.off()
