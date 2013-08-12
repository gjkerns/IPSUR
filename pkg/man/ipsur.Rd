\name{ipsur}
\alias{ipsur}
\title{Search IPSUR online}

\description{
This function allows a user to search the HTML version of IPSUR (online) with Google and report results in the default browser.
}

\usage{
ipsur(string, site = "ipsur.org")
}

\arguments{
  \item{string}{The search string desired.}
  \item{site}{Searches are restricted to this site.}
}

\author{
G. Jay Kerns, hacked from the original RSiteSearch function by the R-core team.
}

\note{
If you would like to search for an exact phrase, enclose with single quotes.
}

\examples{
 # NOT RUN - need Internet connection
 #    ipsur("bayes 'larry gets the axe' example") # matches exact phrase
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ misc }

