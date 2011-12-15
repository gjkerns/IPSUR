
# Chapter: Multivariate Distributions
# All code released under GPL Version 3

A <- rolldie(2, makespace = TRUE)
A <- addrv(A, max, name = "U")
A <- addrv(A, sum, name = "V", invars = c("X1", "X2"))
p1 <- ggplot(A, aes(x=X1, y=X2, label=U))
p1 <- p1 + geom_text(size = 6) + xlab("X1 = First roll") + 
      ylab("X2 = Second roll") + opts(title = "U = max(X1,X2)")
p2 <- ggplot(A, aes(x=X1, y=X2, label=V))
p2 <- p2 + geom_text(size = 6) + xlab("X1 = First roll") + 
      ylab("") + opts(title = "V = X1 + X2")
grid.newpage()
pushViewport(viewport(layout = grid.layout(1, 2)))
vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)
print(p1, vp = vplayout(1, 1))
print(p2, vp = vplayout(1, 2))

postscript(file="ps/multdist/max-and-sum-two-dice.ps")
  A <- rolldie(2, makespace = TRUE)
  A <- addrv(A, max, name = "U")
  A <- addrv(A, sum, name = "V", invars = c("X1", "X2"))
  p1 <- ggplot(A, aes(x=X1, y=X2, label=U))
  p1 <- p1 + geom_text(size = 6) + xlab("X1 = First roll") + 
        ylab("X2 = Second roll") + opts(title = "U = max(X1,X2)")
  p2 <- ggplot(A, aes(x=X1, y=X2, label=V))
  p2 <- p2 + geom_text(size = 6) + xlab("X1 = First roll") + 
        ylab("") + opts(title = "V = X1 + X2")
  grid.newpage()
  pushViewport(viewport(layout = grid.layout(1, 2)))
  vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)
  print(p1, vp = vplayout(1, 1))
  print(p2, vp = vplayout(1, 2))
dev.off()

svg(file="svg/multdist/max-and-sum-two-dice.svg")
  A <- rolldie(2, makespace = TRUE)
  A <- addrv(A, max, name = "U")
  A <- addrv(A, sum, name = "V", invars = c("X1", "X2"))
  p1 <- ggplot(A, aes(x=X1, y=X2, label=U))
  p1 <- p1 + geom_text(size = 6) + xlab("X1 = First roll") + 
        ylab("X2 = Second roll") + opts(title = "U = max(X1,X2)")
  p2 <- ggplot(A, aes(x=X1, y=X2, label=V))
  p2 <- p2 + geom_text(size = 6) + xlab("X1 = First roll") + 
        ylab("") + opts(title = "V = X1 + X2")
  grid.newpage()
  pushViewport(viewport(layout = grid.layout(1, 2)))
  vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)
  print(p1, vp = vplayout(1, 1))
  print(p2, vp = vplayout(1, 2))
dev.off()

labs <- with(A, paste("(", U, ",", V, ")", sep = ""))
p3 <- ggplot(A, aes(x = X1, y = X2, label = labs))
p3 + geom_text(size = 6) + xlab("First roll") + ylab("Second roll") + 
  opts(title = "Joint distribution of (U,V) pairs")

postscript(file="ps/multdist/max-sum-two-dice-joint.ps")
  labs <- with(A, paste("(", U, ",", V, ")", sep = ""))
  p3 <- ggplot(A, aes(x = X1, y = X2, label = labs))
  p3 + geom_text(size = 6) + xlab("First roll") + ylab("Second roll") + 
    opts(title = "Joint distribution of (U,V) pairs")
dev.off()

svg(file="svg/multdist/max-sum-two-dice-joint.svg")
  labs <- with(A, paste("(", U, ",", V, ")", sep = ""))
  p3 <- ggplot(A, aes(x = X1, y = X2, label = labs))
  p3 + geom_text(size = 6) + xlab("First roll") + ylab("Second roll") + 
    opts(title = "Joint distribution of (U,V) pairs")
dev.off()

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

x <- y <- seq(from = -3, to = 3, length.out = 30)
f <- function(x,y) dmvnorm(cbind(x,y), mean = c(0,0), sigma = diag(2))
z <- outer(x, y, FUN = f)
persp(x, y, z, theta = -30, phi = 30, ticktype = "detailed")

x <- y <- seq(from = -3, to = 3, length.out = 30)
f <- function(x,y) dmvnorm(cbind(x,y), mean = c(0,0), sigma = diag(2))
z <- outer(x, y, FUN = f)
persp(x, y, z, theta = -30, phi = 30, ticktype = "detailed")

postscript(file="ps/multdist/mvnorm-pdf.ps")
  x <- y <- seq(from = -3, to = 3, length.out = 30)
  f <- function(x,y) dmvnorm(cbind(x,y), mean = c(0,0), sigma = diag(2))
  z <- outer(x, y, FUN = f)
  persp(x, y, z, theta = -30, phi = 30, ticktype = "detailed")
dev.off()

svg(file="svg/multdist/mvnorm-pdf.svg")
  x <- y <- seq(from = -3, to = 3, length.out = 30)
  f <- function(x,y) dmvnorm(cbind(x,y), mean = c(0,0), sigma = diag(2))
  z <- outer(x, y, FUN = f)
  persp(x, y, z, theta = -30, phi = 30, ticktype = "detailed")
dev.off()

tmp <- t(xsimplex(3, 6))
p <- apply(tmp, MARGIN = 1, FUN = dmultinom, prob = c(36,27,37))
S <- probspace(tmp, probs = p)
ProbTable <- xtabs(probs ~ X1 + X2, data = S)
round(ProbTable, 3)

print(cloud(probs ~ X1 + X2, data = S, type = c("p","h"), lwd = 2, 
            pch = 16, cex = 1.5), screen = list(z = 15, x = -70))

postscript(file="ps/multdist/multinom-pmf2.ps")
  print(cloud(probs ~ X1 + X2, data = S, type = c("p","h"), lwd = 2, 
              pch = 16, cex = 1.5), screen = list(z = 15, x = -70))
dev.off()

svg(file="svg/multdist/multinom-pmf2.svg")
  print(cloud(probs ~ X1 + X2, data = S, type = c("p","h"), lwd = 2, 
              pch = 16, cex = 1.5), screen = list(z = 15, x = -70))
dev.off()
