
# Chapter: Data Description
# All code released under GPL Version 3

str(precip)

precip[1:4]

str(rivers)

str(discoveries)

stripchart(precip, xlab="rainfall")
stripchart(rivers, method="jitter", xlab="length")
stripchart(discoveries, method="stack", xlab="number")

par(mfrow = c(3,1)) # 3 plots: 3 rows, 1 column
stripchart(precip, xlab="rainfall")
stripchart(rivers, method="jitter", xlab="length")
stripchart(discoveries, method="stack", xlab="number", ylim = c(0,3))
par(mfrow = c(1,1)) # back to normal

postscript(file="ps/datadesc/stripcharts.ps")
  
dev.off()

svg(file="svg/datadesc/stripcharts.svg")
  
dev.off()

hist(precip, main = "")
hist(precip, freq = FALSE, main = "")

m <- ggplot(as.data.frame(precip), aes(x = precip))
m + geom_histogram()
m + geom_histogram(aes(y = ..density..))

m <- ggplot(as.data.frame(precip), aes(x = precip))
a <- m + geom_histogram()
b <- m + geom_histogram(aes(y = ..density..))
grid.newpage()
pushViewport(viewport(layout = grid.layout(2, 1)))
vplayout <- function(x, y)
viewport(layout.pos.row = x, layout.pos.col = y)
print(a, vp = vplayout(1, 1))
print(b, vp = vplayout(2, 1))

postscript(file="ps/datadesc/histograms.ps")
  
dev.off()

svg(file="svg/datadesc/histograms.svg")
  
dev.off()

par(mfrow = c(1,2)) # 2 plots: 1 row, 2 columns
hist(precip, main = "")
hist(precip, freq = FALSE, main = "")
par(mfrow = c(1,1)) # back to normal

qplot(precip, geom = "histogram", binwidth = 1)
qplot(precip, geom = "histogram", binwidth = 5)
qplot(precip, geom = "histogram", binwidth = 20)
m <- ggplot(as.data.frame(precip), aes(x = precip))
m + geom_histogram(binwidth = 1)
m + geom_histogram(binwidth = 5)
m + geom_histogram(binwidth = 20)

m <- ggplot(as.data.frame(precip), aes(x = precip))
a1 <- m + geom_histogram(binwidth = 1)
a2 <- m + geom_histogram(binwidth = 5)
a3 <- m + geom_histogram(binwidth = 20)
grid.newpage()
pushViewport(viewport(layout = grid.layout(3, 1)))
vplayout <- function(x, y)
viewport(layout.pos.row = x, layout.pos.col = y)
print(a1, vp = vplayout(1, 1))
print(a2, vp = vplayout(2, 1))
print(a3, vp = vplayout(3, 1))

postscript(file="ps/datadesc/histograms-bins.ps")
  
dev.off()

svg(file="svg/datadesc/histograms-bins.svg")
  
dev.off()

stem.leaf(UKDriverDeaths, depth = FALSE)

plot(LakeHuron)
plot(LakeHuron, type = "p")
plot(LakeHuron, type = "h")

huron <- data.frame(year = time(LakeHuron), level = as.vector(LakeHuron))
h <- ggplot(huron, aes(x=year)) 
h + geom_path(aes(y = level))
h + geom_point(aes(y = level))
h + geom_ribbon(aes(ymin = 576, ymax = level))

library(lattice)
xyplot(level ~ year, data = huron, type = "l")
xyplot(level ~ year, data = huron, type = "p")

par(mfrow = c(3,1))
plot(LakeHuron)
plot(LakeHuron, type = "p")
plot(LakeHuron, type = "h")
par(mfrow = c(1,1))

postscript(file="ps/datadesc/indpl-lakehuron.ps")
  
dev.off()

svg(file="svg/datadesc/indpl-lakehuron.svg")
  
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

par(mfrow = c(1,2)) # 2 plots: 1 row, 2 columns
barplot(table(state.region), cex.names = 0.50)
barplot(prop.table(table(state.region)), cex.names = 0.50)
par(mfrow = c(1,1)) # back to normal

postscript(file="ps/datadesc/bar-gr-stateregion.ps")
  
dev.off()

svg(file="svg/datadesc/bar-gr-stateregion.svg")
  
dev.off()

pareto.chart(table(state.division), ylab="Frequency")

postscript(file="ps/datadesc/Pareto-chart.ps")
  
dev.off()

svg(file="svg/datadesc/Pareto-chart.svg")
  
dev.off()

x <- table(state.region)
dotchart(as.vector(x), labels = names(x))

postscript(file="ps/datadesc/dot-charts.ps")
  
dev.off()

svg(file="svg/datadesc/dot-charts.svg")
  
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
A[1, ]
A[ , 2]

names(A)
A$v1

xyplot(Petal.Width ~ Petal.Length, data = iris, group = Species)

print(xyplot(Petal.Width ~ Petal.Length, data = iris, group = Species))

postscript(file="ps/datadesc/xyplot-group.ps")
  
dev.off()

svg(file="svg/datadesc/xyplot-group.svg")
  
dev.off()

bwplot(~weight | feed, data = chickwts)

print(bwplot(~weight | feed, data = chickwts))

postscript(file="ps/datadesc/bwplot.ps")
  
dev.off()

svg(file="svg/datadesc/bwplot.svg")
  
dev.off()

histogram(~age | education, data = infert)

print(histogram(~age | education, data = infert))

postscript(file="ps/datadesc/histograms-lattice.ps")
  
dev.off()

svg(file="svg/datadesc/histograms-lattice.svg")
  
dev.off()

xyplot(Petal.Length ~ Petal.Width | Species, data = iris)

print(xyplot(Petal.Length ~ Petal.Width | Species, data = iris))

postscript(file="ps/datadesc/xyplot.ps")
  
dev.off()

svg(file="svg/datadesc/xyplot.svg")
  
dev.off()

coplot(conc ~ uptake | Type * Treatment, data = CO2)

print(coplot(conc ~ uptake | Type * Treatment, data = CO2))

postscript(file="ps/datadesc/coplot.ps")
  
dev.off()

svg(file="svg/datadesc/coplot.svg")
  
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
