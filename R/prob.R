
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2013  G. Jay Kerns
#
#    Chapter: Probability
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

postscript(file="ps/prob-diagram.ps")
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
