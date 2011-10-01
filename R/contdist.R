
f <- function(x) 3*x^2
integrate(f, lower = 0.14, upper = 0.71)

g <- function(x) 3/x^3
integrate(g, lower = 1, upper = Inf)

library(distr)
library(distrEx)

library(distr)
f <- function(x) 3*x^2
X <- AbscontDistribution(d = f, low1 = 0, up1 = 1)
p(X)(0.71) - p(X)(0.14)

library(distrEx)
E(X); var(X); 3/80

pnorm(1:3) - pnorm(-(1:3))

g <- function(x) pnorm(x, mean = 100, sd = 15) - 0.99
uniroot(g, interval = c(130, 145))

temp <- round(uniroot(g, interval = c(130, 145))$root, 4)

qnorm(0.99, mean = 100, sd = 15)

qnorm(c(0.025, 0.01, 0.005), lower.tail = FALSE)

library(distr)
X <- Norm(mean = 0, sd = 1)
Y <- 4 - 3*X
Y

Y <- exp(X)
Y

W <- sin(exp(X) + 27)
W

p(W)(0.5)
W <- sin(exp(X) + 27)
p(W)(0.5)

curve(dchisq(x, df = 3), from = 0, to = 20, ylab = "y")
ind <- c(4, 5, 10, 15)
for (i in ind) curve(dchisq(x, df = i), 0, 20, add = TRUE)

postscript(file="ps/contdist/chisq-dist-vary-df.ps")
  curve(dchisq(x, df = 3), from = 0, to = 20, ylab = "y")
  ind <- c(4, 5, 10, 15)
  for (i in ind) curve(dchisq(x, df = i), 0, 20, add = TRUE)
dev.off()

svg(file="svg/contdist/chisq-dist-vary-df.svg")
  curve(dchisq(x, df = 3), from = 0, to = 20, ylab = "y")
  ind <- c(4, 5, 10, 15)
  for (i in ind) curve(dchisq(x, df = i), 0, 20, add = TRUE)
dev.off()

library(actuar)
mgamma(1:4, shape = 13, rate = 1)

plot(function(x){mgfgamma(x, shape = 13, rate = 1)}, from=-0.1, to=0.1, ylab = "gamma mgf")

postscript(file="ps/contdist/gamma-mgf.ps")
  plot(function(x){mgfgamma(x, shape = 13, rate = 1)}, from=-0.1, to=0.1, ylab = "gamma mgf")
dev.off()

svg(file="svg/contdist/gamma-mgf.svg")
  plot(function(x){mgfgamma(x, shape = 13, rate = 1)}, from=-0.1, to=0.1, ylab = "gamma mgf")
dev.off()

   pnorm(2.64, lower.tail = FALSE)

   pnorm(0.87) - 1/2

   2 * pnorm(-1.39)
