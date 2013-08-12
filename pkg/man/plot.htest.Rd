\name{plot}
\alias{plot.htest}

\title{Plotting Hypothesis Tests}
\description{
  This function allows the user to plot a saved hypothesis test object, including normal curves, critical values, shading, and p-values.  It requires the HH package and the \code{normal.and.t.dist} function written by Dr. Richard Heiberger.  Please note that a much better version of this function is currently under development.
}

\usage{
\method{plot}{htest}(x, hypoth.or.conf = 'Hypoth', \ldots)
}

\arguments{
  \item{x}{an \code{htest} object that is the result of a hypothesis test.}
  \item{hypoth.or.conf}{a switch to choose between plots for hypothesis tests or confidence intervals}
  \item{\ldots}{further arguments to be passed to or from other methods.}
}

\details{
This is a plot method for hypothesis tests or confidence intervals which uses the \code{normal.and.t.dist} function in the \code{HH} package.
}

\value{
  A plot of the normal or Student's t distribution associated with the hypothesis test or confidence interval.  Critical values and p-values are displayed.
}

\author{G. Jay Kerns \email{gkerns@ysu.edu}}

\seealso{\code{\link[HH]{normal.and.t.dist}}}

\keyword{misc} 
