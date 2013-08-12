# Written by G. Jay Kerns, 9/11/2009
# Another, much better version currently in development


###################################################
plot.htest <- function (x, hypoth.or.conf = 'Hypoth',...) { 
require("HH")
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

return( normal.and.t.dist(mu.H0 = mu, obs.mean = obs.mean,
                          std.dev = std.dev, n = n,
                          deg.freedom = deg.freedom,
                          alpha.right = alpha.right,
                          Use.obs.mean = TRUE,
                          Use.alpha.left = Use.alpha.left,
                          Use.alpha.right = Use.alpha.right,
                          hypoth.or.conf = hypoth.or.conf))
}



