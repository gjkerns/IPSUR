
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2013  G. Jay Kerns
#
#    Chapter: Data Description
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

str(precip)

precip[1:4]

str(rivers)

str(discoveries)

stripchart(precip, xlab="rainfall")
stripchart(rivers, method="jitter", xlab="length")
stripchart(discoveries, method="stack", xlab="number")

postscript(file="ps/datadesc-stripcharts.ps")
par(mfrow = c(3,1)) # 3 plots: 3 rows, 1 column
stripchart(precip, xlab="rainfall", cex.lab = cexlab)
stripchart(rivers, method="jitter", xlab="length", cex.lab = cexlab)
stripchart(discoveries, method="stack", xlab="number", ylim = c(0,3), cex.lab = cexlab)
par(mfrow = c(1,1)) # back to normal
dev.off()

hist(precip, main = "")
hist(precip, freq = FALSE, main = "")

postscript(file="ps/datadesc-histograms.ps")
par(mfrow = c(1,2))
hist(precip, main = "", cex.lab = cexlab)
hist(precip, freq = FALSE, main = "", cex.lab = cexlab)
par(mfrow = c(1,1))
dev.off()

postscript(file="ps/datadesc-histograms-bins.ps")
par(mfrow = c(1,3))
hist(precip, breaks = 10, main = "", cex.lab = cexlab)
hist(precip, breaks = 25, main = "", cex.lab = cexlab)
hist(precip, breaks = 50, main = "", cex.lab = cexlab)
par(mfrow = c(1,1))
dev.off()

stem.leaf(UKDriverDeaths, depth = FALSE)

plot(LakeHuron)
plot(LakeHuron, type = "p")
plot(LakeHuron, type = "h")

postscript(file="ps/datadesc-indpl-lakehuron.ps")
par(mfrow = c(3,1))
plot(LakeHuron, cex.lab = cexlab)
plot(LakeHuron, type = "p", cex.lab = cexlab)
plot(LakeHuron, type = "h", cex.lab = cexlab)
par(mfrow = c(1,1))
dev.off()

# The Old Faithful geyser data
d <- density(faithful$eruptions, bw = "sj")
d
plot(d)
hist(precip, freq = FALSE)
lines(density(precip))

str(state.abb)

str(state.region)
state.region[1:5]

Tbl <- table(state.division)

Tbl

Tbl/sum(Tbl)      # relative frequencies

prop.table(Tbl)   # same thing

barplot(table(state.region), cex.names = 0.50)
barplot(prop.table(table(state.region)), cex.names = 0.50)

postscript(file="ps/datadesc-bar-gr-stateregion.ps")
par(mfrow = c(1,2)) # 2 plots: 1 row, 2 columns
barplot(table(state.region), cex.names = 0.50)
barplot(prop.table(table(state.region)), cex.names = 0.50)
par(mfrow = c(1,1)) # back to normal
dev.off()

postscript(file="ps/datadesc-Pareto-chart.ps")
pareto.chart(table(state.division), ylab="Frequency", cex.lab = cexlab)
dev.off()

postscript(file="ps/datadesc-dot-charts.ps")
x <- table(state.region)
dotchart(as.vector(x), labels = names(x), cex.lab = cexlab)
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

with(faithful, stem.leaf(eruptions))

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
A[ , 1]
A[ , 2]

names(A)
A['v1']

require(graphics)
mosaicplot(HairEyeColor)
x <- apply(HairEyeColor, c(1, 2), sum)
x
mosaicplot(x, main = "Relation between hair and eye color")
y <- apply(HairEyeColor, c(1, 3), sum)
y
mosaicplot(y, main = "Relation between hair color and sex")
z <- apply(HairEyeColor, c(2, 3), sum)
z
mosaicplot(z, main = "Relation between eye color and sex")

xyplot(Petal.Width ~ Petal.Length, data = iris, group = Species)

postscript(file="ps/datadesc-xyplot-group.ps")
print(xyplot(Petal.Width ~ Petal.Length, data = iris, group = Species))
dev.off()

bwplot(~weight | feed, data = chickwts)

postscript(file="ps/datadesc-bwplot.ps")
print(bwplot(~weight | feed, data = chickwts))
dev.off()

histogram(~age | education, data = infert)

postscript(file="ps/datadesc-histograms-lattice.ps")
print(histogram(~age | education, data = infert))
dev.off()

xyplot(Petal.Length ~ Petal.Width | Species, data = iris)

postscript(file="ps/datadesc-xyplot.ps")
print(xyplot(Petal.Length ~ Petal.Width | Species, data = iris))
dev.off()

coplot(conc ~ uptake | Type * Treatment, data = CO2)

postscript(file="ps/datadesc-coplot.ps")
print(coplot(conc ~ uptake | Type * Treatment, data = CO2))
dev.off()

library(ggplot2)
a <- qplot(state.division, geom = "bar")
a + opts(axis.text.x = theme_text(angle = -90, hjust = 0))

hist(precip, freq = FALSE)
lines(density(precip))
qplot(precip, geom = "density")
m <- ggplot(as.data.frame(precip), aes(x = precip))
m + geom_histogram()
m + geom_histogram(aes(y = ..density..)) + geom_density()

library("RcmdrPlugin.IPSUR")
data(RcmdrTestDrive)
attach(RcmdrTestDrive)
names(RcmdrTestDrive)
