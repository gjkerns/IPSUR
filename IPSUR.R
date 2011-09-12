
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

str(precip)

precip[1:4]

str(rivers)

str(discoveries)

stripchart(precip, xlab="rainfall")
stripchart(rivers, method="jitter", xlab="length")
stripchart(discoveries, method="stack", xlab="number")

postscript(file="img/stripcharts.ps")
par(mfrow = c(3,1)) # 3 plots: 3 rows, 1 column
stripchart(precip, xlab="rainfall")
stripchart(rivers, method="jitter", xlab="length")
stripchart(discoveries, method="stack", xlab="number", ylim = c(0,3))
par(mfrow = c(1,1)) # back to normal
dev.off()

hist(precip, main = "")
hist(precip, freq = FALSE, main = "")

m <- ggplot(as.data.frame(precip), aes(x = precip))
m + geom_histogram()
m + geom_histogram(binwidth = 5)

postscript(file="img/histograms.ps")
library(ggplot2)
m <- ggplot(as.data.frame(precip), aes(x = precip))
a <- m + geom_histogram()
b <- m + geom_histogram(binwidth = 5)
grid.newpage()
pushViewport(viewport(layout = grid.layout(2, 1)))
vplayout <- function(x, y)
viewport(layout.pos.row = x, layout.pos.col = y)
print(a, vp = vplayout(1, 1))
print(b, vp = vplayout(2, 1))
dev.off()

par(mfrow = c(1,2)) # 2 plots: 1 row, 2 columns
hist(precip, main = "")
hist(precip, freq = FALSE, main = "")
par(mfrow = c(1,1)) # back to normal

hist(precip, breaks = 10, main = "")
hist(precip, breaks = 200, main = "")

postscript(file="img/histograms-bins.ps")
par(mfrow = c(1,2)) # 2 plots: 1 row, 2 columns
hist(precip, breaks = 10, main = "")
hist(precip, breaks = 200, main = "")
par(mfrow = c(1,1)) # back to normal
dev.off()

library(aplpack)
stem.leaf(UKDriverDeaths, depth = FALSE)

plot(LakeHuron, type = "h")
plot(LakeHuron, type = "p")

postscript(file="img/indpl-lakehuron.ps")
par(mfrow = c(2,1)) # 2 plots: 2 rows, 1 column
plot(LakeHuron, type = "h")
plot(LakeHuron, type = "p")
par(mfrow = c(1,1)) # back to normal
dev.off()

str(state.abb)

str(state.region)
state.region[1:5]

Tbl <- table(state.division)

Tbl

Tbl/sum(Tbl)      # relative frequencies

prop.table(Tbl)   # same thing

barplot(table(state.region), cex.names = 0.50)
barplot(prop.table(table(state.region)), cex.names = 0.50)

postscript(file="img/bar-gr-stateregion.ps")
par(mfrow = c(1,2)) # 2 plots: 1 row, 2 columns
barplot(table(state.region), cex.names = 0.50)
barplot(prop.table(table(state.region)), cex.names = 0.50)
par(mfrow = c(1,1)) # back to normal
dev.off()

postscript(file="img/Pareto-chart.ps")
library(qcc)
pareto.chart(table(state.division), ylab="Frequency")
dev.off()

postscript(file="img/dot-charts.ps")
x <- table(state.region)
dotchart(as.vector(x), labels = names(x))
dev.off()

x <- 5:9
y <- (x < 7.3)
y

!y

x <- c(3, 7, NA, 4, 7)
y <- c(5, NA, 1, 2, 2)
x + y

sum(x)
sum(x, na.rm = TRUE)

is.na(x)
z <- x[!is.na(x)]
sum(z)

library(aplpack)
with(faithful, stem.leaf(eruptions))

library(e1071)
skewness(discoveries)
2*sqrt(6/length(discoveries))

kurtosis(UKDriverDeaths)
4*sqrt(6/length(UKDriverDeaths))

stem.leaf(rivers)

stem.leaf(precip)

boxplot.stats(rivers)$out

boxplot.stats(rivers, coef = 3)$out

x <- 5:8
y <- letters[3:6]
A <- data.frame(v1 = x, v2 = y)

A[3, ]
A[1, ]
A[ , 2]

names(A)
A$v1

library(lattice)
xyplot(Petal.Width ~ Petal.Length, data = iris, group = Species)

postscript(file="img/xyplot-group.ps")
library(lattice)
print(xyplot(Petal.Width ~ Petal.Length, data = iris, group = Species))
dev.off()

library(lattice)
bwplot(~weight | feed, data = chickwts)

postscript(file="img/bwplot.ps")
library(lattice)
print(bwplot(~weight | feed, data = chickwts))
dev.off()

histogram(~age | education, data = infert)

postscript(file="img/histograms-lattice.ps")
library(lattice)
print(histogram(~age | education, data = infert))
dev.off()

xyplot(Petal.Length ~ Petal.Width | Species, data = iris)

postscript(file="img/xyplot.ps")
print(xyplot(Petal.Length ~ Petal.Width | Species, data = iris))
dev.off()

coplot(conc ~ uptake | Type * Treatment, data = CO2)

postscript(file="img/coplot.ps")
print(coplot(conc ~ uptake | Type * Treatment, data = CO2))
dev.off()

library(RcmdrPlugin.IPSUR)
data(RcmdrTestDrive)
attach(RcmdrTestDrive)
names(RcmdrTestDrive)

postscript(file="img/diagram.ps")
require(diagram)
par(mex = 0.2, cex = 0.5)
openplotmat(frame.plot=TRUE)
straightarrow(from = c(0.46,0.74), to = c(0.53,0.71), arr.pos = 1)
straightarrow(from = c(0.3,0.65), to = c(0.3,0.51), arr.pos = 1)
textellipse(mid = c(0.74,0.55), box.col = grey(0.95), 
  radx = 0.24, rady = 0.22, 
  lab = c(expression(bold(underline(DETERMINISTIC))), 
          expression(2*H[2]+O[2] %->% H[2]*O), "3 + 4 = 7"), cex = 2 )
textrect(mid = c(0.3, 0.75), radx = 0.15, rady = 0.1, 
  lab = c(expression(bold(Experiments))), cex = 2 )
textellipse(mid = c(0.29,0.25), box.col = grey(0.95), 
  radx = 0.27, rady = 0.22, lab = c(expression(bold(underline(RANDOM))), 
  "toss coin, roll die", "count ants on sidewalk", "measure rainfall" ), 
  cex = 2 )
dev.off()

S <- data.frame(lands = c("down","up","side"))
S

library(prob)
tosscoin(1)

tosscoin(3)

rolldie(1) 

head(cards()) 

urnsamples(1:3, size = 2, replace = TRUE, ordered = TRUE)

urnsamples(1:3, size = 2, replace = FALSE, ordered = TRUE)

urnsamples(1:3, size = 2, replace = FALSE, ordered = FALSE) 

urnsamples(1:3, size = 2, replace = TRUE, ordered = FALSE) 

S <- tosscoin(2, makespace = TRUE) 
S[1:3, ] 

S[c(2,4), ] 

S <- cards() 

subset(S, suit == "Heart") 

subset(S, rank %in% 7:9)

subset(rolldie(3), X1+X2+X3 > 16) 

x <- 1:10 
y <- 8:12 
y %in% x

isin(x,y) 

x <- 1:10 
y <- c(3,3,7) 

all(y %in% x)
isin(x,y) 

isin(x, c(3,4,5), ordered = TRUE) 
isin(x, c(3,5,4), ordered = TRUE) 

S <- rolldie(4) 
subset(S, isin(S, c(2,2,6), ordered = TRUE)) 

S <- cards() 
A <- subset(S, suit == "Heart") 
B <- subset(S, rank %in% 7:9)

union(A,B)

intersect(A,B)

setdiff(A,B)

setdiff(B,A) 

outcomes <- rolldie(1) 
p <- rep(1/6, times = 6) 
probspace(outcomes, probs = p) 

probspace(1:6, probs = p) 

probspace(1:6) 

rolldie(1, makespace = TRUE)

probspace(tosscoin(1), probs = c(0.70, 0.30)) 

S <- cards(makespace = TRUE) 
A <- subset(S, suit == "Heart") 
B <- subset(S, rank %in% 7:9)

prob(A) 

prob(S, suit == "Heart") 

nsamp(n=3, k=2, replace = TRUE, ordered = TRUE) 
nsamp(n=3, k=2, replace = FALSE, ordered = TRUE) 
nsamp(n=3, k=2, replace = FALSE, ordered = FALSE) 
nsamp(n=3, k=2, replace = TRUE, ordered = FALSE) 

n <- c(11,7,31) 
k <- c(3,4,3) 
r <- c(FALSE,FALSE,TRUE) 

x <- nsamp(n, k, rep = r, ord = TRUE) 

prod(x) 

(11*10*9)*(7*6*5*4)*313 

prod(9:11)*prod(4:7)*313 

prod(factorial(c(11,7))/factorial(c(8,3)))*313 

postscript(file="img/birthday.ps")
g <- Vectorize(pbirthday.ipsur)
x <- 1:50; y <- g(1:50)
qplot(x, y) + geom_hline(yintercept=0.5) +
  geom_vline(xintercept = 23, linetype = 2) +
  xlab("number of people in room") +
  ylab("Prob(at least one match)")
# plot(1:50, g(1:50), xlab = "Number of people in room", 
  ylab = "Prob(at least one match)" )
remove(g)
dev.off()

g <- Vectorize(pbirthday.ipsur)
plot(1:50, g(1:50), xlab = "Number of people in room", 
  ylab = "Prob(at least one match)" )
abline(h = 0.5)
abline(v = 23, lty = 2)
remove(g)

library(prob)
S <- rolldie(2, makespace = TRUE)  # assumes ELM
head(S)                            #  first few rows

A <- subset(S, X1 == X2)
B <- subset(S, X1 + X2 >= 8)

prob(A, given = B)
prob(B, given = A)

prob(S, X1==X2, given = (X1 + X2 >= 8) )
prob(S, X1+X2 >= 8, given = (X1==X2) )

library(prob)
L <- cards()
M <- urnsamples(L, size = 2)
N <- probspace(M)

prob(N, all(rank == "A"))

library(prob)
L <- rep(c("red","green"), times = c(7,3))
M <- urnsamples(L, size = 3, replace = FALSE, ordered = TRUE)
N <- probspace(M)

prob(N, isrep(N, "red", 3))

prob(N, isrep(N, "red", 2))

prob(N, isin(N, c("red","green","red"), ordered = TRUE))

prob(N, isin(N, c("red","green","red")))

.Table <- xtabs( ~ smoking + gender, data = RcmdrTestDrive)
addmargins(.Table) # Table with Marginal Distributions

S <- tosscoin(10, makespace = TRUE)
A <- subset(S, isrep(S, vals = "T", nrep = 10))
1 - prob(A)

iidspace(c("H","T"), ntrials = 3, probs = c(0.7, 0.3)) 

prior <- c(0.6, 0.3, 0.1)
like <- c(0.003, 0.007, 0.010)
post <- prior * like
post / sum(post)

newprior <- post
post <- newprior * like^7
post / sum(post)

fastpost <- prior * like^8
fastpost / sum(fastpost)

S <- rolldie(3, nsides = 4, makespace = TRUE) 
S <- addrv(S, U = X1-X2+X3) 

head(S)

prob(S, U > 6) 

S <- addrv(S, FUN = max, invars = c("X1","X2","X3"), name = "V") 
S <- addrv(S, FUN = sum, invars = c("X1","X2","X3"), name = "W") 
head(S) 

marginal(S, vars = "V") 

marginal(S, vars = c("V", "W")) 

x <- c(0,1,2,3)
f <- c(1/8, 3/8, 3/8, 1/8)

mu <- sum(x * f)
mu

sigma2 <- sum((x-mu)^2 * f)
sigma2

sigma <- sqrt(sigma2)
sigma

F <- cumsum(f)
F

library(distrEx)
X <- DiscreteDistribution(supp = 0:3, prob = c(1,3,3,1)/8)
E(X); var(X); sd(X)

  A <- data.frame(Pr=dbinom(0:4, size = 4, prob = 0.5))
  rownames(A) <- 0:4 
  A

pbinom(9, size=12, prob=1/6) - pbinom(6, size=12, prob=1/6)
diff(pbinom(c(6,9), size = 12, prob = 1/6))  # same thing

postscript(file="img/binom-cdf-base.ps")
plot(0, xlim = c(-1.2, 4.2), ylim = c(-0.04, 1.04), type = "n", xlab = "number of successes", ylab = "cumulative probability")
abline(h = c(0,1), lty = 2, col = "grey")
lines(stepfun(0:3, pbinom(-1:3, size = 3, prob = 0.5)), verticals = FALSE, do.p = FALSE)
points(0:3, pbinom(0:3, size = 3, prob = 0.5), pch = 16, cex = 1.2)
points(0:3, pbinom(-1:2, size = 3, prob = 0.5), pch = 1, cex = 1.2)
dev.off()

library(distr)
X <- Binom(size = 3, prob = 1/2)
X

d(X)(1)   # pmf of X evaluated at x = 1
p(X)(2)   # cdf of X evaluated at x = 2

postscript(file="img/binom-plot-distr.ps")
plot(X, cex = 0.2)
dev.off()

X <- Binom(size = 3, prob = 0.45)
library(distrEx)
E(X)
E(3*X + 4)

var(X)
sd(X)

x <- c(4, 7, 9, 11, 12)
ecdf(x)

postscript(file="img/empirical-CDF.ps")
plot(ecdf(x))
dev.off()

epdf <- function(x) function(t){sum(x %in% t)/length(x)}
x <- c(0,0,1)
epdf(x)(0)       # should be 2/3

x <- c(0,0,1)
sample(x, size = 7, replace = TRUE)

   dhyper(3, m = 17, n = 233, k = 5)

   A <- data.frame(Pr=dhyper(0:4, m = 17, n = 233, k = 5))
   rownames(A) <- 0:4 
   A

   dhyper(5, m = 17, n = 233, k = 5)

   phyper(2, m = 17, n = 233, k = 5)

   phyper(1, m = 17, n = 233, k = 5, lower.tail = FALSE)

   rhyper(10, m = 17, n = 233, k = 5)

pgeom(4, prob = 0.812, lower.tail = FALSE)

dnbinom(5, size = 7, prob = 0.5)

diff(ppois(c(47, 50), lambda = 50))

postscript(file="img/binomdxca.ps")
     library(distr)
     X <- Binom(size = 31, prob = 0.447)
     plot(X, to.draw.arg = "d")
dev.off()

postscript(file="img/binompxca.ps")
     library(distr)
     X <- Binom(size = 31, prob = 0.447)
     plot(X, to.draw.arg = "p")
dev.off()

     dbinom(17, size = 31, prob = 0.447)

     pbinom(13, size = 31, prob = 0.447)

     pbinom(11, size = 31, prob = 0.447, lower.tail = FALSE)

     pbinom(14, size = 31, prob = 0.447, lower.tail = FALSE)

     sum(dbinom(16:19, size = 31, prob = 0.447))
     diff(pbinom(c(19,15), size = 31, prob = 0.447, lower.tail = FALSE))

     library(distrEx)
     X <- Binom(size = 31, prob = 0.447)
     E(X)

     var(X)

     sd(X)

     E(4*X + 51.324)

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

postscript(file="img/chisq-dist-vary-df.ps")
curve(dchisq(x, df = 3), from = 0, to = 20, ylab = "y")
ind <- c(4, 5, 10, 15)
for (i in ind) curve(dchisq(x, df = i), 0, 20, add = TRUE)
dev.off()

library(actuar)
mgamma(1:4, shape = 13, rate = 1)

postscript(file="img/gamma-mgf.ps")
plot(function(x){mgfgamma(x, shape = 13, rate = 1)}, from=-0.1, to=0.1, ylab = "gamma mgf")
dev.off()

   pnorm(2.64, lower.tail = FALSE)

   pnorm(0.87) - 1/2

   2 * pnorm(-1.39)

head(trees)

postscript(file="img/splom-trees.ps")
library(lattice)
splom(trees)
dev.off()

postscript(file="img/3D-scatterplot-trees.ps")
library(scatterplot3d)
s3d <- with(trees, scatterplot3d(Girth, Height, Volume, 
                                 pch = 16, highlight.3d = TRUE, 
                                 angle = 60))
fit <- lm(Volume ~ Girth + Height, data = trees)
dev.off()

trees.lm <- lm(Volume ~ Girth + Height, data = trees)
trees.lm

head(model.matrix(trees.lm))

fitted(trees.lm)[1:5]

new <- data.frame(Girth = c(9.1, 11.6, 12.5), Height = c(69, 74, 87))

new

predict(trees.lm, newdata = new)

treesFIT <- round(predict(trees.lm, newdata = new), 1)

residuals(trees.lm)[1:5]

treesumry <- summary(trees.lm)
treesumry$sigma

confint(trees.lm)

treesPAR <- round(confint(trees.lm), 1)

new <- data.frame(Girth = c(9.1, 11.6, 12.5), Height = c(69, 74, 87))

predict(trees.lm, newdata = new, interval = "confidence")

treesCI <- round(predict(trees.lm, newdata = new, interval = "confidence"), 1)

predict(trees.lm, newdata = new, interval = "prediction")

treesPI <- round(predict(trees.lm, newdata = new, interval = "prediction"), 1)

treesumry$r.squared

treesumry$adj.r.squared

treesumry$fstatistic

treesumry

postscript(file="img/Scatterplot-Volume-Girth-trees.ps")
qplot(Girth, Volume, data = trees)
dev.off()

treesquad.lm <- lm(Volume ~ scale(Girth) + I(scale(Girth)^2),                    data = trees)
summary(treesquad.lm)

postscript(file="img/Fitting-the-Quadratic.ps")
a <- ggplot(trees, aes(scale(Girth), Volume))
a + stat_smooth(method = lm, formula = y ~ poly(x, 2)) + geom_point()
dev.off()

new <- data.frame(Girth = c(9.1, 11.6, 12.5))
predict(treesquad.lm, newdata = new, interval = "prediction")

summary(lm(Volume ~ Girth + I(Girth^2), data = trees))

treesint.lm <- lm(Volume ~ Girth + Height + Girth:Height, data = trees)
summary(treesint.lm)

confint(treesint.lm)

new <- data.frame(Girth = c(9.1, 11.6, 12.5), Height = c(69, 74, 87))
predict(treesint.lm, newdata = new, interval = "prediction")

trees$Tall <- cut(trees$Height, breaks = c(-Inf, 76, Inf), 
                  labels = c("no","yes"))
trees$Tall[1:5]

class(trees$Tall)

treesdummy.lm <- lm(Volume ~ Girth + Tall, data = trees)
summary(treesdummy.lm)

postscript(file="img/dummy-variable-trees.ps")
treesTall <- split(trees, trees$Tall)
treesTall[["yes"]]$Fit <- predict(treesdummy.lm, treesTall[["yes"]])
treesTall[["no"]]$Fit <- predict(treesdummy.lm, treesTall[["no"]])
plot(Volume ~ Girth, data = trees, type = "n")
points(Volume ~ Girth, data = treesTall[["yes"]], pch = 1)
points(Volume ~ Girth, data = treesTall[["no"]], pch = 2)
lines(Fit ~ Girth, data = treesTall[["yes"]])
lines(Fit ~ Girth, data = treesTall[["no"]])
dev.off()

treesfull.lm <- lm(Volume ~ Girth + I(Girth^2) + Height + 
                   I(Height^2), data = trees)
summary(treesfull.lm)

treesreduced.lm <- lm(Volume ~ -1 + Girth + I(Girth^2), data = trees)

anova(treesreduced.lm, treesfull.lm)

treesreduced2.lm <- lm(Volume ~ Girth + I(Girth^2) + Height, 
                       data = trees)
anova(treesreduced2.lm, treesfull.lm)

treesNonlin.lm <- lm(log(Volume) ~ log(Girth) + log(Height), 
                     data = trees)
summary(treesNonlin.lm)

exp(confint(treesNonlin.lm))

new <- data.frame(Girth = c(9.1, 11.6, 12.5), Height = c(69, 74, 87))
exp(predict(treesNonlin.lm, newdata = new, interval = "confidence"))

# fake data 
set.seed(1) 
x <- seq(from = 0, to = 1000, length.out = 200) 
y <- 1 + 2*(sin((2*pi*x/360) - 3))^2 + rnorm(200, sd = 2)
# plot(x, y)
acc.nls <- nls(y ~ a + b*(sin((2*pi*x/360) - c))^2, 
               start = list(a = 0.9, b = 2.3, c = 2.9))
summary(acc.nls)
#plot(x, fitted(acc.nls))

postscript(file="img/Student's-t-dist-vary-df.ps")
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

postscript(file="img/simulated-IQR.ps")
hist(iqrs, breaks = 20)
dev.off()

mads <- replicate(100, mad(rnorm(100)))

mean(mads)    # close to 1.349

sd(mads)

postscript(file="img/simulated-MAD.ps")
hist(mads, breaks = 20)
dev.off()

k <- 1
n <- sample(10:30, size=10, replace = TRUE)
mu <- round(rnorm(10, mean = 20))

postscript(file="img/capture-recapture.ps")
heights = rep(0, 16)
for (j in 7:15) heights[j] <- dhyper(3, m = 7, n = j - 7, k = 4)
plot(6:15, heights[6:15], pch = 16, cex = 1.5, xlab = "number of fish in pond", ylab = "Likelihood")
abline(h = 0)
lines(6:15, heights[6:15], type = "h", lwd = 2, lty = 3)
text(9, heights[9]/6, bquote(hat(F)==.(9)), cex = 2, pos = 4)
lines(9, heights[9], type = "h", lwd = 2)
points(9, 0, pch = 4, lwd = 3, cex = 2)
dev.off()

postscript(file="img/fishing-part-two.ps")
curve(x^5*(1-x)^2, 0, 1, xlab = "p", ylab = "L(p)")
curve(x^4*(1-x)^3, 0, 1, add = TRUE)
curve(x^3*(1-x)^4, 0, 1, add = TRUE)
dev.off()

postscript(file="img/species-mle.ps")
dat <- rbinom(27, size = 1, prob = 0.3)
like <- function(x){
r <- 1
for (k in 1:27){ r <- r*dbinom(dat[k], size = 1, prob = x)}
return(r)
}
curve(like, from = 0, to = 1, xlab = "parameter space", ylab = "Likelihood", lwd = 3, col = "blue")
abline(h = 0, lwd = 1, lty = 3, col = "grey")
mle <- mean(dat)
mleobj <- like(mle)
lines(mle, mleobj, type = "h", lwd = 2, lty = 3, col = "red")
points(mle, 0, pch = 4, lwd = 2, cex = 2, col = "red")
text(mle, mleobj/6, substitute(hat(theta)==a, list(a=round(mle, 4))), cex = 2, pos = 4)
dev.off()

x <- mtcars$am
L <- function(p,x) prod(dbinom(x, size = 1, prob = p))
optimize(L, interval = c(0,1), x = x, maximum = TRUE)

A <- optimize(L, interval = c(0,1), x = x, maximum = TRUE)

minuslogL <- function(p,x){
                -sum(dbinom(x, size = 1, prob = p, log = TRUE))
             }
optimize(minuslogL, interval = c(0,1), x = x)

minuslogL <- function(mu, sigma2){
  -sum(dnorm(x, mean = mu, sd = sqrt(sigma2), log = TRUE))
}

x <- PlantGrowth$weight
library(stats4)
MaxLikeEst <- mle(minuslogL, start = list(mu = 5, sigma2 = 0.5))
summary(MaxLikeEst)

mean(x); var(x)*29/30; sd(x)/sqrt(30)

postscript(file="img/carscatter.ps")
library(TeachingDemos)
ci.examp()
dev.off()

library(aplpack)
with(PlantGrowth, stem.leaf(weight))

dim(PlantGrowth)   # sample size is first entry

with(PlantGrowth, mean(weight))

qnorm(0.975)

library(TeachingDemos)

library(TeachingDemos)
temp <- with(PlantGrowth, z.test(weight, stdev = 0.7))
temp

library(IPSUR)
plot(temp, "Conf")

library(Hmisc)
binconf(x = 7, n = 25, method = "asymptotic")

binconf(x = 7, n = 25, method = "wilson")

library(RcmdrPlugin.IPSUR)
data(RcmdrTestDrive)

tab <- xtabs(~gender, data = RcmdrTestDrive)
prop.test(rbind(tab), conf.level = 0.95, correct = FALSE)

A <- as.data.frame(Titanic)
library(reshape)
B <- with(A, untable(A, Freq))

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
library(TeachingDemos)
z.test(x, mu = 1, sd = 3, conf.level = 0.90)

x <- rnorm(13, mean = 2, sd = 3)
t.test(x, mu = 0, conf.level = 0.90, alternative = "greater")

library(TeachingDemos)
sigma.test(women$height, sigma = 8)

t.test(extra ~ group, data = sleep, paired = TRUE)

ks.test(randu$x, "punif")

shapiro.test(women$height)

with(chickwts, by(weight, feed, shapiro.test))

temp <- lm(weight ~ feed, data = chickwts)

anova(temp)

postscript(file="img/Between-versus-within.ps")
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

postscript(file="img/Some-F-plots-HH.ps")
library(HH)
old.omd <- par(omd = c(.05,.88, .05,1))
F.setup(df1 = 5, df2 = 30)
F.curve(df1 = 5, df2 = 30, col='blue')
F.observed(3, df1 = 5, df2 = 30)
par(old.omd)
dev.off()

postscript(file="img/power-examp.ps")
library(TeachingDemos)
power.examp()
dev.off()

postscript(file="img/philosophy.ps")
# open window
plot(c(0,5), c(0,6.5), type = "n", xlab="x", ylab="y")
abline(h=0, v=0, col = "gray60")
abline(a = 2.5, b = 0.5, lwd = 2)
x <- 600:3000/600
y <- dnorm(x, mean = 3, sd = 0.5)
lines(y + 1.0, x)
lines(y + 2.5, x + 0.75)
lines(y + 4.0, x + 1.5)
abline(v = c(1, 2.5, 4), lty = 2, col = "grey")
segments(1,3, 1+dnorm(0,0,0.5),3, lty = 2, col = "gray")
segments(2.5, 3.75, 2.5+dnorm(0,0,0.5), 3.75, lty = 2, col = "gray")
segments(4,4.5, 4+dnorm(0,0,0.5),4.5, lty = 2, col = "gray")
dev.off()

head(cars)

postscript(file="img/carscatter.ps")
qplot(speed, dist, data = cars)
dev.off()

plot(dist ~ speed, data = cars)

tmpcoef <- round(as.numeric(coef(lm(dist ~ speed, cars))), 2)

cars.lm <- lm(dist ~ speed, data = cars)

coef(cars.lm)

postscript(file="img/carline.ps")
ggplot(cars, aes(x = speed, y = dist)) + geom_point(shape = 19) + 
       geom_smooth(method = lm)
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

postscript(file="img/carscipi.ps")
library(HH)
print(ci.plot(cars.lm))
dev.off()

summary(cars.lm)

anova(cars.lm)

carsumry$r.squared

sqrt(carsumry$r.squared)

anova(cars.lm)

tmpf <- round(as.numeric(carsumry$fstatistic[1]), 2)

postscript(file="img/Normal-q-q-plot-cars.ps")
plot(cars.lm, which = 2)
dev.off()

shapiro.test(residuals(cars.lm))

postscript(file="img/std-resids-fitted-cars.ps")
plot(cars.lm, which = 3)
dev.off()

library(lmtest)
bptest(cars.lm)

postscript(file="img/resids-fitted-cars.ps")
plot(cars.lm, which = 1)
dev.off()

library(lmtest)
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

postscript(file="img/Cooks-distance-cars.ps")
plot(cars.lm, which = 4)
dev.off()

F0.50 <- qf(0.5, df1 = 2, df2 = 48)
any(cooksD > F0.50)

influence.measures(cars.lm)

par(mfrow = c(2,2))
plot(cars.lm)
par(mfrow = c(1,1))

postscript(file="img/Diagnostic-plots-cars.ps")
par(mfrow = c(2,2))
plot(cars.lm)
par(mfrow = c(1,1))
dev.off()

plot(cars.lm, which = 5)   # std'd resids vs lev plot
identify(leverage, sres, n = 4)   # identify 4 points

head(trees)

postscript(file="img/splom-trees.ps")
library(lattice)
splom(trees)
dev.off()

postscript(file="img/3D-scatterplot-trees.ps")
library(scatterplot3d)
s3d <- with(trees, scatterplot3d(Girth, Height, Volume, 
                                 pch = 16, highlight.3d = TRUE, 
                                 angle = 60))
fit <- lm(Volume ~ Girth + Height, data = trees)
dev.off()

trees.lm <- lm(Volume ~ Girth + Height, data = trees)
trees.lm

head(model.matrix(trees.lm))

fitted(trees.lm)[1:5]

new <- data.frame(Girth = c(9.1, 11.6, 12.5), Height = c(69, 74, 87))

new

predict(trees.lm, newdata = new)

treesFIT <- round(predict(trees.lm, newdata = new), 1)

residuals(trees.lm)[1:5]

treesumry <- summary(trees.lm)
treesumry$sigma

confint(trees.lm)

treesPAR <- round(confint(trees.lm), 1)

new <- data.frame(Girth = c(9.1, 11.6, 12.5), Height = c(69, 74, 87))

predict(trees.lm, newdata = new, interval = "confidence")

treesCI <- round(predict(trees.lm, newdata = new, interval = "confidence"), 1)

predict(trees.lm, newdata = new, interval = "prediction")

treesPI <- round(predict(trees.lm, newdata = new, interval = "prediction"), 1)

treesumry$r.squared

treesumry$adj.r.squared

treesumry$fstatistic

treesumry

postscript(file="img/Scatterplot-Volume-Girth-trees.ps")
qplot(Girth, Volume, data = trees)
dev.off()

treesquad.lm <- lm(Volume ~ scale(Girth) + I(scale(Girth)^2),                    data = trees)
summary(treesquad.lm)

postscript(file="img/Fitting-the-Quadratic.ps")
a <- ggplot(trees, aes(scale(Girth), Volume))
a + stat_smooth(method = lm, formula = y ~ poly(x, 2)) + geom_point()
dev.off()

new <- data.frame(Girth = c(9.1, 11.6, 12.5))
predict(treesquad.lm, newdata = new, interval = "prediction")

summary(lm(Volume ~ Girth + I(Girth^2), data = trees))

treesint.lm <- lm(Volume ~ Girth + Height + Girth:Height, data = trees)
summary(treesint.lm)

confint(treesint.lm)

new <- data.frame(Girth = c(9.1, 11.6, 12.5), Height = c(69, 74, 87))
predict(treesint.lm, newdata = new, interval = "prediction")

trees$Tall <- cut(trees$Height, breaks = c(-Inf, 76, Inf), 
                  labels = c("no","yes"))
trees$Tall[1:5]

class(trees$Tall)

treesdummy.lm <- lm(Volume ~ Girth + Tall, data = trees)
summary(treesdummy.lm)

postscript(file="img/dummy-variable-trees.ps")
treesTall <- split(trees, trees$Tall)
treesTall[["yes"]]$Fit <- predict(treesdummy.lm, treesTall[["yes"]])
treesTall[["no"]]$Fit <- predict(treesdummy.lm, treesTall[["no"]])
plot(Volume ~ Girth, data = trees, type = "n")
points(Volume ~ Girth, data = treesTall[["yes"]], pch = 1)
points(Volume ~ Girth, data = treesTall[["no"]], pch = 2)
lines(Fit ~ Girth, data = treesTall[["yes"]])
lines(Fit ~ Girth, data = treesTall[["no"]])
dev.off()

treesfull.lm <- lm(Volume ~ Girth + I(Girth^2) + Height + 
                   I(Height^2), data = trees)
summary(treesfull.lm)

treesreduced.lm <- lm(Volume ~ -1 + Girth + I(Girth^2), data = trees)

anova(treesreduced.lm, treesfull.lm)

treesreduced2.lm <- lm(Volume ~ Girth + I(Girth^2) + Height, 
                       data = trees)
anova(treesreduced2.lm, treesfull.lm)

treesNonlin.lm <- lm(log(Volume) ~ log(Girth) + log(Height), 
                     data = trees)
summary(treesNonlin.lm)

exp(confint(treesNonlin.lm))

new <- data.frame(Girth = c(9.1, 11.6, 12.5), Height = c(69, 74, 87))
exp(predict(treesNonlin.lm, newdata = new, interval = "confidence"))

# fake data 
set.seed(1) 
x <- seq(from = 0, to = 1000, length.out = 200) 
y <- 1 + 2*(sin((2*pi*x/360) - 3))^2 + rnorm(200, sd = 2)
# plot(x, y)
acc.nls <- nls(y ~ a + b*(sin((2*pi*x/360) - c))^2, 
               start = list(a = 0.9, b = 2.3, c = 2.9))
summary(acc.nls)
#plot(x, fitted(acc.nls))

srs <- rnorm(25, mean = 3)
resamps <- replicate(1000, sample(srs, 25, TRUE), simplify = FALSE)
xbarstar <- sapply(resamps, mean, simplify = TRUE)

postscript(file="img/Bootstrap-se-mean.ps")
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

postscript(file="img/Bootstrapping-se-median.ps")
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

install.packages("IPSUR", repos="http://R-Forge.R-project.org")
library(IPSUR)
read(IPSUR)

install.packages("IPSUR", repos="http://R-Forge.R-project.org")
library(IPSUR)
read(IPSUR)

install.packages("IPSUR", repos="http://R-Forge.R-project.org")
library(IPSUR)
read(IPSUR)

sessionInfo()

x <- c(3, 5, 9)

y <- c(3, "5", TRUE)

matrix(letters[1:6], nrow = 2, ncol = 3)

matrix(letters[1:6], nrow = 2, ncol = 3, byrow = TRUE)

matrix(c(1,"2",NA, FALSE), nrow = 2, ncol = 3)

A <- matrix(1:6, 2, 3)
B <- matrix(2:7, 2, 3)
A + B
A * B

try(A * B)     # an error
A %*% t(B)     # this is alright

solve(A %*% t(B))     # input matrix must be square

array(LETTERS[1:24], dim = c(3,4,2))

x <- c(1.3, 5.2, 6)
y <- letters[1:3]
z <- c(TRUE, FALSE, TRUE)
A <- data.frame(x, y, z)
A

names(A) <- c("Fred","Mary","Sue")
A

A <- as.data.frame(Titanic)
head(A)

library(reshape)
B <- with(A, untable(A, Freq))
head(B)

C <- B[, -5]
rownames(C) <- 1:dim(C)[1]
head(C)

  tab <- matrix(1:6, nrow = 2, ncol = 3)
  rownames(tab) <- c('first', 'second')
  colnames(tab) <- c('A', 'B', 'C')
  tab  # Counts

  p <- c("milk","tea")
  g <- c("milk","tea")
  catgs <- expand.grid(poured = p, guessed = g)
  cnts <- c(3, 1, 1, 3)
  D <- cbind(catgs, count = cnts)
  xtabs(count ~ poured + guessed, data = D)

library(foreign)
read.spss("foo.sav")

Tmp <- Puromycin[order(Puromycin$conc), ]
head(Tmp)

with(Puromycin, Puromycin[order(conc), ])

with(Puromycin, Puromycin[order(state, conc), ])

Tmp <- with(Puromycin, Puromycin[order(-conc), ])
head(Tmp)

Tmp <- with(Puromycin, Puromycin[order(-xtfrm(state)), ])
head(Tmp)

   library(odfWeave)
   odfWeave(file = "infile.odt", dest = "outfile.odt")

library(Hmisc)
summary(cbind(Sepal.Length, Sepal.Width) ~ Species, data = iris)

set.seed(095259)

options(digits = 16)
runif(1)

rm(.Random.seed)
try(dir.create("../../data"), silent = TRUE)
save.image(file = "../../data/IPSUR.RData")
tools::resaveRdaFiles('../../data', compress = 'xz')
Stangle(file="IPSUR.Rnw", output="../IPSUR.R", annotate=TRUE)
