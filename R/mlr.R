
head(trees)

library(lattice)
splom(trees)

postscript(file="ps/splom-trees.ps")
  library(lattice)
  splom(trees)
dev.off()

svg(file="svg/splom-trees.svg")
  library(lattice)
  splom(trees)
dev.off()

library(scatterplot3d)
s3d <- with(trees, scatterplot3d(Girth, Height, Volume, 
                                 pch = 16, highlight.3d = TRUE, 
                                 angle = 60))
fit <- lm(Volume ~ Girth + Height, data = trees)

postscript(file="ps/3D-scatterplot-trees.ps")
  library(scatterplot3d)
  s3d <- with(trees, scatterplot3d(Girth, Height, Volume, 
                                   pch = 16, highlight.3d = TRUE, 
                                   angle = 60))
  fit <- lm(Volume ~ Girth + Height, data = trees)
dev.off()

svg(file="svg/3D-scatterplot-trees.svg")
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

qplot(Girth, Volume, data = trees)

postscript(file="ps/Scatterplot-Volume-Girth-trees.ps")
  qplot(Girth, Volume, data = trees)
dev.off()

svg(file="svg/Scatterplot-Volume-Girth-trees.svg")
  qplot(Girth, Volume, data = trees)
dev.off()

treesquad.lm <- lm(Volume ~ scale(Girth) + I(scale(Girth)^2),                    data = trees)
summary(treesquad.lm)

a <- ggplot(trees, aes(scale(Girth), Volume))
a + stat_smooth(method = lm, formula = y ~ poly(x, 2)) + geom_point()

postscript(file="ps/Fitting-the-Quadratic.ps")
  a <- ggplot(trees, aes(scale(Girth), Volume))
  a + stat_smooth(method = lm, formula = y ~ poly(x, 2)) + geom_point()
dev.off()

svg(file="svg/Fitting-the-Quadratic.svg")
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

treesTall <- split(trees, trees$Tall)
treesTall[["yes"]]$Fit <- predict(treesdummy.lm, treesTall[["yes"]])
treesTall[["no"]]$Fit <- predict(treesdummy.lm, treesTall[["no"]])
plot(Volume ~ Girth, data = trees, type = "n")
points(Volume ~ Girth, data = treesTall[["yes"]], pch = 1)
points(Volume ~ Girth, data = treesTall[["no"]], pch = 2)
lines(Fit ~ Girth, data = treesTall[["yes"]])
lines(Fit ~ Girth, data = treesTall[["no"]])

postscript(file="ps/dummy-variable-trees.ps")
  treesTall <- split(trees, trees$Tall)
  treesTall[["yes"]]$Fit <- predict(treesdummy.lm, treesTall[["yes"]])
  treesTall[["no"]]$Fit <- predict(treesdummy.lm, treesTall[["no"]])
  plot(Volume ~ Girth, data = trees, type = "n")
  points(Volume ~ Girth, data = treesTall[["yes"]], pch = 1)
  points(Volume ~ Girth, data = treesTall[["no"]], pch = 2)
  lines(Fit ~ Girth, data = treesTall[["yes"]])
  lines(Fit ~ Girth, data = treesTall[["no"]])
dev.off()

svg(file="svg/dummy-variable-trees.svg")
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
