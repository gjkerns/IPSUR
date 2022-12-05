# source: http://www.aul.org/2015/06/aul-releases-the-new-leviathan-the-mega-centers-report-how-planned-parenthood-has-become-abortion-inc/
plot(x = c(74, 74, 774, 774),
     y = c(-541, -213, -305, -572),
     main = "PLANNED PARENTHOOD FEDERATION OF AMERICA:",
     xlab = "", ylab = "", asp = 1, axes = FALSE,
     xlim = c(74, 774), ylim = c(-679, -150),
     type = "n")
mtext("ABORTIONS UP - LIFE SAVING PROCEDURES DOWN", side = 3)
arrows(x0 = 74, y0 = -541, x1 = 774, y1 = -305, 
       lwd = 3, col = "red")
arrows(x0 = 74, y0 = -213, x1 = 774, y1 = -572, 
       lwd = 3, col = "purple")
text(x = 176, y = -480, labels = "ABORTIONS", pos = 4, srt = 18, col = "red")
text(x = 283, y = -259, col = "purple",
     labels = "CANCER SCREENING &\nPREVENTION SERVICES", pos = 1, srt = -27)
axis(side = 1, 
     at = 100*(0:7) + 74,
     labels = 2006:2013)
segments(x0=74, y0=-150, x1=774, y1=-150)

text(90, -250, labels = "2,007,371\nIN 2006", pos = 1, cex = 0.75)
text(94, -557, labels = "289,750\nIN 2006", pos = 1, cex = 0.75)
text(734, -292, labels = "327,653\nIN 2013", pos = 3, cex = 0.75)
text(748, -594, labels = "935,573\nIN 2013", pos = 1, cex = 0.75)
mtext("SOURCE: AMERICANS UNITED FOR LIFE", side = 1, line = 3, cex = 0.75, adj = 1)
