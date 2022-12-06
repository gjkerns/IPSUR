\name{birthday.ipsur}
\alias{qbirthday.ipsur}
\alias{pbirthday.ipsur}
\title{Probability of coincidences for the IPSUR package}
\description{
  This is a modified version of the \code{pbirthday} and \code{qbirthday} functions in the \code{stats} package.
  Computes approximate answers to a generalised \dQuote{birthday paradox}
  problem. \code{pbirthday.ipsur} computes the probability of a coincidence
  and \code{qbirthday.ipsur} computes the number of observations needed to
  have a specified probability of coincidence. 
  The change is that precise answers are given (instead of asymptotics) 
  in the case of exactly two coincidences.
}
\usage{
qbirthday.ipsur(prob = 0.5, classes = 365, coincident = 2)
pbirthday.ipsur(n, classes = 365, coincident = 2)
}
\arguments{
  \item{classes}{How many distinct categories the people could fall into}
  \item{prob}{The desired probability of coincidence}
  \item{n}{The number of people}
  \item{coincident}{The number of people to fall in the same category}
}
\value{
  \item{qbirthday.ipsur}{
    Number of people needed for a probability \code{prob} that \code{k} of
    them have the same one out of \code{classes} equiprobable labels.
  }

  \item{pbirthday.ipsur}{Probability of the specified coincidence.}
}
\details{
 The birthday paradox is that a very small number of people, 23,
 suffices to have  a 50-50 chance that two of them have the same
 birthday.  This function generalises the calculation to probabilities
 other than 0.5, numbers of coincident events other than 2, and numbers
 of classes other than 365.

 The formula is approximate, except in the case \code{coincident=2}.
}
\references{
  Diaconis P, Mosteller F., \dQuote{Methods for studying coincidences}.
  JASA 84:853-861}
\examples{
 ## the standard version
qbirthday.ipsur()
 ## same 4-digit PIN number
qbirthday.ipsur(classes=10^4)
 ## 0.9 probability of three coincident birthdays
qbirthday.ipsur(coincident=3, prob=0.9)
## Chance of 4 coincident birthdays in 150 people
pbirthday.ipsur(150,coincident=4)
## 100 coincident birthdays in 1000 people: *very* rare:
pbirthday.ipsur(1000, coincident=100)

}
\keyword{distribution}
