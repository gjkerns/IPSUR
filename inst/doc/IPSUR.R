### R code from vignette source 'IPSUR.Rnw'

###################################################
### code chunk number 1: IPSUR.Rnw:137-146
###################################################
# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 55)
cexlab <- 1.5


###################################################
### code chunk number 2: IPSUR.Rnw:237-256 (eval = FALSE)
###################################################
## #    IPSUR: Introduction to Probability and Statistics Using R
## #    Copyright (C) 2021 G. Jay Kerns
## #
## #    Chapter: An Introduction to R
## #
## #    This file is part of IPSUR.
## #
## #    IPSUR is free software: you can redistribute it and/or modify
## #    it under the terms of the GNU General Public License as published by
## #    the Free Software Foundation, either version 3 of the License, or
## #    (at your option) any later version.
## #
## #    IPSUR is distributed in the hope that it will be useful,
## #    but WITHOUT ANY WARRANTY; without even the implied warranty of
## #    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## #    GNU General Public License for more details.
## #
## #    You should have received a copy of the GNU General Public License
## #    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.


###################################################
### code chunk number 3: IPSUR.Rnw:376-377
###################################################
getOption("defaultPackages")


###################################################
### code chunk number 4: IPSUR.Rnw:515-518
###################################################
2 + 3       # add
4 * 5 / 6   # multiply and divide
7^8         # 7 to the 8th power


###################################################
### code chunk number 5: IPSUR.Rnw:527-533
###################################################
options(digits = 16)
10/3                 # see more digits
sqrt(2)              # square root
exp(1)               # Euler's constant, e
pi
options(digits = 7)  # back to default


###################################################
### code chunk number 6: IPSUR.Rnw:555-557
###################################################
x <- 7*41/pi   # don't see the calculated value
x              # take a look


###################################################
### code chunk number 7: IPSUR.Rnw:592-597
###################################################
sqrt(-1)              # isn't defined
sqrt(-1+0i)           # is defined
sqrt(as.complex(-1))  # same thing
(0 + 1i)^2            # should be -1
typeof((0 + 1i)^2)


###################################################
### code chunk number 8: IPSUR.Rnw:616-618
###################################################
x <- c(74, 31, 95, 61, 76, 34, 23, 54, 96)
x


###################################################
### code chunk number 9: IPSUR.Rnw:642-644
###################################################
seq(from = 1, to = 5)
seq(from = 2, by = -0.1, length.out = 4)


###################################################
### code chunk number 10: IPSUR.Rnw:650-651
###################################################
1:5


###################################################
### code chunk number 11: IPSUR.Rnw:665-669
###################################################
x[1]
x[2:4]
x[c(1,3,4,8)]
x[-c(1,3,4,8)]


###################################################
### code chunk number 12: IPSUR.Rnw:675-677
###################################################
LETTERS[1:5]
letters[-(6:24)]


###################################################
### code chunk number 13: IPSUR.Rnw:686-692
###################################################
x <- 1:5
sum(x)
length(x)
min(x)
mean(x)      # sample mean
sd(x)        # sample standard deviation


###################################################
### code chunk number 14: IPSUR.Rnw:707-708
###################################################
intersect


###################################################
### code chunk number 15: IPSUR.Rnw:717-718
###################################################
rev


###################################################
### code chunk number 16: IPSUR.Rnw:724-725
###################################################
methods(rev)


###################################################
### code chunk number 17: IPSUR.Rnw:734-735
###################################################
rev.default


###################################################
### code chunk number 18: IPSUR.Rnw:743-745
###################################################
wilcox.test
methods(wilcox.test)


###################################################
### code chunk number 19: IPSUR.Rnw:764-765
###################################################
exp


###################################################
### code chunk number 20: IPSUR.Rnw:979-985
###################################################
# Preliminary code to load before start
# This chapter's package dependencies
library(aplpack)
library(e1071)
library(lattice)
library(qcc)


###################################################
### code chunk number 21: IPSUR.Rnw:1066-1067
###################################################
str(precip)


###################################################
### code chunk number 22: IPSUR.Rnw:1070-1071
###################################################
precip[1:4]


###################################################
### code chunk number 23: IPSUR.Rnw:1090-1091
###################################################
str(rivers)


###################################################
### code chunk number 24: IPSUR.Rnw:1110-1111
###################################################
str(discoveries)


###################################################
### code chunk number 25: IPSUR.Rnw:1151-1154 (eval = FALSE)
###################################################
## stripchart(precip, xlab="rainfall")
## stripchart(rivers, method="jitter", xlab="length")
## stripchart(discoveries, method="stack", xlab="number")


###################################################
### code chunk number 26: stripcharts
###################################################
par(mfrow = c(3,1)) # 3 plots: 3 rows, 1 column
stripchart(precip, xlab="rainfall", cex.lab = cexlab)
stripchart(rivers, method="jitter", xlab="length", cex.lab = cexlab)
stripchart(discoveries, method="stack", xlab="number", ylim = c(0,3), cex.lab = cexlab)
par(mfrow = c(1,1)) # back to normal


###################################################
### code chunk number 27: IPSUR.Rnw:1219-1221 (eval = FALSE)
###################################################
## hist(precip, main = "")
## hist(precip, freq = FALSE, main = "")


###################################################
### code chunk number 28: histograms
###################################################
par(mfrow = c(1,2))
hist(precip, main = "", cex.lab = cexlab)
hist(precip, freq = FALSE, main = "", cex.lab = cexlab)
par(mfrow = c(1,1))


###################################################
### code chunk number 29: IPSUR.Rnw:1264-1267 (eval = FALSE)
###################################################
## hist(precip, breaks = 10)
## hist(precip, breaks = 25)
## hist(precip, breaks = 50)


###################################################
### code chunk number 30: histograms-bins
###################################################
par(mfrow = c(1,3))
hist(precip, breaks = 10, main = "", cex.lab = cexlab)
hist(precip, breaks = 25, main = "", cex.lab = cexlab)
hist(precip, breaks = 50, main = "", cex.lab = cexlab)
par(mfrow = c(1,1))


###################################################
### code chunk number 31: IPSUR.Rnw:1328-1329
###################################################
stem.leaf(UKDriverDeaths, depth = FALSE)


###################################################
### code chunk number 32: IPSUR.Rnw:1372-1375 (eval = FALSE)
###################################################
## plot(LakeHuron)
## plot(LakeHuron, type = "p")
## plot(LakeHuron, type = "h")


###################################################
### code chunk number 33: indpl-lakehuron
###################################################
par(mfrow = c(3,1))
plot(LakeHuron, cex.lab = cexlab)
plot(LakeHuron, type = "p", cex.lab = cexlab)
plot(LakeHuron, type = "h", cex.lab = cexlab)
par(mfrow = c(1,1))


###################################################
### code chunk number 34: IPSUR.Rnw:1403-1409 (eval = FALSE)
###################################################
## # The Old Faithful geyser data
## d <- with(faithful, density(eruptions, bw = "sj"))
## d
## plot(d)
## hist(precip, freq = FALSE)
## lines(density(precip))


###################################################
### code chunk number 35: IPSUR.Rnw:1465-1466
###################################################
str(state.abb)


###################################################
### code chunk number 36: IPSUR.Rnw:1484-1486
###################################################
str(state.region)
state.region[1:5]


###################################################
### code chunk number 37: IPSUR.Rnw:1509-1511
###################################################
Tbl <- table(state.division)
Tbl


###################################################
### code chunk number 38: IPSUR.Rnw:1514-1515
###################################################
Tbl/sum(Tbl)      # relative frequencies


###################################################
### code chunk number 39: IPSUR.Rnw:1518-1519
###################################################
prop.table(Tbl)   # same thing


###################################################
### code chunk number 40: IPSUR.Rnw:1541-1543 (eval = FALSE)
###################################################
## barplot(table(state.region), ylab="frequency")
## barplot(prop.table(table(state.region)), ylab="rel frequency")


###################################################
### code chunk number 41: bar-gr-stateregion
###################################################
par(mfrow = c(2,1)) # 2 plots: 2 rows, 1 column
barplot(table(state.region), ylab="frequency")
barplot(prop.table(table(state.region)), ylab="rel frequency")
par(mfrow = c(1,1)) # back to normal


###################################################
### code chunk number 42: IPSUR.Rnw:1606-1607 (eval = FALSE)
###################################################
## pareto.chart(table(state.division), ylab="Frequency")


###################################################
### code chunk number 43: pareto-chart
###################################################
pareto.chart(table(state.division), ylab="Frequency", cex.lab = cexlab)


###################################################
### code chunk number 44: dotchart
###################################################
x <- table(state.region)
dotchart(as.vector(x), labels = names(x), cex.lab = cexlab)


###################################################
### code chunk number 45: IPSUR.Rnw:1671-1674
###################################################
x <- 5:9
y <- (x < 7.3)
y


###################################################
### code chunk number 46: IPSUR.Rnw:1686-1687
###################################################
!y


###################################################
### code chunk number 47: IPSUR.Rnw:1702-1705
###################################################
x <- c(3, 7, NA, 4, 7)
y <- c(5, NA, 1, 2, 2)
x + y


###################################################
### code chunk number 48: IPSUR.Rnw:1712-1714
###################################################
sum(x)
sum(x, na.rm = TRUE)


###################################################
### code chunk number 49: IPSUR.Rnw:1722-1725
###################################################
is.na(x)
z <- x[!is.na(x)]
sum(z)


###################################################
### code chunk number 50: IPSUR.Rnw:1811-1812
###################################################
with(faithful, stem.leaf(eruptions))


###################################################
### code chunk number 51: IPSUR.Rnw:2199-2201
###################################################
e1071::skewness(discoveries)
2*sqrt(6/length(discoveries))


###################################################
### code chunk number 52: IPSUR.Rnw:2207-2209
###################################################
kurtosis(UKDriverDeaths)
4*sqrt(6/length(UKDriverDeaths))


###################################################
### code chunk number 53: IPSUR.Rnw:2289-2290
###################################################
stem.leaf(rivers)


###################################################
### code chunk number 54: IPSUR.Rnw:2312-2313
###################################################
stem.leaf(precip)


###################################################
### code chunk number 55: IPSUR.Rnw:2428-2429
###################################################
boxplot.stats(rivers)$out


###################################################
### code chunk number 56: IPSUR.Rnw:2435-2436
###################################################
boxplot.stats(rivers, coef = 3)$out


###################################################
### code chunk number 57: IPSUR.Rnw:2482-2485
###################################################
x <- 5:8
y <- letters[3:6]
A <- data.frame(v1 = x, v2 = y)


###################################################
### code chunk number 58: IPSUR.Rnw:2501-2504
###################################################
A[3, ]
A[ , 1]
A[ , 2]


###################################################
### code chunk number 59: IPSUR.Rnw:2516-2518
###################################################
names(A)
A['v1']


###################################################
### code chunk number 60: IPSUR.Rnw:2542-2544
###################################################
A <- xtabs(Freq ~ Survived + Class, data = Titanic)
addmargins(A)


###################################################
### code chunk number 61: IPSUR.Rnw:2553-2555 (eval = FALSE)
###################################################
## barplot(A, legend.text = TRUE, args.legend = list(x="topleft"))
## barplot(A, legend.text = TRUE, beside = TRUE, args.legend = list(x="topleft"))


###################################################
### code chunk number 62: barplots-Titanic
###################################################
par(mfrow=c(1,2))
barplot(A, legend.text = TRUE, args.legend = list(x="topleft"))
barplot(A, legend.text = TRUE, beside = TRUE, args.legend = list(x="topleft"))
par(mfrow=c(1,1))


###################################################
### code chunk number 63: IPSUR.Rnw:2575-2577 (eval = FALSE)
###################################################
## spineplot(A)
## mosaicplot(A)


###################################################
### code chunk number 64: spineplot-Titanic
###################################################
par(mfrow=c(1,2))
spineplot(A)
mosaicplot(A)
par(mfrow=c(1,1))


###################################################
### code chunk number 65: IPSUR.Rnw:2610-2615
###################################################
par(mfrow=c(1,2))
plot(rate ~ conc, data = Puromycin)
library(lattice)
xyplot(accel ~ dist, data = attenu)
par(mfrow=c(1,1))


###################################################
### code chunk number 66: IPSUR.Rnw:2627-2631
###################################################
par(mfrow=c(1,2))
xyplot(eruptions ~ waiting, data = faithful)
xyplot(pressure ~ temperature, data = pressure)
par(mfrow=c(1,1))


###################################################
### code chunk number 67: IPSUR.Rnw:2654-2658
###################################################
par(mfrow=c(1,2))
plot( carb ~ optden, data = Formaldehyde)
plot(weight ~ height, data = women)
par(mfrow=c(1,1))


###################################################
### code chunk number 68: IPSUR.Rnw:2682-2693 (eval = FALSE)
###################################################
## require(graphics)
## mosaicplot(HairEyeColor)
## x <- apply(HairEyeColor, c(1, 2), sum)
## x
## mosaicplot(x, main = "Relation between hair and eye color")
## y <- apply(HairEyeColor, c(1, 3), sum)
## y
## mosaicplot(y, main = "Relation between hair color and sex")
## z <- apply(HairEyeColor, c(2, 3), sum)
## z
## mosaicplot(z, main = "Relation between eye color and sex")


###################################################
### code chunk number 69: IPSUR.Rnw:2718-2719
###################################################
with(chickwts, tapply(weight, list(feed = feed), mean))


###################################################
### code chunk number 70: IPSUR.Rnw:2724-2725
###################################################
with(chickwts, tapply(weight, list(feed = feed), sd))


###################################################
### code chunk number 71: IPSUR.Rnw:2729-2730
###################################################
with(chickwts, tapply(weight, list(feed = feed), length))


###################################################
### code chunk number 72: IPSUR.Rnw:2786-2787 (eval = FALSE)
###################################################
## xyplot(Petal.Width ~ Petal.Length, data = iris, group = Species)


###################################################
### code chunk number 73: xyplot
###################################################
print(xyplot(Petal.Width ~ Petal.Length, data = iris, group = Species))


###################################################
### code chunk number 74: IPSUR.Rnw:2806-2816 (eval = FALSE)
###################################################
## splom( ~ cbind(GNP.deflator,GNP,Unemployed,Armed.Forces,
##              Population,Year,Employed),  data = longley)
## splom( ~ cbind(pop15,pop75,dpi), data = LifeCycleSavings)
## splom( ~ cbind(Murder, Assault, Rape), data = USArrests)
## splom( ~ cbind(CONT, INTG, DMNR), data = USJudgeRatings)
## splom( ~ cbind(area,peri,shape,perm), data = rock)
## splom( ~ cbind(Air.Flow, Water.Temp, Acid.Conc.,
##                stack.loss), data = stackloss)
## #splom( ~ cbind(Fertility,Agriculture,Examination,Education,Catholic,Infant.Mortality), data = swiss)
## #splom(~ cbind(Fertility,Agriculture,Examination), data = swiss) #(positive and negative)


###################################################
### code chunk number 75: IPSUR.Rnw:2821-2826 (eval = FALSE)
###################################################
## #dotchart(USPersonalExpenditure)
## #dotchart(t(USPersonalExpenditure))
## dotchart(WorldPhones)
## dotplot(Survived ~ Freq | Class, groups = Sex, data = B)
## dotplot(Admit ~ Freq | Dept, groups = Gender, data = C)


###################################################
### code chunk number 76: IPSUR.Rnw:2830-2833 (eval = FALSE)
###################################################
## mosaic( ~ Survived + Class + Age + Sex, data = Titanic)
##     #  (or just mosaic(Titanic))
## mosaic( ~ Admit + Dept + Gender, data = UCBAdmissions)


###################################################
### code chunk number 77: IPSUR.Rnw:2838-2840 (eval = FALSE)
###################################################
## spineplot(xtabs(Freq ~ Admit + Gender, data = UCBAdmissions))
## # rescaled barplot


###################################################
### code chunk number 78: IPSUR.Rnw:2881-2882 (eval = FALSE)
###################################################
## bwplot(~weight | feed, data = chickwts)


###################################################
### code chunk number 79: bwplot
###################################################
print(bwplot(~weight | feed, data = chickwts))


###################################################
### code chunk number 80: IPSUR.Rnw:2900-2901 (eval = FALSE)
###################################################
## histogram(~age | education, data = infert)


###################################################
### code chunk number 81: histg
###################################################
print(histogram(~age | education, data = infert))


###################################################
### code chunk number 82: IPSUR.Rnw:2920-2921 (eval = FALSE)
###################################################
## xyplot(Petal.Length ~ Petal.Width | Species, data = iris)


###################################################
### code chunk number 83: xyplot-by
###################################################
print(xyplot(Petal.Length ~ Petal.Width | Species, data = iris))


###################################################
### code chunk number 84: IPSUR.Rnw:2940-2941 (eval = FALSE)
###################################################
## coplot(conc ~ uptake | Type * Treatment, data = CO2)


###################################################
### code chunk number 85: coplot
###################################################
print(coplot(conc ~ uptake | Type * Treatment, data = CO2))


###################################################
### code chunk number 86: PPb
###################################################
plot(x = c(74, 74, 774, 774),
     y = c(-541, -213, -305, -572),
     main = "PLANNED PARENTHOOD FEDERATION OF AMERICA:",
     xlab = "", ylab = "", asp = 1, axes = FALSE, cex.main=0.9,
     xlim = c(74, 774), ylim = c(-679, -150),
     type = "n")
mtext("ABORTIONS UP - LIFE SAVING PROCEDURES DOWN", side = 3, cex=0.9)
arrows(x0 = 74, y0 = -541, x1 = 774, y1 = -305,
       lwd = 3, col = "red")
arrows(x0 = 74, y0 = -213, x1 = 774, y1 = -572,
       lwd = 3, col = "purple")
text(x = 176, y = -480, labels = "ABORTIONS", pos = 4, srt = 18, col = "red", cex=0.9)
text(x = 300, y = -230, col = "purple",
     labels = "CANCER SCREENING &\nPREVENTION SERVICES", pos = 1, srt = -27, cex=0.9)
axis(side = 1,
     at = 100*(0:7) + 74,
     labels = 2006:2013)
segments(x0=74, y0=-150, x1=774, y1=-150)
text(100, -265, labels = "2,007,371\nIN 2006", pos = 1, cex = 0.75)
text(94, -557, labels = "289,750\nIN 2006", pos = 1, cex = 0.75)
text(734, -292, labels = "327,653\nIN 2013", pos = 3, cex = 0.75)
text(748, -594, labels = "935,573\nIN 2013", pos = 1, cex = 0.75)
mtext("SOURCE: AMERICANS UNITED FOR LIFE", side = 1, line = 3, cex = 0.75, adj = 1)


###################################################
### code chunk number 87: IPSUR.Rnw:3024-3035
###################################################
PP <- structure(c(3989474L, 3889980L, NA, 3868901L, 3685437L, 3436813L,
                  3724558L, 3577348L, 3018853L, 3363222L, NA, 4034264L, 4179053L,
                  4475013L, 4469308L, 4470597L, 2007371L, 1900850L, NA, 1830811L,
                  1596741L, 1307570L, 1121580L, 935573L, 1119977L, 1207340L, NA,
                  1070310L, 1144558L, 1179263L, 1167755L, 1147467L, 289750L, 305310L,
                  NA, 331796L, 329445L, 333964L, 327116L, 327653L, 162935L, 255123L,
                  NA, 102332L, 68132L, 132036L, 123308L, 131795L), .Dim = c(8L, 6L), .Dimnames = list(NULL, c("Contraception", "STD.Test.Treat", "Cancer.Screen", "Preg.Prenat.Serv", "Abortion.Serv", "Other.Serv")), .Tsp = c(2006, 2013, 1),
                class = c("mts", "ts"))

PPcpct = t(PP)
colnames(PPcpct) = 2006:2013


###################################################
### code chunk number 88: IPSUR.Rnw:3039-3040
###################################################
PPcpct


###################################################
### code chunk number 89: PPg
###################################################
ts.plot(PP/1000000, lty=1:6, lwd=3, col = c("black", "black","purple","black","red","black"), ylab="Services (in millions)", xlab="Year")
legend(x=2007,y=3.2, colnames(PP), lty=1:6, cex=.65, col = c("black", "black","purple","black","red","black"), lwd=3)


###################################################
### code chunk number 90: IPSUR.Rnw:3063-3067
###################################################
#library("RcmdrPlugin.IPSUR")
#data(RcmdrTestDrive)
#attach(RcmdrTestDrive)
#names(RcmdrTestDrive)


###################################################
### code chunk number 91: histexr
###################################################
m = sample(25:95, size = 1)
x = rexp(500, rate = m)
hist(x, main = "", breaks = 15, xlab="")


###################################################
### code chunk number 92: IPSUR.Rnw:3221-3221
###################################################



###################################################
### code chunk number 93: IPSUR.Rnw:3285-3290
###################################################
# This chapter's package dependencies
library(diagram)
library(ggplot2)
library(prob)
#library(RcmdrPlugin.IPSUR)


###################################################
### code chunk number 94: diagram
###################################################
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


###################################################
### code chunk number 95: IPSUR.Rnw:3387-3389
###################################################
S <- data.frame(lands = c("down","up","side"))
S


###################################################
### code chunk number 96: IPSUR.Rnw:3412-3413
###################################################
tosscoin(1)


###################################################
### code chunk number 97: IPSUR.Rnw:3420-3421
###################################################
tosscoin(3)


###################################################
### code chunk number 98: IPSUR.Rnw:3426-3427
###################################################
rolldie(1)


###################################################
### code chunk number 99: IPSUR.Rnw:3437-3438
###################################################
head(cards())


###################################################
### code chunk number 100: IPSUR.Rnw:3508-3509
###################################################
urnsamples(1:3, size = 2, replace = TRUE, ordered = TRUE)


###################################################
### code chunk number 101: IPSUR.Rnw:3526-3527
###################################################
urnsamples(1:3, size = 2, replace = FALSE, ordered = TRUE)


###################################################
### code chunk number 102: IPSUR.Rnw:3545-3546
###################################################
urnsamples(1:3, size = 2, replace = FALSE, ordered = FALSE)


###################################################
### code chunk number 103: IPSUR.Rnw:3560-3561
###################################################
urnsamples(1:3, size = 2, replace = TRUE, ordered = FALSE)


###################################################
### code chunk number 104: IPSUR.Rnw:3619-3621
###################################################
S <- tosscoin(2, makespace = TRUE)
S[1:3, ]


###################################################
### code chunk number 105: IPSUR.Rnw:3625-3626
###################################################
S[c(2,4), ]


###################################################
### code chunk number 106: IPSUR.Rnw:3632-3633
###################################################
S <- cards()


###################################################
### code chunk number 107: IPSUR.Rnw:3636-3637
###################################################
subset(S, suit == "Heart")


###################################################
### code chunk number 108: IPSUR.Rnw:3641-3642
###################################################
subset(S, rank %in% 7:9)


###################################################
### code chunk number 109: IPSUR.Rnw:3648-3649
###################################################
subset(rolldie(3), X1+X2+X3 > 16)


###################################################
### code chunk number 110: IPSUR.Rnw:3668-3671
###################################################
x <- 1:10
y <- 8:12
y %in% x


###################################################
### code chunk number 111: IPSUR.Rnw:3683-3684
###################################################
isin(x,y)


###################################################
### code chunk number 112: IPSUR.Rnw:3691-3693
###################################################
x <- 1:10
y <- c(3,3,7)


###################################################
### code chunk number 113: IPSUR.Rnw:3696-3698
###################################################
all(y %in% x)
isin(x,y)


###################################################
### code chunk number 114: IPSUR.Rnw:3709-3711
###################################################
isin(x, c(3,4,5), ordered = TRUE)
isin(x, c(3,5,4), ordered = TRUE)


###################################################
### code chunk number 115: IPSUR.Rnw:3720-3722
###################################################
S <- rolldie(4)
subset(S, isin(S, c(2,2,6), ordered = TRUE))


###################################################
### code chunk number 116: IPSUR.Rnw:3754-3757
###################################################
S <- cards()
A <- subset(S, suit == "Heart")
B <- subset(S, rank %in% 7:9)


###################################################
### code chunk number 117: IPSUR.Rnw:3762-3763
###################################################
union(A,B)


###################################################
### code chunk number 118: IPSUR.Rnw:3767-3768
###################################################
intersect(A,B)


###################################################
### code chunk number 119: IPSUR.Rnw:3771-3772
###################################################
setdiff(A,B)


###################################################
### code chunk number 120: IPSUR.Rnw:3775-3776
###################################################
setdiff(B,A)


###################################################
### code chunk number 121: IPSUR.Rnw:4008-4011
###################################################
outcomes <- rolldie(1)
p <- rep(1/6, times = 6)
probspace(outcomes, probs = p)


###################################################
### code chunk number 122: IPSUR.Rnw:4020-4021
###################################################
probspace(1:6, probs = p)


###################################################
### code chunk number 123: IPSUR.Rnw:4030-4031
###################################################
probspace(1:6)


###################################################
### code chunk number 124: IPSUR.Rnw:4040-4041
###################################################
rolldie(1, makespace = TRUE)


###################################################
### code chunk number 125: IPSUR.Rnw:4069-4070
###################################################
probspace(tosscoin(1), probs = c(0.70, 0.30))


###################################################
### code chunk number 126: IPSUR.Rnw:4339-4342
###################################################
S <- cards(makespace = TRUE)
A <- subset(S, suit == "Heart")
B <- subset(S, rank %in% 7:9)


###################################################
### code chunk number 127: IPSUR.Rnw:4347-4348
###################################################
Prob(A)


###################################################
### code chunk number 128: IPSUR.Rnw:4353-4354
###################################################
Prob(S, suit == "Heart")


###################################################
### code chunk number 129: IPSUR.Rnw:4572-4576
###################################################
nsamp(n=3, k=2, replace = TRUE, ordered = TRUE)
nsamp(n=3, k=2, replace = FALSE, ordered = TRUE)
nsamp(n=3, k=2, replace = FALSE, ordered = FALSE)
nsamp(n=3, k=2, replace = TRUE, ordered = FALSE)


###################################################
### code chunk number 130: IPSUR.Rnw:4608-4611
###################################################
n <- c(11,7,31)
k <- c(3,4,3)
r <- c(FALSE,FALSE,TRUE)


###################################################
### code chunk number 131: IPSUR.Rnw:4614-4615
###################################################
x <- nsamp(n, k, rep = r, ord = TRUE)


###################################################
### code chunk number 132: IPSUR.Rnw:4623-4624
###################################################
prod(x)


###################################################
### code chunk number 133: IPSUR.Rnw:4630-4631
###################################################
(11*10*9)*(7*6*5*4)*31^3


###################################################
### code chunk number 134: IPSUR.Rnw:4637-4638
###################################################
prod(9:11)*prod(4:7)*31^3


###################################################
### code chunk number 135: IPSUR.Rnw:4644-4645
###################################################
prod(factorial(c(11,7))/factorial(c(8,3)))*31^3


###################################################
### code chunk number 136: birthday
###################################################
#g <- Vectorize(pbirthday.ipsur)
#plot(1:50, g(1:50), xlab = "Number of people in room", ylab = "Prob(at least one match)")
#remove(g)
#abline(h = 0.5, lty = 2)
#abline(v = 23, lty = 2)


###################################################
### code chunk number 137: IPSUR.Rnw:4739-4746 (eval = FALSE)
###################################################
## #library(RcmdrPlugin.IPSUR)
## g <- Vectorize(pbirthday.ipsur)
## plot(1:50, g(1:50), xlab = "Number of people in room",
##   ylab = "Prob(at least one match)" )
## abline(h = 0.5)
## abline(v = 23, lty = 2)
## remove(g)


###################################################
### code chunk number 138: IPSUR.Rnw:4855-4857
###################################################
S <- rolldie(2, makespace = TRUE)  # assumes ELM
head(S)                            #  first few rows


###################################################
### code chunk number 139: IPSUR.Rnw:4863-4865
###################################################
A <- subset(S, X1 == X2)
B <- subset(S, X1 + X2 >= 8)


###################################################
### code chunk number 140: IPSUR.Rnw:4871-4873
###################################################
Prob(A, given = B)
Prob(B, given = A)


###################################################
### code chunk number 141: IPSUR.Rnw:4880-4882
###################################################
Prob(S, X1==X2, given = (X1 + X2 >= 8) )
Prob(S, X1+X2 >= 8, given = (X1==X2) )


###################################################
### code chunk number 142: IPSUR.Rnw:4976-4979
###################################################
L <- cards()
M <- urnsamples(L, size = 2)
N <- probspace(M)


###################################################
### code chunk number 143: IPSUR.Rnw:4989-4990
###################################################
Prob(N, all(rank == "A"))


###################################################
### code chunk number 144: IPSUR.Rnw:5025-5028
###################################################
L <- rep(c("red","green"), times = c(7,3))
M <- urnsamples(L, size = 3, replace = FALSE, ordered = TRUE)
N <- probspace(M)


###################################################
### code chunk number 145: IPSUR.Rnw:5041-5042
###################################################
Prob(N, isrep(N, "red", 3))


###################################################
### code chunk number 146: IPSUR.Rnw:5048-5049
###################################################
Prob(N, isrep(N, "red", 2))


###################################################
### code chunk number 147: IPSUR.Rnw:5057-5058
###################################################
Prob(N, isin(N, c("red","green","red"), ordered = TRUE))


###################################################
### code chunk number 148: IPSUR.Rnw:5065-5066
###################################################
Prob(N, isin(N, c("red","green","red")))


###################################################
### code chunk number 149: IPSUR.Rnw:5106-5110
###################################################
#library(RcmdrPlugin.IPSUR)
#data(RcmdrTestDrive)
#.Table <- xtabs( ~ smoking + gender, data = RcmdrTestDrive)
#addmargins(.Table) # Table with marginal distributions


###################################################
### code chunk number 150: IPSUR.Rnw:5282-5285
###################################################
S <- tosscoin(10, makespace = TRUE)
A <- subset(S, isrep(S, vals = "T", nrep = 10))
1 - Prob(A)


###################################################
### code chunk number 151: IPSUR.Rnw:5321-5322
###################################################
iidspace(c("H","T"), ntrials = 3, probs = c(0.7, 0.3))


###################################################
### code chunk number 152: IPSUR.Rnw:5553-5557
###################################################
prior <- c(0.6, 0.3, 0.1)
like <- c(0.003, 0.007, 0.010)
post <- prior # like
post / sum(post)


###################################################
### code chunk number 153: IPSUR.Rnw:5576-5579
###################################################
newprior <- post
post <- newprior * like^7
post / sum(post)


###################################################
### code chunk number 154: IPSUR.Rnw:5600-5602
###################################################
fastpost <- prior * like^8
fastpost / sum(fastpost)


###################################################
### code chunk number 155: IPSUR.Rnw:5712-5714
###################################################
S <- rolldie(3, nsides = 4, makespace = TRUE)
S <- addrv(S, U = X1-X2+X3)


###################################################
### code chunk number 156: IPSUR.Rnw:5721-5722
###################################################
head(S)


###################################################
### code chunk number 157: IPSUR.Rnw:5729-5730
###################################################
Prob(S, U > 6)


###################################################
### code chunk number 158: IPSUR.Rnw:5744-5747
###################################################
S <- addrv(S, FUN = max, invars = c("X1","X2","X3"), name = "V")
S <- addrv(S, FUN = sum, invars = c("X1","X2","X3"), name = "W")
head(S)


###################################################
### code chunk number 159: IPSUR.Rnw:5771-5772
###################################################
marginal(S, vars = "V")


###################################################
### code chunk number 160: IPSUR.Rnw:5782-5783
###################################################
marginal(S, vars = c("V", "W"))


###################################################
### code chunk number 161: IPSUR.Rnw:5858-5864
###################################################
# This chapter's package dependencies
library(distrEx)
distroptions("WarningSim" = FALSE)
         # switches off warnings as to (In)accuracy due to simulations
distroptions("WarningArith" = FALSE)
         # switches off warnings as to arithmetics


###################################################
### code chunk number 162: IPSUR.Rnw:6041-6043
###################################################
x <- c(0,1,2,3)
f <- c(1/8, 3/8, 3/8, 1/8)


###################################################
### code chunk number 163: IPSUR.Rnw:6051-6053
###################################################
mu <- sum(x * f)
mu


###################################################
### code chunk number 164: IPSUR.Rnw:6062-6064
###################################################
sigma2 <- sum((x-mu)^2 * f)
sigma2


###################################################
### code chunk number 165: IPSUR.Rnw:6068-6070
###################################################
sigma <- sqrt(sigma2)
sigma


###################################################
### code chunk number 166: IPSUR.Rnw:6077-6079
###################################################
F <- cumsum(f)
F


###################################################
### code chunk number 167: IPSUR.Rnw:6088-6091
###################################################
library(distrEx)
X <- DiscreteDistribution(supp = 0:3, prob = c(1,3,3,1)/8)
E(X); # var(X); sd(X)


###################################################
### code chunk number 168: IPSUR.Rnw:6236-6239
###################################################
A <- data.frame(Pr=dbinom(0:4, size = 4, prob = 0.5))
rownames(A) <- 0:4
A


###################################################
### code chunk number 169: IPSUR.Rnw:6270-6272
###################################################
pbinom(9, size=12, prob=1/6) - pbinom(6, size=12, prob=1/6)
diff(pbinom(c(6,9), size = 12, prob = 1/6))  # same thing


###################################################
### code chunk number 170: binom-cdf-base
###################################################
plot(0, xlim = c(-1.2, 4.2), ylim = c(-0.04, 1.04), type = "n", xlab = "number of successes", ylab = "cumulative probability")
abline(h = c(0,1), lty = 2, col = "grey")
lines(stepfun(0:3, pbinom(-1:3, size = 3, prob = 0.5)), verticals = FALSE, do.p = FALSE)
points(0:3, pbinom(0:3, size = 3, prob = 0.5), pch = 16, cex = 1.2)
points(0:3, pbinom(-1:2, size = 3, prob = 0.5), pch = 1, cex = 1.2)


###################################################
### code chunk number 171: IPSUR.Rnw:6345-6347
###################################################
X <- Binom(size = 3, prob = 1/2)
X


###################################################
### code chunk number 172: IPSUR.Rnw:6355-6357
###################################################
d(X)(1)   # pmf of X evaluated at x = 1
p(X)(2)   # cdf of X evaluated at x = 2


###################################################
### code chunk number 173: binom-plot-distr
###################################################
X <- Binom(size = 3, prob = 1/2)
plot(X, cex = 0.2, cex.main=0.7)


###################################################
### code chunk number 174: IPSUR.Rnw:6622-6625
###################################################
X <- Binom(size = 3, prob = 0.45)
E(X)
E(3*X + 4)


###################################################
### code chunk number 175: IPSUR.Rnw:6637-6639
###################################################
#var(X)
sd(X)


###################################################
### code chunk number 176: IPSUR.Rnw:6692-6694
###################################################
x <- c(4, 7, 9, 11, 12)
ecdf(x)


###################################################
### code chunk number 177: empirical-cdf
###################################################
plot(ecdf(x))


###################################################
### code chunk number 178: IPSUR.Rnw:6729-6732
###################################################
epdf <- function(x) function(t){sum(x %in% t)/length(x)}
x <- c(0,0,1)
epdf(x)(0)       # should be 2/3


###################################################
### code chunk number 179: IPSUR.Rnw:6738-6740
###################################################
x <- c(0,0,1)
sample(x, size = 7, replace = TRUE)


###################################################
### code chunk number 180: IPSUR.Rnw:6815-6816
###################################################
dhyper(3, m = 17, n = 233, k = 5)


###################################################
### code chunk number 181: IPSUR.Rnw:6824-6825
###################################################
sum(dhyper(0:2, m = 17, n = 233, k = 5))


###################################################
### code chunk number 182: IPSUR.Rnw:6830-6831
###################################################
phyper(2, m = 17, n = 233, k = 5)


###################################################
### code chunk number 183: IPSUR.Rnw:6839-6840
###################################################
phyper(1, m = 17, n = 233, k = 5, lower.tail = FALSE)


###################################################
### code chunk number 184: IPSUR.Rnw:6848-6849
###################################################
x <- rhyper(100000, m = 17, n = 233, k = 5)


###################################################
### code chunk number 185: IPSUR.Rnw:6858-6859
###################################################
mean(x)


###################################################
### code chunk number 186: IPSUR.Rnw:6867-6868
###################################################
sd(x)


###################################################
### code chunk number 187: IPSUR.Rnw:6963-6964
###################################################
pgeom(4, prob = 0.812, lower.tail = FALSE)


###################################################
### code chunk number 188: IPSUR.Rnw:7030-7031
###################################################
dnbinom(5, size = 7, prob = 0.5)


###################################################
### code chunk number 189: IPSUR.Rnw:7159-7160
###################################################
dpois(0, lambda = 5)


###################################################
### code chunk number 190: IPSUR.Rnw:7175-7176
###################################################
diff(ppois(c(47, 50), lambda = 50))


###################################################
### code chunk number 191: IPSUR.Rnw:7434-7441
###################################################
# This chapter's package dependencies
library(actuar)
library(distrEx)
distroptions("WarningSim" = FALSE)
         # switches off warnings as to (In)accuracy due to simulations
distroptions("WarningArith" = FALSE)
         # switches off warnings as to arithmetics


###################################################
### code chunk number 192: IPSUR.Rnw:7699-7701
###################################################
f <- function(x) 3*x^2
integrate(f, lower = 0.14, upper = 0.71)


###################################################
### code chunk number 193: IPSUR.Rnw:7717-7719
###################################################
g <- function(x) 3/x^3
integrate(g, lower = 1, upper = Inf)


###################################################
### code chunk number 194: IPSUR.Rnw:7735-7738
###################################################
f <- function(x) 3*x^2
X <- AbscontDistribution(d = f, low1 = 0, up1 = 1)
p(X)(0.71) - p(X)(0.14)


###################################################
### code chunk number 195: IPSUR.Rnw:7744-7745
###################################################
#E(X); var(X); 3/80


###################################################
### code chunk number 196: norm-pdf
###################################################
curve(dnorm(x, mean=4, sd = 1), from = 0, to=8, xlab = substitute(mu))
x = 1:7
y = dnorm(x, mean=4, sd = 1)
lines(x, y, type = "h", lty =2)
text(4.5, 0.05, expression(sigma))
text(3.5, 0.05, expression(sigma))
text(2.5, 0.05, expression(sigma))
text(5.5, 0.05, expression(sigma))
text(6.5, 0.25, expression(paste(frac(1, sigma*sqrt(2*pi)), " ",
                            plain(e)^{frac(-(x-mu)^2, 2*sigma^2)})),cex = 1.2)


###################################################
### code chunk number 197: IPSUR.Rnw:7901-7902
###################################################
pnorm(1:3) - pnorm(-(1:3))


###################################################
### code chunk number 198: IPSUR.Rnw:7951-7953
###################################################
g <- function(x) pnorm(x, mean = 100, sd = 15) - 0.99
uniroot(g, interval = c(130, 145))


###################################################
### code chunk number 199: IPSUR.Rnw:7956-7957
###################################################
temp <- round(uniroot(g, interval = c(130, 145))$root, 4)


###################################################
### code chunk number 200: IPSUR.Rnw:8044-8045
###################################################
qnorm(0.99, mean = 100, sd = 15)


###################################################
### code chunk number 201: IPSUR.Rnw:8057-8058
###################################################
qnorm(c(0.025, 0.01, 0.005), lower.tail = FALSE)


###################################################
### code chunk number 202: IPSUR.Rnw:8293-8296
###################################################
X <- Norm(mean = 0, sd = 1)
Y <- 4 - 3*X
Y


###################################################
### code chunk number 203: IPSUR.Rnw:8305-8307
###################################################
Y <- exp(X)
Y


###################################################
### code chunk number 204: IPSUR.Rnw:8333-8335
###################################################
W <- sin(exp(X) + 27)
W


###################################################
### code chunk number 205: IPSUR.Rnw:8347-8350
###################################################
p(W)(0.5)
W <- sin(exp(X) + 27)
p(W)(0.5)


###################################################
### code chunk number 206: chisq-dist-vary-df
###################################################
curve(dchisq(x, df = 3), from = 0, to = 20, ylab = "y")
ind <- c(4, 5, 10, 15)
for (i in ind) curve(dchisq(x, df = i), 0, 20, add = TRUE)


###################################################
### code chunk number 207: IPSUR.Rnw:8672-8673
###################################################
mgamma(1:4, shape = 13, rate = 1)


###################################################
### code chunk number 208: gamma-mgf
###################################################
plot(function(x){mgfgamma(x, shape = 13, rate = 1)},
     from=-0.1, to=0.1, ylab = "gamma mgf")


###################################################
### code chunk number 209: IPSUR.Rnw:8788-8794
###################################################
# This chapter's package dependencies
library(ggplot2)
library(grid)
library(lattice)
library(mvtnorm)
library(prob)


###################################################
### code chunk number 210: IPSUR.Rnw:9081-9085
###################################################
S <- rolldie(2, makespace = TRUE)
S <- addrv(S, FUN = max, invars = c("X1","X2"), name = "U")
S <- addrv(S, FUN = sum, invars = c("X1","X2"), name = "V")
head(S)


###################################################
### code chunk number 211: IPSUR.Rnw:9090-9092
###################################################
UV <- marginal(S, vars = c("U", "V"))
head(UV)


###################################################
### code chunk number 212: IPSUR.Rnw:9097-9098
###################################################
xtabs(round(probs,3) ~ U + V, data = UV)


###################################################
### code chunk number 213: IPSUR.Rnw:9103-9105
###################################################
marginal(UV, vars = "U")
head(marginal(UV, vars = "V"))


###################################################
### code chunk number 214: IPSUR.Rnw:9110-9113
###################################################
temp <- xtabs(probs ~ U + V, data = UV)
rowSums(temp)
colSums(temp)


###################################################
### code chunk number 215: IPSUR.Rnw:9235-9239
###################################################
Eu <- sum(S$U*S$probs)
Ev <- sum(S$V*S$probs)
Euv <- sum(S$U*S$V*S$probs)
Euv - Eu * Ev


###################################################
### code chunk number 216: IPSUR.Rnw:9795-9799 (eval = FALSE)
###################################################
## library("emdbook"); library("mvtnorm") # note: the order matters
## mu <- c(0,0); sigma <- diag(2)
## f <- function(x,y) dmvnorm(c(x,y), mean = mu, sigma = sigma)
## curve3d(f(x,y), from=c(-3,-3), to=c(3,3), theta=-30, phi=30)


###################################################
### code chunk number 217: IPSUR.Rnw:9810-9815 (eval = FALSE)
###################################################
## x <- y <- seq(from = -3, to = 3, length.out = 30)
## f <- function(x,y) dmvnorm(cbind(x,y), mean = c(0,0),
##                            sigma = diag(2))
## z <- outer(x, y, FUN = f)
## persp(x, y, z, theta = -30, phi = 30, ticktype = "detailed")


###################################################
### code chunk number 218: mvnorm-pdf
###################################################
x <- y <- seq(from = -3, to = 3, length.out = 30)
f <- function(x,y) dmvnorm(cbind(x,y), mean = c(0,0), sigma = diag(2))
z <- outer(x, y, FUN = f)
persp(x, y, z, theta = -30, phi = 30, ticktype = "detailed")


###################################################
### code chunk number 219: IPSUR.Rnw:10246-10251
###################################################
tmp <- t(xsimplex(3, 6))
p <- apply(tmp, MARGIN = 1, FUN = dmultinom, prob = c(36,27,37))
S <- probspace(tmp, probs = p)
ProbTable <- xtabs(probs ~ X1 + X2, data = S)
round(ProbTable, 3)


###################################################
### code chunk number 220: IPSUR.Rnw:10261-10267 (eval = FALSE)
###################################################
## library("scatterplot3d")
## X <- t(as.matrix(expand.grid(0:6, 0:6)))
## X <- X[, colSums(X) <= 6 ]; X <- rbind(X, 6 - colSums(X))
## Z <- round(apply(X, 2, function(x) dmultinom(x, prob = 1:3)), 3)
## A <- data.frame(x = X[1, ], y = X[2, ], probability = Z)
## scatterplot3d(A, type = "h", lwd = 3, box = FALSE)


###################################################
### code chunk number 221: IPSUR.Rnw:10275-10277 (eval = FALSE)
###################################################
## cloud(probs ~ X1 + X2, data = S, type = c("p","h"), lwd = 2,
##             pch = 16, cex = 1.5, screen = list(z = 15, x = -70))


###################################################
### code chunk number 222: multinom-pmf2
###################################################
print(cloud(probs ~ X1 + X2, data = S, type = c("p","h"), lwd = 2,
            pch = 16, cex = 1.5), screen = list(z = 15, x = -70))


###################################################
### code chunk number 223: students-t-dist-vary-df
###################################################
curve(dt(x, df = 30), from = -3, to = 3, lwd = 3, ylab = "y")
ind <- c(1, 2, 3, 5, 10)
for (i in ind) curve(dt(x, df = i), -3, 3, add = TRUE)


###################################################
### code chunk number 224: IPSUR.Rnw:10609-10610
###################################################
qt(0.01, df = 23, lower.tail = FALSE)


###################################################
### code chunk number 225: IPSUR.Rnw:10713-10714 (eval = FALSE)
###################################################
## example(clt.examp)


###################################################
### code chunk number 226: IPSUR.Rnw:10717-10718 (eval = FALSE)
###################################################
## example(illustrateCLT)


###################################################
### code chunk number 227: IPSUR.Rnw:10937-10938
###################################################
iqrs <- replicate(10000, IQR(rnorm(15)))


###################################################
### code chunk number 228: IPSUR.Rnw:10942-10943
###################################################
mean(iqrs)    # close to 1.23


###################################################
### code chunk number 229: IPSUR.Rnw:10947-10948
###################################################
sd(iqrs) # close to 0.35


###################################################
### code chunk number 230: simulated-iqr
###################################################
hist(iqrs, breaks = 20)


###################################################
### code chunk number 231: IPSUR.Rnw:10969-10970
###################################################
mads <- replicate(10000, mad(rexp(17)))


###################################################
### code chunk number 232: IPSUR.Rnw:10975-10976
###################################################
mean(mads); sd(mads)


###################################################
### code chunk number 233: simulated-mads
###################################################
hist(mads, breaks = 20)


###################################################
### code chunk number 234: IPSUR.Rnw:10997-11000
###################################################
k <- 1
n <- sample(10:30, size=10, replace = TRUE)
mu <- round(rnorm(10, mean = 20))


###################################################
### code chunk number 235: IPSUR.Rnw:11083-11088
###################################################
library(Hmisc)
#library(RcmdrPlugin.IPSUR)
library(reshape)
library(stats4)
library(TeachingDemos)


###################################################
### code chunk number 236: capture-recapture
###################################################
heights = rep(0, 16)
for (j in 7:15) heights[j] <- dhyper(3, m = 7, n = j - 7, k = 4)
plot(6:15, heights[6:15], pch = 16, cex = 1.5, xlab = "number of fish in pond", ylab = "Likelihood")
abline(h = 0)
lines(6:15, heights[6:15], type = "h", lwd = 2, lty = 3)
text(9, heights[9]/6, bquote(hat(F)==.(9)), cex = 2, pos = 4)
lines(9, heights[9], type = "h", lwd = 2)
points(9, 0, pch = 4, lwd = 3, cex = 2)


###################################################
### code chunk number 237: fishing-part-two
###################################################
curve(x^5*(1-x)^2, 0, 1, xlab = "p", ylab = "L(p)")
curve(x^4*(1-x)^3, 0, 1, add = TRUE)
curve(x^3*(1-x)^4, 0, 1, add = TRUE)


###################################################
### code chunk number 238: species-mle
###################################################
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
text(mle, mleobj/4, substitute(hat(theta)==a, list(a=round(mle, 4))), cex = 1.3, pos = 4)


###################################################
### code chunk number 239: IPSUR.Rnw:11477-11480
###################################################
x <- mtcars$am
L <- function(p,x) prod(dbinom(x, size = 1, prob = p))
optimize(L, interval = c(0,1), x = x, maximum = TRUE)


###################################################
### code chunk number 240: IPSUR.Rnw:11484-11486
###################################################
A <- optimize(L, interval = c(0,1), x = x, maximum = TRUE)
amax <- A$maximum; aobj <- A$objective


###################################################
### code chunk number 241: IPSUR.Rnw:11505-11509
###################################################
minuslogL <- function(p,x){
                -sum(dbinom(x, size = 1, prob = p, log = TRUE))
             }
optimize(minuslogL, interval = c(0,1), x = x)


###################################################
### code chunk number 242: IPSUR.Rnw:11538-11541
###################################################
minuslogL <- function(mu, sigma2){
  -sum(dnorm(x, mean = mu, sd = sqrt(sigma2), log = TRUE))
}


###################################################
### code chunk number 243: IPSUR.Rnw:11552-11556
###################################################
library(stats4)
x <- PlantGrowth$weight
MaxLikeEst <- mle(minuslogL, start = list(mu = 5, sigma2 = 0.5))
summary(MaxLikeEst)


###################################################
### code chunk number 244: IPSUR.Rnw:11565-11566
###################################################
mean(x); var(x)*29/30; sd(x)/sqrt(30)


###################################################
### code chunk number 245: ci-examp
###################################################
ci.examp()


###################################################
### code chunk number 246: IPSUR.Rnw:11722-11723
###################################################
with(PlantGrowth, stem.leaf(weight))


###################################################
### code chunk number 247: IPSUR.Rnw:11732-11733
###################################################
dim(PlantGrowth)   # sample size is first entry


###################################################
### code chunk number 248: IPSUR.Rnw:11737-11738
###################################################
with(PlantGrowth, mean(weight))


###################################################
### code chunk number 249: IPSUR.Rnw:11742-11743
###################################################
qnorm(0.975)


###################################################
### code chunk number 250: IPSUR.Rnw:11847-11849
###################################################
x <- with(morley, Speed[Expt == 1])
x


###################################################
### code chunk number 251: morley-qqplot
###################################################
library(RcmdrMisc)
qqPlot(x)


###################################################
### code chunk number 252: IPSUR.Rnw:11875-11876
###################################################
mean(x); sd(x)


###################################################
### code chunk number 253: IPSUR.Rnw:11881-11882
###################################################
qt(0.995, df = 19)


###################################################
### code chunk number 254: IPSUR.Rnw:11897-11898
###################################################
with(PlantGrowth, z.test(weight, sd = 0.7))


###################################################
### code chunk number 255: IPSUR.Rnw:11908-11909
###################################################
t.test(x, conf.level = 0.99)


###################################################
### code chunk number 256: IPSUR.Rnw:11915-11916
###################################################
t.test(x, conf.level = 0.99, alternative = "greater")


###################################################
### code chunk number 257: IPSUR.Rnw:12030-12032
###################################################
x = with(ToothGrowth, len[supp == "VC"])
y = with(ToothGrowth, len[supp == "OJ"])


###################################################
### code chunk number 258: tooth-qqplot
###################################################
library(RcmdrMisc)
par(mfrow = c(2,1))
qqPlot(x)
qqPlot(y)
par(mfrow = c(1,1))


###################################################
### code chunk number 259: IPSUR.Rnw:12057-12058
###################################################
t.test(x, y, conf.level = 0.99)


###################################################
### code chunk number 260: IPSUR.Rnw:12063-12064
###################################################
t.test(x, y, conf.level = 0.99, var.equal = TRUE)


###################################################
### code chunk number 261: IPSUR.Rnw:12069-12070
###################################################
t.test(len ~ supp, data = ToothGrowth, conf.level = 0.99)


###################################################
### code chunk number 262: IPSUR.Rnw:12183-12185
###################################################
library(Hmisc)
binconf(x = 7, n = 25, alpha = 0.05, method = "asymptotic")


###################################################
### code chunk number 263: IPSUR.Rnw:12190-12191
###################################################
binconf(x = 7, n = 25, alpha = 0.05, method = "wilson")


###################################################
### code chunk number 264: IPSUR.Rnw:12196-12197
###################################################
binconf(x = 7, n = 25)


###################################################
### code chunk number 265: IPSUR.Rnw:12202-12203
###################################################
prop.test(x = 7, n = 25, conf.level = 0.95, correct = FALSE)


###################################################
### code chunk number 266: IPSUR.Rnw:12208-12209
###################################################
prop.test(x = 7, n = 25, alternative = "greater", correct = FALSE)


###################################################
### code chunk number 267: IPSUR.Rnw:12216-12218
###################################################
prop.test(x = c(7,11), n = c(25,37), 
          conf.level = 0.99, correct = FALSE)


###################################################
### code chunk number 268: IPSUR.Rnw:12292-12295
###################################################
x <- with(morley, Speed[Expt == 1])
library(TeachingDemos)
sigma.test(x, conf.level = 0.99)


###################################################
### code chunk number 269: IPSUR.Rnw:12300-12301
###################################################
var.test(len ~ supp, data = ToothGrowth, conf.level = 0.99)


###################################################
### code chunk number 270: IPSUR.Rnw:12429-12431
###################################################
power.t.test(delta = 1, sd = 105, sig.level = 0.05, 
             type = "one.sample", power = 0.5)


###################################################
### code chunk number 271: IPSUR.Rnw:12463-12466
###################################################
# This chapter's package dependencies
library(TeachingDemos)
library(HH)


###################################################
### code chunk number 272: IPSUR.Rnw:12469-12584
###################################################
# need this for plotting hypothesis tests
# based on work with R. Heiberger in 2009-10

plot.htest <- function (x, hypoth.or.conf = 'Hypoth',...) {
  require(HH)
  if (x$method == "1-sample proportions test with continuity correction" || x$method == "1-sample proportions test without continuity correction"){
    mu <- x$null.value
    obs.mean <- x$estimate
    n <- NA
    std.dev <- abs(obs.mean - mu)/sqrt(x$statistic)
    deg.freedom <- NA
    if(x$alternative == "two.sided"){
      alpha.right <- (1 - attr(x$conf.int, "conf.level"))/2
      Use.alpha.left <- TRUE
      Use.alpha.right <- TRUE
    } else if (x$alternative == "less") {
      alpha.right <- 1 - attr(x$conf.int, "conf.level")
      Use.alpha.left <- TRUE
      Use.alpha.right <- FALSE
    } else {
      alpha.right <- 1 - attr(x$conf.int, "conf.level")
      Use.alpha.left <- FALSE
      Use.alpha.right <- TRUE
    }

  } else if (x$method == "One Sample z-test"){
    mu <- x$null.value
    obs.mean <- x$estimate
    n <- x$parameter[1]
    std.dev <- x$parameter[2]
    deg.freedom <- NA
    if(x$alternative == "two.sided"){
      alpha.right <- (1 - attr(x$conf.int, "conf.level"))/2
      Use.alpha.left <- TRUE
      Use.alpha.right <- TRUE
    } else if (x$alternative == "less") {
      alpha.right <- 1 - attr(x$conf.int, "conf.level")
      Use.alpha.left <- TRUE
      Use.alpha.right <- FALSE
    } else {
      alpha.right <- 1 - attr(x$conf.int, "conf.level")
      Use.alpha.left <- FALSE
      Use.alpha.right <- TRUE
    }
  } else if (x$method == "One Sample t-test" || x$method == "Paired t-test"){
    mu <- x$null.value
    obs.mean <- x$estimate
    n <- x$parameter + 1
    std.dev <- x$estimate/x$statistic*sqrt(n)
    deg.freedom <- x$parameter
    if(x$alternative == "two.sided"){
      alpha.right <- (1 - attr(x$conf.int, "conf.level"))/2
      Use.alpha.left <- TRUE
      Use.alpha.right <- TRUE
    } else if (x$alternative == "less") {
      alpha.right <- 1 - attr(x$conf.int, "conf.level")
      Use.alpha.left <- TRUE
      Use.alpha.right <- FALSE
    } else {
      alpha.right <- 1 - attr(x$conf.int, "conf.level")
      Use.alpha.left <- FALSE
      Use.alpha.right <- TRUE
    }
  } else if (x$method == "Welch Two Sample t-test"){
    mu <- x$null.value
    obs.mean <- -diff(x$estimate)
    n <- x$parameter + 2
    std.dev <- obs.mean/x$statistic*sqrt(n)
    deg.freedom <- x$parameter
    if(x$alternative == "two.sided"){
      alpha.right <- (1 - attr(x$conf.int, "conf.level"))/2
      Use.alpha.left <- TRUE
      Use.alpha.right <- TRUE
    } else if (x$alternative == "less") {
      alpha.right <- 1 - attr(x$conf.int, "conf.level")
      Use.alpha.left <- TRUE
      Use.alpha.right <- FALSE
    } else {
      alpha.right <- 1 - attr(x$conf.int, "conf.level")
      Use.alpha.left <- FALSE
      Use.alpha.right <- TRUE
    }
  } else if (x$method == " Two Sample t-test"){
    mu <- x$null.value
    obs.mean <- -diff(x$estimate)
    n <- x$parameter + 2
    std.dev <- obs.mean/x$statistic*sqrt(n)
    deg.freedom <- x$parameter
    if(x$alternative == "two.sided"){
      alpha.right <- (1 - attr(x$conf.int, "conf.level"))/2
      Use.alpha.left <- TRUE
      Use.alpha.right <- TRUE
    } else if (x$alternative == "less") {
      alpha.right <- 1 - attr(x$conf.int, "conf.level")
      Use.alpha.left <- TRUE
      Use.alpha.right <- FALSE
    } else {
      alpha.right <- 1 - attr(x$conf.int, "conf.level")
      Use.alpha.left <- FALSE
      Use.alpha.right <- TRUE
    }
  }
  return(normal.and.t.dist(
    mu.H0 = mu,
    obs.mean = obs.mean,
    std.dev = std.dev,
    n = n,
    deg.freedom = deg.freedom,
    alpha.right = alpha.right,
    Use.obs.mean = TRUE,
    Use.alpha.left = Use.alpha.left,
    Use.alpha.right = Use.alpha.right,
    hypoth.or.conf = hypoth.or.conf)
  )
}


###################################################
### code chunk number 273: IPSUR.Rnw:12666-12667
###################################################
dhyper(0, m = 26, n = 26, k = 5)


###################################################
### code chunk number 274: IPSUR.Rnw:12846-12847
###################################################
-qnorm(0.99)


###################################################
### code chunk number 275: IPSUR.Rnw:12854-12855
###################################################
xtabs(Freq ~ Admit, data = UCBAdmissions)


###################################################
### code chunk number 276: IPSUR.Rnw:12861-12863
###################################################
phat <- 1755/(1755 + 2771)
(phat - 0.4)/sqrt(0.4 * 0.6/(1755 + 2771))


###################################################
### code chunk number 277: IPSUR.Rnw:12887-12888
###################################################
-qnorm(0.95)


###################################################
### code chunk number 278: IPSUR.Rnw:12945-12946
###################################################
pnorm(-1.680919)


###################################################
### code chunk number 279: proptest-plot
###################################################
plot(prop.test(1755, n = 4526, p = 0.4, alternative = "less", correct = FALSE))


###################################################
### code chunk number 280: IPSUR.Rnw:13021-13023
###################################################
prop.test(1755, n = 4526, p = 0.4, alternative = "less",
           correct = FALSE)


###################################################
### code chunk number 281: IPSUR.Rnw:13029-13032 (eval = FALSE)
###################################################
## temp <- prop.test(1755, n = 4526, p = 0.4, alternative = "less",
##            correct = FALSE)
## plot(temp)


###################################################
### code chunk number 282: IPSUR.Rnw:13051-13053
###################################################
addmargins(xtabs(Freq ~ Sex + Survived, data = Titanic), 
           margin=2)


###################################################
### code chunk number 283: IPSUR.Rnw:13058-13059
###################################################
prop.test(x = c(1364, 126), n = c(1731, 470), correct = FALSE)


###################################################
### code chunk number 284: IPSUR.Rnw:13157-13158
###################################################
2*(1 - pnorm(2.136))


###################################################
### code chunk number 285: ztest-plot
###################################################
plot(z.test(PlantGrowth$weight, mu = 4.8, sd = 0.7))


###################################################
### code chunk number 286: IPSUR.Rnw:13202-13203
###################################################
1 - pt(2.727796, df = 19)


###################################################
### code chunk number 287: IPSUR.Rnw:13225-13228
###################################################
library(TeachingDemos)
z.test(PlantGrowth$weight, mu = 4.8, sd = 0.7, 
       alternative = "two.sided")


###################################################
### code chunk number 288: IPSUR.Rnw:13235-13237
###################################################
x <- with(morley, Speed[Expt == 1])
t.test(x, mu = 845, conf.level = 0.99, alternative = "greater")


###################################################
### code chunk number 289: IPSUR.Rnw:13277-13278 (eval = FALSE)
###################################################
## sigma.test(morley$Speed, sigma = 79)


###################################################
### code chunk number 290: IPSUR.Rnw:13453-13454
###################################################
head(sleep)


###################################################
### code chunk number 291: IPSUR.Rnw:13460-13461
###################################################
t.test(extra ~ group, data = sleep, paired = TRUE)


###################################################
### code chunk number 292: IPSUR.Rnw:13467-13470
###################################################
sleep2 <- reshape(sleep, direction = "wide", 
                  idvar = "ID", timevar = "group")
head(sleep2)


###################################################
### code chunk number 293: IPSUR.Rnw:13476-13477
###################################################
t.test(Pair(extra.1, extra.2) ~ 1, data = sleep2)


###################################################
### code chunk number 294: IPSUR.Rnw:13523-13524
###################################################
with(morley, shapiro.test(Speed))


###################################################
### code chunk number 295: IPSUR.Rnw:13538-13539
###################################################
with(randu, ks.test(x, "punif"))


###################################################
### code chunk number 296: between-versus-within
###################################################
par(mfrow = c(2,1))
y1 <- rnorm(300, mean = c(2,8,22))
plot(y1, xlim = c(-1,25), ylim = c(0,0.45) , type = "n", ylab="density", xlab="response")
f <- function(x){dnorm(x, mean = 2)}
curve(f, from = -1, to = 5, add = TRUE, lwd = 2, col = "green")
f <- function(x){dnorm(x, mean = 8)}
curve(f, from = 5, to = 11, add = TRUE, lwd = 2, col = "blue")
f <- function(x){dnorm(x, mean = 22)}
curve(f, from = 19, to = 25, add = TRUE, lwd = 2, col = "red")
rug(y1[3*(0:99) + 1], col = "green")
rug(y1[3*(0:99) + 2], col = "blue")
rug(y1[3*(0:99) + 3], col = "red")
y1 <- rnorm(300, mean = c(7,8,9))
plot(y1, xlim = c(0,16), ylim = c(0,0.45) , type = "n", ylab="density", xlab="response")
f <- function(x){dnorm(x, mean = 7)}
curve(f, from = 4, to = 10, add = TRUE, lwd = 2, col = "green")
f <- function(x){dnorm(x, mean = 8)}
curve(f, from = 5, to = 11, add = TRUE, lwd = 2, col = "blue")
f <- function(x){dnorm(x, mean = 9)}
curve(f, from = 6, to = 12, add = TRUE, lwd = 2, col = "red")
rug(y1[3*(0:99) + 1], col = "green")
rug(y1[3*(0:99) + 2], col = "blue")
rug(y1[3*(0:99) + 3], col = "red")
par(mfrow = c(1,1))


###################################################
### code chunk number 297: IPSUR.Rnw:13681-13683
###################################################
weight.aov <- aov(weight ~ feed, data = chickwts)
anova(weight.aov)


###################################################
### code chunk number 298: IPSUR.Rnw:13692-13693
###################################################
model.tables(weight.aov, type = "means")


###################################################
### code chunk number 299: chickwts-qqplot-plot
###################################################
library(RcmdrMisc)
qqPlot(weight.aov, ylab = "")


###################################################
### code chunk number 300: power-examp
###################################################
power.examp()


###################################################
### code chunk number 301: IPSUR.Rnw:13848-13856
###################################################
mux <- 100 + sample(c(0, 2), size = 1)
x <- round(rnorm(n, mean = mux, sd = 13))/100
muy <- mux + sample(c(0, -2), size = 1)
y <- round(rnorm(n, mean = muy, sd = 13))/100
M = rbind(x,y)
rownames(M) = c("Choco", "Gator")
colnames(M) = as.character(1:n)
M


###################################################
### code chunk number 302: IPSUR.Rnw:13878-13881 (eval = FALSE)
###################################################
## attach(chickwts)
## by(weight, list(feed = feed), shapiro.test)
## detach(chickwts)


###################################################
### code chunk number 303: chickwts-qqmath-plot
###################################################
library(lattice)
qqmath(~weight | feed, data = chickwts)


###################################################
### code chunk number 304: chickwts-qqmath2-plot
###################################################
library(lattice)
qqmath(~weight | feed, data = chickwts, 
       prepanel = prepanel.qqmathline,
       panel = function(x, ...) {
          panel.qqmathline(x, ...)
          panel.qqmath(x, ...)
       })


###################################################
### code chunk number 305: chickwts-homovar-plot
###################################################
library(HH)
hovPlot(weight ~ feed, data = chickwts)


###################################################
### code chunk number 306: IPSUR.Rnw:13960-13961
###################################################
hov(weight ~ feed, data = chickwts)


###################################################
### code chunk number 307: IPSUR.Rnw:13975-13979
###################################################
# This chapter's package dependencies
library(HH)
library(lmtest)
library(RcmdrMisc)


###################################################
### code chunk number 308: philosophy
###################################################
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


###################################################
### code chunk number 309: IPSUR.Rnw:14144-14145
###################################################
head(cars)


###################################################
### code chunk number 310: carscatter
###################################################
plot(dist ~ speed, data = cars)


###################################################
### code chunk number 311: IPSUR.Rnw:14172-14173 (eval = FALSE)
###################################################
## plot(dist ~ speed, data = cars)


###################################################
### code chunk number 312: IPSUR.Rnw:14278-14279
###################################################
tmpcoef <- round(as.numeric(coef(lm(dist ~ speed, cars))), 2)


###################################################
### code chunk number 313: IPSUR.Rnw:14286-14287
###################################################
cars.lm <- lm(dist ~ speed, data = cars)


###################################################
### code chunk number 314: IPSUR.Rnw:14300-14301
###################################################
coef(cars.lm)


###################################################
### code chunk number 315: carline
###################################################
plot(dist ~ speed, data = cars)
abline(coef(cars.lm))


###################################################
### code chunk number 316: IPSUR.Rnw:14397-14398
###################################################
cars[5, ]


###################################################
### code chunk number 317: IPSUR.Rnw:14428-14429
###################################################
fitted(cars.lm)[1:5]


###################################################
### code chunk number 318: IPSUR.Rnw:14440-14441
###################################################
predict(cars.lm, newdata = data.frame(speed = c(6, 8, 21)))


###################################################
### code chunk number 319: IPSUR.Rnw:14481-14482
###################################################
residuals(cars.lm)[1:5]


###################################################
### code chunk number 320: IPSUR.Rnw:14486-14488
###################################################
tmpred <- round(as.numeric(predict(cars.lm, newdata = data.frame(speed = 8))), 2)
tmps <- round(summary(cars.lm)$sigma, 2)


###################################################
### code chunk number 321: IPSUR.Rnw:14507-14509
###################################################
carsumry <- summary(cars.lm)
carsumry$sigma


###################################################
### code chunk number 322: IPSUR.Rnw:14579-14581
###################################################
A <- matrix(as.numeric(round(carsumry$coef, 3)), nrow = 2)
B <- round(confint(cars.lm), 3)


###################################################
### code chunk number 323: IPSUR.Rnw:14586-14587
###################################################
summary(cars.lm)


###################################################
### code chunk number 324: IPSUR.Rnw:14599-14600
###################################################
confint(cars.lm)


###################################################
### code chunk number 325: IPSUR.Rnw:14682-14683
###################################################
new <- data.frame(speed = c(5, 6, 21))


###################################################
### code chunk number 326: IPSUR.Rnw:14689-14690
###################################################
predict(cars.lm, newdata = new, interval = "confidence")


###################################################
### code chunk number 327: IPSUR.Rnw:14694-14695
###################################################
carsCI <- round(predict(cars.lm, newdata = new, interval = "confidence"), 2)


###################################################
### code chunk number 328: IPSUR.Rnw:14700-14701
###################################################
predict(cars.lm, newdata = new, interval = "prediction")


###################################################
### code chunk number 329: IPSUR.Rnw:14705-14706
###################################################
carsPI <- round(predict(cars.lm, newdata = new, interval = "prediction"), 2)


###################################################
### code chunk number 330: IPSUR.Rnw:14753-14755 (eval = FALSE)
###################################################
## library(HH)
## ci.plot(cars.lm)


###################################################
### code chunk number 331: carscipi
###################################################
print(ci.plot(cars.lm))


###################################################
### code chunk number 332: IPSUR.Rnw:14815-14816
###################################################
summary(cars.lm)


###################################################
### code chunk number 333: IPSUR.Rnw:14910-14911
###################################################
anova(cars.lm)


###################################################
### code chunk number 334: IPSUR.Rnw:14926-14927
###################################################
carsumry$r.squared


###################################################
### code chunk number 335: IPSUR.Rnw:14935-14936
###################################################
sqrt(carsumry$r.squared)


###################################################
### code chunk number 336: IPSUR.Rnw:14984-14985
###################################################
anova(cars.lm)


###################################################
### code chunk number 337: IPSUR.Rnw:14989-14990
###################################################
tmpf <- round(as.numeric(carsumry$fstatistic[1]), 2)


###################################################
### code chunk number 338: normal-hist-cars
###################################################
hist(residuals(cars.lm), breaks=15)


###################################################
### code chunk number 339: normal-q-q-plot-cars
###################################################
library(RcmdrMisc)
qqPlot(cars.lm)


###################################################
### code chunk number 340: IPSUR.Rnw:15077-15078
###################################################
shapiro.test(residuals(cars.lm))


###################################################
### code chunk number 341: std-resids-fitted-cars
###################################################
plot(cars.lm, which = 3)


###################################################
### code chunk number 342: IPSUR.Rnw:15164-15166
###################################################
library(lmtest)
bptest(cars.lm)


###################################################
### code chunk number 343: resids-fitted-cars
###################################################
plot(cars.lm, which = 1)


###################################################
### code chunk number 344: IPSUR.Rnw:15225-15226
###################################################
dwtest(cars.lm, alternative = "two.sided")


###################################################
### code chunk number 345: IPSUR.Rnw:15380-15382
###################################################
sres <- rstandard(cars.lm)
sres[1:5]


###################################################
### code chunk number 346: IPSUR.Rnw:15389-15390
###################################################
sres[which(abs(sres) > 2)]


###################################################
### code chunk number 347: IPSUR.Rnw:15398-15400
###################################################
sdelres <- rstudent(cars.lm)
sdelres[1:5]


###################################################
### code chunk number 348: IPSUR.Rnw:15409-15411
###################################################
t0.005 <- qt(0.005, df = 47, lower.tail = FALSE)
sdelres[which(abs(sdelres) > t0.005)]


###################################################
### code chunk number 349: IPSUR.Rnw:15418-15420
###################################################
leverage <- hatvalues(cars.lm)
leverage[which(leverage > 4/50)]


###################################################
### code chunk number 350: IPSUR.Rnw:15463-15465
###################################################
dfb <- dfbetas(cars.lm)
head(dfb)


###################################################
### code chunk number 351: IPSUR.Rnw:15484-15486
###################################################
dff <- dffits(cars.lm)
dff[1:5]


###################################################
### code chunk number 352: IPSUR.Rnw:15521-15523
###################################################
cooksD <- cooks.distance(cars.lm)
cooksD[1:4]


###################################################
### code chunk number 353: cooks-distance-cars
###################################################
plot(cars.lm, which = 4)


###################################################
### code chunk number 354: IPSUR.Rnw:15549-15551
###################################################
F0.50 <- qf(0.5, df1 = 2, df2 = 48)
any(cooksD > F0.50)


###################################################
### code chunk number 355: IPSUR.Rnw:15564-15565 (eval = FALSE)
###################################################
## influence.measures(cars.lm)


###################################################
### code chunk number 356: IPSUR.Rnw:15575-15576 (eval = FALSE)
###################################################
## plot(cars.lm)


###################################################
### code chunk number 357: diagnostic-plots-cars
###################################################
par(mfrow = c(2,2))
plot(cars.lm)
par(mfrow = c(1,1))


###################################################
### code chunk number 358: IPSUR.Rnw:15615-15617 (eval = FALSE)
###################################################
## plot(cars.lm, which = 5)          # std'd resids vs lev plot
## identify(leverage, sres, n = 4)   # identify 4 points


###################################################
### code chunk number 359: IPSUR.Rnw:15674-15677
###################################################
# This chapter's package dependencies
library(scatterplot3d)
library(lattice)


###################################################
### code chunk number 360: IPSUR.Rnw:15784-15785
###################################################
head(trees)


###################################################
### code chunk number 361: splom-trees
###################################################
splom(trees)


###################################################
### code chunk number 362: 3D-scatterplot-trees
###################################################
s3d <- with(trees, scatterplot3d(Girth, Height, Volume,
            pch = 16, highlight.3d = TRUE, angle = 60))
attach(trees)
  my.lm <- lm(Volume ~ Girth + Height)
  s3d$plane3d(my.lm, lty.box = "solid")
detach(trees)


###################################################
### code chunk number 363: IPSUR.Rnw:15952-15953
###################################################
fit <- lm(Volume ~ Girth + Height, data = trees)


###################################################
### code chunk number 364: IPSUR.Rnw:15956-15958
###################################################
trees.lm <- lm(Volume ~ Girth + Height, data = trees)
trees.lm


###################################################
### code chunk number 365: IPSUR.Rnw:15974-15975
###################################################
head(model.matrix(trees.lm))


###################################################
### code chunk number 366: IPSUR.Rnw:16064-16065
###################################################
fitted(trees.lm)[1:5]


###################################################
### code chunk number 367: IPSUR.Rnw:16081-16083
###################################################
new <- data.frame(Girth = c(9.1, 11.6, 12.5),
                  Height = c(69, 74, 87))


###################################################
### code chunk number 368: IPSUR.Rnw:16088-16089
###################################################
new


###################################################
### code chunk number 369: IPSUR.Rnw:16095-16096
###################################################
predict(trees.lm, newdata = new)


###################################################
### code chunk number 370: IPSUR.Rnw:16099-16100
###################################################
treesFIT <- round(predict(trees.lm, newdata = new), 1)


###################################################
### code chunk number 371: IPSUR.Rnw:16153-16154
###################################################
residuals(trees.lm)[1:5]


###################################################
### code chunk number 372: IPSUR.Rnw:16161-16163
###################################################
treesumry <- summary(trees.lm)
treesumry$sigma


###################################################
### code chunk number 373: IPSUR.Rnw:16226-16227
###################################################
confint(trees.lm)


###################################################
### code chunk number 374: IPSUR.Rnw:16230-16231
###################################################
treesPAR <- round(confint(trees.lm), 1)


###################################################
### code chunk number 375: IPSUR.Rnw:16283-16285
###################################################
new <- data.frame(Girth = c(9.1, 11.6, 12.5),
                  Height = c(69, 74, 87))


###################################################
### code chunk number 376: IPSUR.Rnw:16290-16291
###################################################
predict(trees.lm, newdata = new, interval = "confidence")


###################################################
### code chunk number 377: IPSUR.Rnw:16294-16295
###################################################
treesCI <- round(predict(trees.lm, newdata = new, interval = "confidence"), 1)


###################################################
### code chunk number 378: IPSUR.Rnw:16300-16301
###################################################
predict(trees.lm, newdata = new, interval = "prediction")


###################################################
### code chunk number 379: IPSUR.Rnw:16304-16305
###################################################
treesPI <- round(predict(trees.lm, newdata = new, interval = "prediction"), 1)


###################################################
### code chunk number 380: IPSUR.Rnw:16393-16394
###################################################
treesumry$r.squared


###################################################
### code chunk number 381: IPSUR.Rnw:16398-16399
###################################################
treesumry$adj.r.squared


###################################################
### code chunk number 382: IPSUR.Rnw:16431-16432
###################################################
treesumry$fstatistic


###################################################
### code chunk number 383: IPSUR.Rnw:16471-16472
###################################################
treesumry


###################################################
### code chunk number 384: scatterplot-volume-girth-trees
###################################################
plot(Volume ~ Girth, data = trees)


###################################################
### code chunk number 385: IPSUR.Rnw:16535-16538
###################################################
treesquad.lm <- lm(Volume ~ scale(Girth) + I(scale(Girth)^2),
                   data = trees)
summary(treesquad.lm)


###################################################
### code chunk number 386: fitting-the-quadratic
###################################################
plot(Volume ~ scale(Girth), data = trees)
lines(fitted(treesquad.lm) ~ scale(Girth), data = trees)


###################################################
### code chunk number 387: IPSUR.Rnw:16572-16574
###################################################
new <- data.frame(Girth = c(9.1, 11.6, 12.5))
predict(treesquad.lm, newdata = new, interval = "prediction")


###################################################
### code chunk number 388: IPSUR.Rnw:16585-16586
###################################################
summary(lm(Volume ~ Girth + I(Girth^2), data = trees))


###################################################
### code chunk number 389: IPSUR.Rnw:16600-16603
###################################################
trees$Tall <- cut(trees$Height, breaks = c(-Inf, 76, Inf),
                  labels = c("no","yes"))
trees$Tall[1:5]


###################################################
### code chunk number 390: IPSUR.Rnw:16634-16635
###################################################
class(trees$Tall)


###################################################
### code chunk number 391: IPSUR.Rnw:16642-16644
###################################################
treesdummy.lm <- lm(Volume ~ Girth + Tall, data = trees)
summary(treesdummy.lm)


###################################################
### code chunk number 392: dummy-variable-trees
###################################################
treesTall <- split(trees, trees$Tall)
treesTall[["yes"]]$Fit <- predict(treesdummy.lm,
                                  treesTall[["yes"]])
treesTall[["no"]]$Fit <- predict(treesdummy.lm,
                                 treesTall[["no"]])
plot(Volume ~ Girth, data = trees)
points(Volume ~ Girth, data = treesTall[["yes"]], pch = 1)
points(Volume ~ Girth, data = treesTall[["no"]], pch = 2)
lines(Fit ~ Girth, data = treesTall[["yes"]])
lines(Fit ~ Girth, data = treesTall[["no"]])


###################################################
### code chunk number 393: IPSUR.Rnw:16764-16767
###################################################
treesfull.lm <- lm(Volume ~ Girth + I(Girth^2) + Height +
                   I(Height^2), data = trees)
summary(treesfull.lm)


###################################################
### code chunk number 394: IPSUR.Rnw:16780-16781
###################################################
treesreduced.lm <- lm(Volume ~ -1 + Girth + I(Girth^2), data = trees)


###################################################
### code chunk number 395: IPSUR.Rnw:16788-16789
###################################################
anova(treesreduced.lm, treesfull.lm)


###################################################
### code chunk number 396: IPSUR.Rnw:16795-16798
###################################################
treesreduced2.lm <- lm(Volume ~ Girth + I(Girth^2) + Height,
                       data = trees)
anova(treesreduced2.lm, treesfull.lm)


###################################################
### code chunk number 397: IPSUR.Rnw:16901-16904
###################################################
treesNonlin.lm <- lm(log(Volume) ~ log(Girth) +
                       log(Height), data = trees)
summary(treesNonlin.lm)


###################################################
### code chunk number 398: IPSUR.Rnw:16911-16912
###################################################
exp(confint(treesNonlin.lm))


###################################################
### code chunk number 399: IPSUR.Rnw:16917-16921
###################################################
new <- data.frame(Girth = c(9.1, 11.6, 12.5),
                  Height = c(69, 74, 87))
exp(predict(treesNonlin.lm, newdata = new,
            interval = "confidence"))


###################################################
### code chunk number 400: IPSUR.Rnw:16939-16948
###################################################
# fake data
set.seed(1)
x <- seq(from = 0, to = 1000, length.out = 200)
y <- 1 + 2*(sin((2*pi*x/360) - 3))^2 + rnorm(200, sd = 2)
# plot(x, y)
acc.nls <- nls(y ~ a + b*(sin((2*pi*x/360) - c))^2,
               start = list(a = 0.9, b = 2.3, c = 2.9))
summary(acc.nls)
#plot(x, fitted(acc.nls))


###################################################
### code chunk number 401: IPSUR.Rnw:17021-17024
###################################################
# Preliminary code to load before start
# This chapter's package dependencies
library(mvtnorm)


###################################################
### code chunk number 402: IPSUR.Rnw:17031-17032
###################################################
set.seed(42)


###################################################
### code chunk number 403: IPSUR.Rnw:17123-17125
###################################################
z <- rexp(13)
z


###################################################
### code chunk number 404: IPSUR.Rnw:17130-17131
###################################################
sum(z > 1)


###################################################
### code chunk number 405: IPSUR.Rnw:17135-17136
###################################################
binom.test(x = 4, n = 13, p = 0.5)


###################################################
### code chunk number 406: IPSUR.Rnw:17139-17140
###################################################
TMP <- binom.test(x = 4, n = 13, p = 0.5)


###################################################
### code chunk number 407: IPSUR.Rnw:17144-17145
###################################################
median(z)


###################################################
### code chunk number 408: IPSUR.Rnw:17150-17153
###################################################
data.frame(lwr = sort(z)[1:5],
           upr = sort(z, decreasing=TRUE)[1:5],
           clevel = 1 - 2*pbinom(5 - 5:1, size = 13, prob = 0.5))


###################################################
### code chunk number 409: IPSUR.Rnw:17156-17160
###################################################
TMP <- data.frame(lwr = sort(z)[1:5],
           upr = sort(z, decreasing=TRUE)[1:5],
           clevel = 1 - 2*pbinom(5 - (5:1), size = 13, prob = 0.5))
TMP <- round(TMP,3)


###################################################
### code chunk number 410: IPSUR.Rnw:17167-17168
###################################################
set.seed(42)


###################################################
### code chunk number 411: IPSUR.Rnw:17286-17288
###################################################
z = rcauchy(15)
z


###################################################
### code chunk number 412: IPSUR.Rnw:17293-17294
###################################################
wilcox.test(z, mu = 4, conf.int = TRUE)


###################################################
### code chunk number 413: IPSUR.Rnw:17297-17298
###################################################
TMP <- wilcox.test(z, mu = 4, conf.int = TRUE)


###################################################
### code chunk number 414: IPSUR.Rnw:17305-17306
###################################################
wilcox.test(rcauchy(3), mu = 4, conf.int = TRUE)


###################################################
### code chunk number 415: IPSUR.Rnw:17416-17417
###################################################
set.seed(42)


###################################################
### code chunk number 416: IPSUR.Rnw:17425-17427
###################################################
x <- rexp(15) + 3
y <- rexp(9)


###################################################
### code chunk number 417: IPSUR.Rnw:17432-17433
###################################################
wilcox.test(x, y, mu = 2, conf.int = TRUE)


###################################################
### code chunk number 418: IPSUR.Rnw:17436-17437
###################################################
TMP <- wilcox.test(x, y, mu = 2, conf.int = TRUE)


###################################################
### code chunk number 419: IPSUR.Rnw:17472-17474
###################################################
wilcox.test(extra ~ group, data = sleep, paired = TRUE, 
            exact = FALSE, conf.int = TRUE)


###################################################
### code chunk number 420: IPSUR.Rnw:17477-17479
###################################################
TMP <- wilcox.test(extra ~ group, data = sleep, paired = TRUE, 
            exact = FALSE, conf.int = TRUE)


###################################################
### code chunk number 421: IPSUR.Rnw:17555-17556
###################################################
kruskal.test(count ~ spray, data = InsectSprays)


###################################################
### code chunk number 422: IPSUR.Rnw:17585-17588
###################################################
# This chapter's package dependencies
library(boot)
library(coin)


###################################################
### code chunk number 423: IPSUR.Rnw:17744-17748
###################################################
srs <- rnorm(25, mean = 3)
resamps <- replicate(1000, sample(srs, 25, TRUE),
                     simplify = FALSE)
xbarstar <- sapply(resamps, mean, simplify = TRUE)


###################################################
### code chunk number 424: bootstrap-se-mean
###################################################
hist(xbarstar, breaks = 40, prob = TRUE, xlim=c(2,3.6))
curve(dnorm(x, 3, 0.2), add = TRUE) # overlay true normal density


###################################################
### code chunk number 425: IPSUR.Rnw:17781-17784
###################################################
mean(xbarstar)
mean(srs)
mean(xbarstar) - mean(srs)


###################################################
### code chunk number 426: IPSUR.Rnw:17801-17802
###################################################
sd(xbarstar)


###################################################
### code chunk number 427: IPSUR.Rnw:17839-17843
###################################################
resamps <- replicate(1000, sample(rivers, 141, TRUE),
                     simplify = FALSE)
medstar <- sapply(resamps, median, simplify = TRUE)
sd(medstar)


###################################################
### code chunk number 428: bootstrapping-se-median
###################################################
hist(medstar, breaks = 40, prob = TRUE)


###################################################
### code chunk number 429: IPSUR.Rnw:17864-17865 (eval = FALSE)
###################################################
## hist(medstar, breaks = 40, prob = TRUE)


###################################################
### code chunk number 430: IPSUR.Rnw:17868-17871
###################################################
median(rivers)
mean(medstar)
mean(medstar) - median(rivers)


###################################################
### code chunk number 431: IPSUR.Rnw:17887-17890
###################################################
mean_fun <- function(x, indices) mean(x[indices])
library(boot)
boot(data = srs, statistic = mean_fun, R = 1000)


###################################################
### code chunk number 432: IPSUR.Rnw:17895-17897
###################################################
median_fun <- function(x, indices) median(x[indices])
boot(data = rivers, statistic = median_fun, R = 1000)


###################################################
### code chunk number 433: IPSUR.Rnw:17964-17970
###################################################
btsamps <- replicate(2000, sample(stack.loss, 21, TRUE),
                     simplify = FALSE)
thetast <- sapply(btsamps, median, simplify = TRUE)
mean(thetast)
median(stack.loss)
quantile(thetast, c(0.025, 0.975))


###################################################
### code chunk number 434: IPSUR.Rnw:17981-17984
###################################################
med_fun <- function(x, ind) median(x[ind])
med_boot <- boot(stack.loss, med_fun, R = 2000)
boot.ci(med_boot, type = c("perc", "norm", "bca"))


###################################################
### code chunk number 435: IPSUR.Rnw:18110-18112
###################################################
library(coin)
oneway_test(len ~ supp, data = ToothGrowth)


###################################################
### code chunk number 436: IPSUR.Rnw:18124-18126
###################################################
t.test(len ~ supp, data = ToothGrowth, alt = "greater",
       var.equal = TRUE)


###################################################
### code chunk number 437: IPSUR.Rnw:18130-18133
###################################################
A <- show(oneway_test(len ~ supp, data = ToothGrowth))
B <- t.test(len ~ supp, data = ToothGrowth, alt = "greater",
            var.equal = TRUE)


###################################################
### code chunk number 438: IPSUR.Rnw:18215-18220
###################################################
set.seed(42)
library(binom)
library(prob)
library(reshape)
library(vcd)


###################################################
### code chunk number 439: IPSUR.Rnw:18223-18247
###################################################
Dataset = structure(list(School = structure(c(3L, 2L, 1L, 4L, 3L, 2L, 1L,
4L, 3L, 2L, 1L, 4L), .Label = c("Adequate", "Good", "Most desirable",
"Undesirable"), class = "factor"), Rating = structure(c(2L, 2L,
2L, 2L, 1L, 1L, 1L, 1L, 3L, 3L, 3L, 3L), .Label = c("Average",
"Outstanding", "Poor"), class = "factor"), Frequency = c(21,
3, 14, 10, 20, 25, 8, 7, 4, 36, 2, 6)), row.names = c(NA, -12L
), .Names = c("School", "Rating", "Frequency"), class = "data.frame")

library(prob)
A = gen2wayTable(pmatrix = matrix(c(1,3,4,2), nrow = 2),
                 addmargins = FALSE,
                 as.df = TRUE,
                 dmnames = list(gender = c("female","male"),
                                politics = c("dem", "rep")))
B = gen2wayTable(pmatrix = matrix(c(1,3,6,2,4,5), nrow = 2),
                 addmargins = FALSE,
                 as.df = TRUE,
                 dmnames = list(gender = c("female","male"),
                                politics = c("dem", "ind", "rep")))
C = genIndepTable(prow = 1:2, pcol = 1:3,
                 addmargins = FALSE,
                 as.df = TRUE,
                 dmnames = list(gender = c("female","male"),
                                politics = c("dem", "ind", "rep")))


###################################################
### code chunk number 440: IPSUR.Rnw:18261-18263
###################################################
library(binom)
binom.confint(2, 10, methods = "asymptotic")


###################################################
### code chunk number 441: IPSUR.Rnw:18276-18277
###################################################
binom.confint(2, 10, methods = "wilson")


###################################################
### code chunk number 442: IPSUR.Rnw:18291-18292
###################################################
binom.confint(2, 10, methods = "ac")


###################################################
### code chunk number 443: IPSUR.Rnw:18308-18309
###################################################
binom.confint(2, 10, methods = "exact")


###################################################
### code chunk number 444: IPSUR.Rnw:18319-18320
###################################################
binom.confint(2, 10, methods = "all")


###################################################
### code chunk number 445: IPSUR.Rnw:18328-18329
###################################################
prop.test(x = 2, n = 10, p = 0.5, correct = FALSE)


###################################################
### code chunk number 446: IPSUR.Rnw:18340-18341
###################################################
xtabs(Frequency ~ School + Rating, data = Dataset)


###################################################
### code chunk number 447: IPSUR.Rnw:18351-18354
###################################################
matrix(c(1,2,3,4,5,6), nrow = 2,
           dimnames = list(gender = c("female","male"),
                           politics = c("dem","ind","rep")))


###################################################
### code chunk number 448: IPSUR.Rnw:18362-18363
###################################################
head(Dataset)


###################################################
### code chunk number 449: IPSUR.Rnw:18368-18369
###################################################
xtabs(Frequency ~ School + Rating, data = Dataset)


###################################################
### code chunk number 450: IPSUR.Rnw:18374-18375
###################################################
head(A)


###################################################
### code chunk number 451: IPSUR.Rnw:18380-18383
###################################################
xtabs(~ politics, data = A)
xtabs(~ gender, data = A)
xtabs(~ gender + politics, data = A)


###################################################
### code chunk number 452: IPSUR.Rnw:18390-18391
###################################################
HairEyeColor


###################################################
### code chunk number 453: IPSUR.Rnw:18396-18397
###################################################
xtabs(Freq ~ Hair + Eye, data = HairEyeColor)


###################################################
### code chunk number 454: IPSUR.Rnw:18402-18403
###################################################
xtabs(Freq ~ Hair + Eye, data = HairEyeColor)


###################################################
### code chunk number 455: stacked-bar-plot
###################################################
x = xtabs(Freq ~ Sex + Eye, data = HairEyeColor)
barplot(x, legend = TRUE)


###################################################
### code chunk number 456: sidebyside-bar-plot
###################################################
barplot(x, beside = TRUE, legend = TRUE)


###################################################
### code chunk number 457: transpose-bar-plot
###################################################
barplot(t(x), beside = TRUE, legend = TRUE)


###################################################
### code chunk number 458: IPSUR.Rnw:18455-18457
###################################################
library(vcd)
mosaic(x)


###################################################
### code chunk number 459: IPSUR.Rnw:18462-18463
###################################################
barplot(xtabs(Freq ~ Hair, data = HairEyeColor))


###################################################
### code chunk number 460: IPSUR.Rnw:18468-18469
###################################################
pie(xtabs(Freq ~ Hair, data = HairEyeColor))


###################################################
### code chunk number 461: IPSUR.Rnw:18477-18479
###################################################
x = xtabs(Freq ~ Eye, data = HairEyeColor)
addmargins(x)


###################################################
### code chunk number 462: IPSUR.Rnw:18484-18485
###################################################
prop.table(x)


###################################################
### code chunk number 463: IPSUR.Rnw:18489-18491
###################################################
y = xtabs(Freq ~ Hair + Eye, data = HairEyeColor)
y


###################################################
### code chunk number 464: IPSUR.Rnw:18496-18500
###################################################
rowSums(y)
colSums(y)
addmargins(y)
prop.table(y)


###################################################
### code chunk number 465: IPSUR.Rnw:18505-18507
###################################################
addmargins(y, margin = 2)
prop.table(y, margin = 1)


###################################################
### code chunk number 466: IPSUR.Rnw:18512-18514
###################################################
addmargins(y, margin = 1)
prop.table(y, margin = 2)


###################################################
### code chunk number 467: IPSUR.Rnw:18523-18525
###################################################
z = xtabs(Freq ~ Sex + Hair, data = HairEyeColor)
z


###################################################
### code chunk number 468: IPSUR.Rnw:18529-18530
###################################################
z[c(2,1), ]


###################################################
### code chunk number 469: IPSUR.Rnw:18534-18535
###################################################
z[ , c(3,1,4,2)]


###################################################
### code chunk number 470: IPSUR.Rnw:18540-18541
###################################################
z[c(2,1), c(3,1,4,2)]


###################################################
### code chunk number 471: IPSUR.Rnw:18546-18548
###################################################
z = xtabs(Freq ~ Hair, data = HairEyeColor)
z


###################################################
### code chunk number 472: imppiebar
###################################################
par(mfrow = c(2,1))
pie(z[c(2,4,1,3)])
barplot(z[c(2,4,1,3)])
par(mfrow = c(1,1))


###################################################
### code chunk number 473: IPSUR.Rnw:18574-18576
###################################################
Y = as.data.frame(y)
head(Y)


###################################################
### code chunk number 474: IPSUR.Rnw:18581-18585
###################################################
library(reshape)
Ydf = untable(Y, Y$Freq)[ , -3]
row.names(Ydf) <- NULL
head(Ydf)


###################################################
### code chunk number 475: IPSUR.Rnw:18621-18623
###################################################
y = xtabs(Freq ~ Sex + Survived, data = Titanic)
y


###################################################
### code chunk number 476: IPSUR.Rnw:18626-18627
###################################################
addmargins(y, margin = 2)


###################################################
### code chunk number 477: IPSUR.Rnw:18630-18631
###################################################
prop.table(y, margin = 1)


###################################################
### code chunk number 478: IPSUR.Rnw:18636-18637
###################################################
prop.test(y, correct = FALSE)


###################################################
### code chunk number 479: IPSUR.Rnw:18647-18651
###################################################
LadyTastingTea = matrix(c(4,0,0,4), nrow = 2,
                dimnames = list(pouredFirst = c("milk","tea"),
                guessedFirst = c("milk","tea")))
LadyTastingTea


###################################################
### code chunk number 480: IPSUR.Rnw:18654-18655
###################################################
fisher.test(LadyTastingTea, alternative = "greater")


###################################################
### code chunk number 481: IPSUR.Rnw:18683-18687
###################################################
Performance <- matrix(c(794, 86, 150, 570), nrow = 2,
  dimnames = list("1st Survey" = c("Approve", "Disapprove"),
                 "2nd Survey" = c("Approve", "Disapprove")))
Performance


###################################################
### code chunk number 482: IPSUR.Rnw:18691-18692
###################################################
mcnemar.test(Performance)


###################################################
### code chunk number 483: IPSUR.Rnw:18720-18722
###################################################
observed = c(160, 20, 10, 10)
probs = c(0.50, 0.25, 0.10, 0.15)


###################################################
### code chunk number 484: IPSUR.Rnw:18727-18728
###################################################
chisq.test(observed, p = probs)


###################################################
### code chunk number 485: IPSUR.Rnw:18808-18810
###################################################
x = xtabs(Freq ~ Sex + Eye, data = HairEyeColor)
x


###################################################
### code chunk number 486: IPSUR.Rnw:18815-18817
###################################################
addmargins(x, margin = 2)
prop.table(x, margin = 1)


###################################################
### code chunk number 487: IPSUR.Rnw:18823-18825
###################################################
addmargins(x, margin = 1)
prop.table(x, margin = 2)


###################################################
### code chunk number 488: IPSUR.Rnw:18830-18831
###################################################
chisq.test(x)


###################################################
### code chunk number 489: IPSUR.Rnw:18835-18836
###################################################
mosaic(x, shade = TRUE)


###################################################
### code chunk number 490: IPSUR.Rnw:18840-18841
###################################################
assoc(x, shade = TRUE)


###################################################
### code chunk number 491: IPSUR.Rnw:18847-18850
###################################################
y = xtabs(Freq ~ Hair + Eye, data = HairEyeColor)
addmargins(y, margin = 2)
prop.table(y, margin = 1)


###################################################
### code chunk number 492: IPSUR.Rnw:18856-18858
###################################################
addmargins(y, margin = 1)
prop.table(y, margin = 2)


###################################################
### code chunk number 493: IPSUR.Rnw:18864-18865
###################################################
chisq.test(y)


###################################################
### code chunk number 494: IPSUR.Rnw:18872-18873
###################################################
mosaic(y, shade = TRUE)


###################################################
### code chunk number 495: IPSUR.Rnw:18877-18878
###################################################
assoc(y, shade = TRUE)


###################################################
### code chunk number 496: IPSUR.Rnw:18928-18930
###################################################
x = xtabs(Freq ~ Sex + Survived, data = Titanic)
x


###################################################
### code chunk number 497: IPSUR.Rnw:18933-18935
###################################################
library(vcd)
oddsratio(x, log = FALSE)


###################################################
### code chunk number 498: fourfold-titanic
###################################################
fourfold(x)


###################################################
### code chunk number 499: IPSUR.Rnw:18966-18967
###################################################
confint(oddsratio(x, log = FALSE), level = 0.95)


###################################################
### code chunk number 500: IPSUR.Rnw:18993-18995
###################################################
x = xtabs(Freq ~ Sex + Age + Class, data = Titanic)
ftable(x)


###################################################
### code chunk number 501: IPSUR.Rnw:19002-19003
###################################################
oddsratio(x, log = FALSE)


###################################################
### code chunk number 502: IPSUR.Rnw:19009-19011
###################################################
library(vcd)
woolf_test(x)


###################################################
### code chunk number 503: fourfold-titanic-2
###################################################
fourfold(x)


###################################################
### code chunk number 504: IPSUR.Rnw:19031-19032
###################################################
mantelhaen.test(x)


###################################################
### code chunk number 505: IPSUR.Rnw:19050-19051
###################################################
sessionInfo()


###################################################
### code chunk number 506: IPSUR.Rnw:19549-19550
###################################################
x <- c(3, 5, 9)


###################################################
### code chunk number 507: IPSUR.Rnw:19557-19558
###################################################
y <- c(3, "5", TRUE)


###################################################
### code chunk number 508: IPSUR.Rnw:19576-19577
###################################################
matrix(letters[1:6], nrow = 2, ncol = 3)


###################################################
### code chunk number 509: IPSUR.Rnw:19583-19584
###################################################
matrix(letters[1:6], nrow = 2, ncol = 3, byrow = TRUE)


###################################################
### code chunk number 510: IPSUR.Rnw:19592-19593
###################################################
matrix(c(1,"2",NA, FALSE), nrow = 2, ncol = 3)


###################################################
### code chunk number 511: IPSUR.Rnw:19602-19606
###################################################
A <- matrix(1:6, 2, 3)
B <- matrix(2:7, 2, 3)
A + B
A # B


###################################################
### code chunk number 512: IPSUR.Rnw:19615-19617
###################################################
# try(A %*% B)     # gives an error
A %*% t(B)         # this is alright


###################################################
### code chunk number 513: IPSUR.Rnw:19622-19623
###################################################
solve(A %*% t(B))     # input matrix must be square


###################################################
### code chunk number 514: IPSUR.Rnw:19630-19631
###################################################
array(LETTERS[1:24], dim = c(3,4,2))


###################################################
### code chunk number 515: IPSUR.Rnw:19644-19649
###################################################
x <- c(1.3, 5.2, 6)
y <- letters[1:3]
z <- c(TRUE, FALSE, TRUE)
A <- data.frame(x, y, z)
A


###################################################
### code chunk number 516: IPSUR.Rnw:19655-19657
###################################################
names(A) <- c("Fred","Mary","Sue")
A


###################################################
### code chunk number 517: IPSUR.Rnw:19679-19681
###################################################
A <- as.data.frame(Titanic)
head(A)


###################################################
### code chunk number 518: IPSUR.Rnw:19696-19698
###################################################
B <- with(A, untable(A, Freq))
head(B)


###################################################
### code chunk number 519: IPSUR.Rnw:19705-19706 (eval = FALSE)
###################################################
## untable(TitanicDF, A$Freq)


###################################################
### code chunk number 520: IPSUR.Rnw:19715-19718
###################################################
C <- B[, -5]
rownames(C) <- 1:dim(C)[1]
head(C)


###################################################
### code chunk number 521: IPSUR.Rnw:19730-19734
###################################################
tab <- matrix(1:6, nrow = 2, ncol = 3)
rownames(tab) <- c('first', 'second')
colnames(tab) <- c('A', 'B', 'C')
  tab  # Counts


###################################################
### code chunk number 522: IPSUR.Rnw:19745-19751
###################################################
p <- c("milk","tea")
g <- c("milk","tea")
catgs <- expand.grid(poured = p, guessed = g)
cnts <- c(3, 1, 1, 3)
D <- cbind(catgs, count = cnts)
xtabs(count ~ poured + guessed, data = D)


###################################################
### code chunk number 523: IPSUR.Rnw:19790-19791 (eval = FALSE)
###################################################
## data(package = .packages(all.available = TRUE))


###################################################
### code chunk number 524: IPSUR.Rnw:19798-19799 (eval = FALSE)
###################################################
## data(foo, package = "bar")


###################################################
### code chunk number 525: IPSUR.Rnw:19825-19827 (eval = FALSE)
###################################################
## library("foreign")
## read.spss("foo.sav")


###################################################
### code chunk number 526: IPSUR.Rnw:19860-19862
###################################################
Tmp <- Puromycin[order(Puromycin$conc), ]
head(Tmp)


###################################################
### code chunk number 527: IPSUR.Rnw:19867-19868 (eval = FALSE)
###################################################
## with(Puromycin, Puromycin[order(conc), ])


###################################################
### code chunk number 528: IPSUR.Rnw:19874-19875 (eval = FALSE)
###################################################
## with(Puromycin, Puromycin[order(state, conc), ])


###################################################
### code chunk number 529: IPSUR.Rnw:19881-19883
###################################################
Tmp <- with(Puromycin, Puromycin[order(-conc), ])
head(Tmp)


###################################################
### code chunk number 530: IPSUR.Rnw:19890-19892
###################################################
Tmp <- with(Puromycin, Puromycin[order(-xtfrm(state)), ])
head(Tmp)


