
# Chapter: Simple Linear Regression
# All code released under GPL Version 3

# open window
plot(c(0,5), c(0,6.5), type = "n", xlab="x", ylab="y")
abline(h = 0, v = 0, col = "gray60")
abline(a = 2.5, b = 0.5, lwd = 2)
x <- 600:3000/600
y <- dnorm(x, mean = 3, sd = 0.5)
lines(y + 1.0, x)
lines(y + 2.5, x + 0.75)
lines(y + 4.0, x + 1.5)
abline(v = c(1, 2.5, 4), lty = 2, col = "grey")
segments(1, 3, 1 + dnorm(0,0,0.5),3, lty = 2, col = "gray")
segments(2.5, 3.75, 2.5 + dnorm(0,0,0.5), 3.75, lty = 2, col = "gray")
segments(4,4.5, 4 + dnorm(0,0,0.5),4.5, lty = 2, col = "gray")

postscript(file="ps/slr/philosophy.ps")
  
dev.off()

svg(file="svg/slr/philosophy.svg")
  
dev.off()

head(cars)

qplot(speed, dist, data = cars)

postscript(file="ps/slr/carscatter.ps")
  
dev.off()

svg(file="svg/slr/carscatter.svg")
  
dev.off()

qplot(speed, dist, data = cars)
plot(dist ~ speed, data = cars)

tmpcoef <- round(as.numeric(coef(lm(dist ~ speed, cars))), 2)

cars.lm <- lm(dist ~ speed, data = cars)

coef(cars.lm)

ggplot(cars, aes(x = speed, y = dist)) + geom_point(shape = 19) + 
       geom_smooth(method = lm, se = FALSE)

postscript(file="ps/slr/carline.ps")
  
dev.off()

svg(file="svg/slr/carline.svg")
  
dev.off()

cars[5, ]

fitted(cars.lm)[1:5]

predict(cars.lm, newdata = data.frame(speed = c(6, 8, 21)))

residuals(cars.lm)[1:5]

tmpred <- round(as.numeric(predict(cars.lm, newdata = data.frame(speed = 8))), 2)
tmps <- round(summary(cars.lm)$sigma, 2)

carsumry <- summary(cars.lm)
carsumry$sigma

A <- matrix(as.numeric(round(carsumry$coef, 3)), nrow = 2)
B <- round(confint(cars.lm), 3)

summary(cars.lm)

confint(cars.lm)

new <- data.frame(speed = c(5, 6, 21))

predict(cars.lm, newdata = new, interval = "confidence")

carsCI <- round(predict(cars.lm, newdata = new, interval = "confidence"), 2)

predict(cars.lm, newdata = new, interval = "prediction")

carsPI <- round(predict(cars.lm, newdata = new, interval = "prediction"), 2)

library(HH)
ci.plot(cars.lm)

print(ci.plot(cars.lm))

postscript(file="ps/slr/carscipi.ps")
  
dev.off()

svg(file="svg/slr/carscipi.svg")
  
dev.off()

summary(cars.lm)

anova(cars.lm)

carsumry$r.squared

sqrt(carsumry$r.squared)

anova(cars.lm)

tmpf <- round(as.numeric(carsumry$fstatistic[1]), 2)

plot(cars.lm, which = 2)

postscript(file="ps/slr/Normal-q-q-plot-cars.ps")
  
dev.off()

svg(file="svg/slr/Normal-q-q-plot-cars.svg")
  
dev.off()

shapiro.test(residuals(cars.lm))

plot(cars.lm, which = 3)

postscript(file="ps/slr/std-resids-fitted-cars.ps")
  
dev.off()

svg(file="svg/slr/std-resids-fitted-cars.svg")
  
dev.off()

bptest(cars.lm)

plot(cars.lm, which = 1)

postscript(file="ps/slr/resids-fitted-cars.ps")
  
dev.off()

svg(file="svg/slr/resids-fitted-cars.svg")
  
dev.off()

dwtest(cars.lm, alternative = "two.sided")

sres <- rstandard(cars.lm)
sres[1:5]

sres[which(abs(sres) > 2)]

sdelres <- rstudent(cars.lm)
sdelres[1:5]

t0.005 <- qt(0.005, df = 47, lower.tail = FALSE)
sdelres[which(abs(sdelres) > t0.005)]

leverage <- hatvalues(cars.lm)
leverage[which(leverage > 4/50)]

dfb <- dfbetas(cars.lm)
head(dfb)

dff <- dffits(cars.lm)
dff[1:5]

cooksD <- cooks.distance(cars.lm)
cooksD[1:4]

plot(cars.lm, which = 4)

postscript(file="ps/slr/Cooks-distance-cars.ps")
  
dev.off()

svg(file="svg/slr/Cooks-distance-cars.svg")
  
dev.off()

F0.50 <- qf(0.5, df1 = 2, df2 = 48)
any(cooksD > F0.50)

influence.measures(cars.lm)

par(mfrow = c(2,2))
plot(cars.lm)
par(mfrow = c(1,1))

par(mfrow = c(2,2))
plot(cars.lm)
par(mfrow = c(1,1))

postscript(file="ps/slr/Diagnostic-plots-cars.ps")
  
dev.off()

svg(file="svg/slr/Diagnostic-plots-cars.svg")
  
dev.off()

plot(cars.lm, which = 5)          # std'd resids vs lev plot
identify(leverage, sres, n = 4)   # identify 4 points
