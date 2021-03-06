% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_bootstrap.R
\name{get_bootstrap}
\alias{get_bootstrap}
\title{Extract a bootstrap}
\usage{
get_bootstrap(b, comp = 1, i_block = length(b$bootstrap[[1]]),
  bars = "sd", collapse = FALSE, n_cores = parallel::detectCores() -
  1)
}
\arguments{
\item{b}{A list of list weights (one per bootstrap per blocks)}

\item{comp}{An integer giving the index of the analysis components}

\item{i_block}{An integer giving the index of a list of blocks}

\item{bars}{A character among "sd" for standard deviations, "stderr" for the standard error, "ci" for confidence interval of scores and "cim" for the confidence intervall of the mean.}

\item{collapse}{A boolean to combine the variables of each block as result}

\item{n_cores}{An integer for the number of cores used in parallelization}
}
\value{
A matrix containing the means, 95% intervals, bootstrap ratio and p-values
}
\description{
Extract statistical information from a bootstrap
}
\examples{
library(RGCCA)
data("Russett")
blocks = list(agriculture = Russett[, seq(3)], industry = Russett[, 4:5],
    politic = Russett[, 6:11] )
rgcca_out = rgcca(blocks)
boot = bootstrap(rgcca_out, 2, superblock = FALSE, n_cores = 1)
get_bootstrap(boot, n_cores = 1)
}
