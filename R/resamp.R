
srs <- rnorm(25, mean = 3)
resamps <- replicate(1000, sample(srs, 25, TRUE), simplify = FALSE)
xbarstar <- sapply(resamps, mean, simplify = TRUE)

hist(xbarstar, breaks = 40, prob = TRUE)
curve(dnorm(x, 3, 0.2), add = TRUE) # overlay true normal density

postscript(file="ps/resamp/Bootstrap-se-mean.ps")
  hist(xbarstar, breaks = 40, prob = TRUE)
  curve(dnorm(x, 3, 0.2), add = TRUE) # overlay true normal density
dev.off()

svg(file="svg/resamp/Bootstrap-se-mean.svg")
  hist(xbarstar, breaks = 40, prob = TRUE)
  curve(dnorm(x, 3, 0.2), add = TRUE) # overlay true normal density
dev.off()

mean(xbarstar)
mean(srs)
mean(xbarstar) - mean(srs)

sd(xbarstar)

resamps <- replicate(1000, sample(rivers, 141, TRUE), simplify = FALSE)
medstar <- sapply(resamps, median, simplify = TRUE)
sd(medstar)

hist(medstar, breaks = 40, prob = TRUE)

postscript(file="ps/resamp/Bootstrapping-se-median.ps")
  hist(medstar, breaks = 40, prob = TRUE)
dev.off()

svg(file="svg/resamp/Bootstrapping-se-median.svg")
  hist(medstar, breaks = 40, prob = TRUE)
dev.off()

hist(medstar, breaks = 40, prob = TRUE)

median(rivers)
mean(medstar)
mean(medstar) - median(rivers)

library(boot)
mean_fun <- function(x, indices) mean(x[indices])
boot(data = srs, statistic = mean_fun, R = 1000)

median_fun <- function(x, indices) median(x[indices])
boot(data = rivers, statistic = median_fun, R = 1000)

btsamps <- replicate(2000, sample(stack.loss, 21, TRUE), simplify = FALSE)
thetast <- sapply(btsamps, median, simplify = TRUE)
mean(thetast)
median(stack.loss)
quantile(thetast, c(0.025, 0.975))

library(boot)
med_fun <- function(x, ind) median(x[ind])
med_boot <- boot(stack.loss, med_fun, R = 2000)
boot.ci(med_boot, type = c("perc", "norm", "bca"))

library(coin)
oneway_test(len ~ supp, data = ToothGrowth)

t.test(len ~ supp, data = ToothGrowth, 
       alt = "greater", var.equal = TRUE)

A <- show(oneway_test(len ~ supp, data = ToothGrowth))
B <- t.test(len ~ supp, data = ToothGrowth, alt = "greater", var.equal = TRUE)
