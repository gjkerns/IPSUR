#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2013 G. Jay Kerns
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

library("foreign")
read.spss("foo.sav")

Tmp <- Puromycin[order(Puromycin$conc), ]
head(Tmp)

with(Puromycin, Puromycin[order(conc), ])

with(Puromycin, Puromycin[order(state, conc), ])

Tmp <- with(Puromycin, Puromycin[order(-conc), ])
head(Tmp)

Tmp <- with(Puromycin, Puromycin[order(-xtfrm(state)), ])
head(Tmp)

   library("odfWeave")
   odfWeave(file = "infile.odt", dest = "outfile.odt")

summary(cbind(Sepal.Length, Sepal.Width) ~ Species, data = iris)

set.seed(095259)

options(digits = 16)
runif(1)

rm(.Random.seed)
try(dir.create("../../data"), silent = TRUE)
save.image(file = "../../data/IPSUR.RData")
tools::resaveRdaFiles('../../data', compress = 'xz')
Stangle(file="IPSUR.Rnw", output="../IPSUR.R", annotate=TRUE)
