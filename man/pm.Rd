% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pm.R
\name{pm}
\alias{pm}
\title{Product for Matrices with missing data (pm)}
\usage{
pm(M1, M2, na.rm = TRUE)
}
\arguments{
\item{M1}{A matrix with n1 lines and p columns}

\item{M2}{A matrix with p lines and n2 columns}

\item{na.rm}{if TRUE calculates the matricial product only on available data. Else returns NA.}
}
\value{
\item{X}{The resulting matrix with n1 lines and n2 columns}
}
\description{
Product for Matrix (pm) is a generalization of the matricial product %*% for matrices with missing data. Missing data are replaced by 0.
}
