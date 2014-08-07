\name{EDvisits}
\alias{EDvisits}
\docType{data}
\title{Hospital Emergency Department Visits and Readmission Rates}
\description{

}

\usage{data(EDvisits)}
\format{
  A data frame with 164 observations of 8 variables.
  \describe{
    \item{\code{model}}{Model of care (A, B, or C (usual care)}
    \item{\code{los}}{Length of stay in days}
    \item{\code{age}}{Age of patient in years}
    \item{\code{gender}}{Male or female}
    \item{\code{cci}}{Charelson Comorbidity Index}
    \item{\code{LACE}}{LACE index: predicts likelihood of readmission or death}
    \item{\code{readmit}}{Factor indicating whether patient was readmitted within 30 days post-discharge}
    \item{\code{visit}}{Factor indicating whether patient visited the Emergency Department within 30 days post-discharge}
  }
}

\source{
Mitchell, RD, Longstreth KL, Graham J, Kerns GJ. Comparison of two pharmacist-delivered transitions of care models for patients discharged home from a community teaching hospital. Used with permission.
}

\keyword{datasets}
