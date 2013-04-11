
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
#

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
