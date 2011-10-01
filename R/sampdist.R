
curve(dt(x, df = 30), from = -3, to = 3, lwd = 3, ylab = "y")
ind <- c(1, 2, 3, 5, 10)
for (i in ind) curve(dt(x, df = i), -3, 3, add = TRUE)

postscript(file="ps/sampdist/Student's-t-dist-vary-df.ps")
  curve(dt(x, df = 30), from = -3, to = 3, lwd = 3, ylab = "y")
  ind <- c(1, 2, 3, 5, 10)
  for (i in ind) curve(dt(x, df = i), -3, 3, add = TRUE)
dev.off()

svg(file="svg/sampdist/Student's-t-dist-vary-df.svg")
  curve(dt(x, df = 30), from = -3, to = 3, lwd = 3, ylab = "y")
  ind <- c(1, 2, 3, 5, 10)
  for (i in ind) curve(dt(x, df = i), -3, 3, add = TRUE)
dev.off()

qt(0.01, df = 23, lower.tail = FALSE)

library(TeachingDemos)
example(clt.examp)

library(distrTeach)
example(illustrateCLT)

iqrs <- replicate(100, IQR(rnorm(100)))

mean(iqrs)    # close to 1

sd(iqrs)

hist(iqrs, breaks = 20)

postscript(file="ps/sampdist/simulated-IQR.ps")
  hist(iqrs, breaks = 20)
dev.off()

svg(file="svg/sampdist/simulated-IQR.svg")
  hist(iqrs, breaks = 20)
dev.off()

mads <- replicate(100, mad(rnorm(100)))

mean(mads)    # close to 1.349

sd(mads)

hist(mads, breaks = 20)

postscript(file="ps/sampdist/simulated-MAD.ps")
  hist(mads, breaks = 20)
dev.off()

svg(file="svg/sampdist/simulated-MAD.svg")
  hist(mads, breaks = 20)
dev.off()

k <- 1
n <- sample(10:30, size=10, replace = TRUE)
mu <- round(rnorm(10, mean = 20))
