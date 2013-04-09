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


# Preliminary code to load before start

# clear everything to start
rm(list = ls())

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
options(useFancyQuotes = FALSE)

# load packages needed by the book
library("actuar")
library("aplpack")
library("boot")    # already recommended package
library("coin")
library("combinat")
library("diagram")
library("distrEx")
library("e1071")
library("ggplot2")
library("HH")
library("Hmisc")
library("lattice") # already recommended package
library("lmtest")
library("mvtnorm") # dependency of coin
library("prob")
library("qcc")
library("RcmdrPlugin.IPSUR")
library("reshape")  # dependency of ggplot2
library("scatterplot3d")
library("stats4")
library("TeachingDemos")

