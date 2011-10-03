
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
  par(mfrow = c(3,1)) # 3 plots: 3 rows, 1 column
  stripchart(precip, xlab="rainfall")
  stripchart(rivers, method="jitter", xlab="length")
  stripchart(discoveries, method="stack", xlab="number", ylim = c(0,3))
  par(mfrow = c(1,1)) # back to normal
dev.off()

svg(file="svg/datadesc/stripcharts.svg")
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

postscript(file="ps/datadesc/histograms.ps")
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

svg(file="svg/datadesc/histograms.svg")
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

par(mfrow = c(1,2)) # 2 plots: 1 row, 2 columns
hist(precip, breaks = 10, main = "")
hist(precip, breaks = 200, main = "")
par(mfrow = c(1,1)) # back to normal

postscript(file="ps/datadesc/histograms-bins.ps")
  par(mfrow = c(1,2)) # 2 plots: 1 row, 2 columns
  hist(precip, breaks = 10, main = "")
  hist(precip, breaks = 200, main = "")
  par(mfrow = c(1,1)) # back to normal
dev.off()

svg(file="svg/datadesc/histograms-bins.svg")
  par(mfrow = c(1,2)) # 2 plots: 1 row, 2 columns
  hist(precip, breaks = 10, main = "")
  hist(precip, breaks = 200, main = "")
  par(mfrow = c(1,1)) # back to normal
dev.off()

library(aplpack)
stem.leaf(UKDriverDeaths, depth = FALSE)

plot(LakeHuron, type = "h")
plot(LakeHuron, type = "p")

par(mfrow = c(2,1)) # 2 plots: 2 rows, 1 column
plot(LakeHuron, type = "h")
plot(LakeHuron, type = "p")
par(mfrow = c(1,1)) # back to normal

postscript(file="ps/datadesc/indpl-lakehuron.ps")
  par(mfrow = c(2,1)) # 2 plots: 2 rows, 1 column
  plot(LakeHuron, type = "h")
  plot(LakeHuron, type = "p")
  par(mfrow = c(1,1)) # back to normal
dev.off()

svg(file="svg/datadesc/indpl-lakehuron.svg")
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

par(mfrow = c(1,2)) # 2 plots: 1 row, 2 columns
barplot(table(state.region), cex.names = 0.50)
barplot(prop.table(table(state.region)), cex.names = 0.50)
par(mfrow = c(1,1)) # back to normal

postscript(file="ps/datadesc/bar-gr-stateregion.ps")
  par(mfrow = c(1,2)) # 2 plots: 1 row, 2 columns
  barplot(table(state.region), cex.names = 0.50)
  barplot(prop.table(table(state.region)), cex.names = 0.50)
  par(mfrow = c(1,1)) # back to normal
dev.off()

svg(file="svg/datadesc/bar-gr-stateregion.svg")
  par(mfrow = c(1,2)) # 2 plots: 1 row, 2 columns
  barplot(table(state.region), cex.names = 0.50)
  barplot(prop.table(table(state.region)), cex.names = 0.50)
  par(mfrow = c(1,1)) # back to normal
dev.off()

library(qcc)
pareto.chart(table(state.division), ylab="Frequency")

postscript(file="ps/datadesc/Pareto-chart.ps")
  library(qcc)
  pareto.chart(table(state.division), ylab="Frequency")
dev.off()

svg(file="svg/datadesc/Pareto-chart.svg")
  library(qcc)
  pareto.chart(table(state.division), ylab="Frequency")
dev.off()

x <- table(state.region)
dotchart(as.vector(x), labels = names(x))

postscript(file="ps/datadesc/dot-charts.ps")
  x <- table(state.region)
  dotchart(as.vector(x), labels = names(x))
dev.off()

svg(file="svg/datadesc/dot-charts.svg")
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

library(lattice)
print(xyplot(Petal.Width ~ Petal.Length, data = iris, group = Species))

postscript(file="ps/datadesc/xyplot-group.ps")
  library(lattice)
  print(xyplot(Petal.Width ~ Petal.Length, data = iris, group = Species))
dev.off()

svg(file="svg/datadesc/xyplot-group.svg")
  library(lattice)
  print(xyplot(Petal.Width ~ Petal.Length, data = iris, group = Species))
dev.off()

library(lattice)
bwplot(~weight | feed, data = chickwts)

library(lattice)
print(bwplot(~weight | feed, data = chickwts))

postscript(file="ps/datadesc/bwplot.ps")
  library(lattice)
  print(bwplot(~weight | feed, data = chickwts))
dev.off()

svg(file="svg/datadesc/bwplot.svg")
  library(lattice)
  print(bwplot(~weight | feed, data = chickwts))
dev.off()

histogram(~age | education, data = infert)

library(lattice)
print(histogram(~age | education, data = infert))

postscript(file="ps/datadesc/histograms-lattice.ps")
  library(lattice)
  print(histogram(~age | education, data = infert))
dev.off()

svg(file="svg/datadesc/histograms-lattice.svg")
  library(lattice)
  print(histogram(~age | education, data = infert))
dev.off()

xyplot(Petal.Length ~ Petal.Width | Species, data = iris)

print(xyplot(Petal.Length ~ Petal.Width | Species, data = iris))

postscript(file="ps/datadesc/xyplot.ps")
  print(xyplot(Petal.Length ~ Petal.Width | Species, data = iris))
dev.off()

svg(file="svg/datadesc/xyplot.svg")
  print(xyplot(Petal.Length ~ Petal.Width | Species, data = iris))
dev.off()

coplot(conc ~ uptake | Type * Treatment, data = CO2)

print(coplot(conc ~ uptake | Type * Treatment, data = CO2))

postscript(file="ps/datadesc/coplot.ps")
  print(coplot(conc ~ uptake | Type * Treatment, data = CO2))
dev.off()

svg(file="svg/datadesc/coplot.svg")
  print(coplot(conc ~ uptake | Type * Treatment, data = CO2))
dev.off()

library(RcmdrPlugin.IPSUR)
data(RcmdrTestDrive)
attach(RcmdrTestDrive)
names(RcmdrTestDrive)
