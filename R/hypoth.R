
# Chapter: Hypothesis Testing
# All code released under GPL Version 3

dhyper(0, m = 26, n = 26, k = 5)

-qnorm(0.99)

A <- as.data.frame(UCBAdmissions)
head(A)
xtabs(Freq ~ Admit, data = A)

phat <- 1755/(1755 + 2771)
(phat - 0.4)/sqrt(0.4 * 0.6/(1755 + 2771)) 

-qnorm(0.95)

pnorm(-1.680919)

prop.test(1755, 1755 + 2771, p = 0.4, alternative = "less", 
          conf.level = 0.99, correct = FALSE)

x <- rnorm(37, mean = 2, sd = 3)
z.test(x, mu = 1, sd = 3, conf.level = 0.90)

x <- rnorm(13, mean = 2, sd = 3)
t.test(x, mu = 0, conf.level = 0.90, alternative = "greater")

sigma.test(women$height, sigma = 8)

t.test(extra ~ group, data = sleep, paired = TRUE)

ks.test(randu$x, "punif")

shapiro.test(women$height)

with(chickwts, by(weight, feed, shapiro.test))

temp <- lm(weight ~ feed, data = chickwts)

anova(temp)

y1 <- rnorm(300, mean = c(2,8,22))
plot(y1, xlim = c(-1,25), ylim = c(0,0.45) , type = "n")
f <- function(x){dnorm(x, mean = 2)}
curve(f, from = -1, to = 5, add = TRUE, lwd = 2)
f <- function(x){dnorm(x, mean = 8)}
curve(f, from = 5, to = 11, add = TRUE, lwd = 2)
f <- function(x){dnorm(x, mean = 22)}
curve(f, from = 19, to = 25, add = TRUE, lwd = 2)
rug(y1)

postscript(file="ps/hypoth/Between-versus-within.ps")
  y1 <- rnorm(300, mean = c(2,8,22))
  plot(y1, xlim = c(-1,25), ylim = c(0,0.45) , type = "n")
  f <- function(x){dnorm(x, mean = 2)}
  curve(f, from = -1, to = 5, add = TRUE, lwd = 2)
  f <- function(x){dnorm(x, mean = 8)}
  curve(f, from = 5, to = 11, add = TRUE, lwd = 2)
  f <- function(x){dnorm(x, mean = 22)}
  curve(f, from = 19, to = 25, add = TRUE, lwd = 2)
  rug(y1)
dev.off()

svg(file="svg/hypoth/Between-versus-within.svg")
  y1 <- rnorm(300, mean = c(2,8,22))
  plot(y1, xlim = c(-1,25), ylim = c(0,0.45) , type = "n")
  f <- function(x){dnorm(x, mean = 2)}
  curve(f, from = -1, to = 5, add = TRUE, lwd = 2)
  f <- function(x){dnorm(x, mean = 8)}
  curve(f, from = 5, to = 11, add = TRUE, lwd = 2)
  f <- function(x){dnorm(x, mean = 22)}
  curve(f, from = 19, to = 25, add = TRUE, lwd = 2)
  rug(y1)
dev.off()

old.omd <- par(omd = c(.05,.88, .05,1))
F.setup(df1 = 5, df2 = 30)
F.curve(df1 = 5, df2 = 30, col='blue')
F.observed(3, df1 = 5, df2 = 30)
par(old.omd)

postscript(file="ps/hypoth/Some-F-plots-HH.ps")
  old.omd <- par(omd = c(.05,.88, .05,1))
  F.setup(df1 = 5, df2 = 30)
  F.curve(df1 = 5, df2 = 30, col='blue')
  F.observed(3, df1 = 5, df2 = 30)
  par(old.omd)
dev.off()

svg(file="svg/hypoth/Some-F-plots-HH.svg")
  old.omd <- par(omd = c(.05,.88, .05,1))
  F.setup(df1 = 5, df2 = 30)
  F.curve(df1 = 5, df2 = 30, col='blue')
  F.observed(3, df1 = 5, df2 = 30)
  par(old.omd)
dev.off()

power.examp()

postscript(file="ps/hypoth/power-examp.ps")
  power.examp()
dev.off()

svg(file="svg/hypoth/power-examp.svg")
  power.examp()
dev.off()
