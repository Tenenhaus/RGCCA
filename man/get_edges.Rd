% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_edges.R
\name{get_edges}
\alias{get_edges}
\title{Creates the edges for a design matrix}
\usage{
get_edges(rgcca_res)
}
\arguments{
\item{rgcca_res}{A list giving the results of a R/SGCCA}
}
\value{
A dataframe with tuples of connected rgcca_res$call$blocks
}
\description{
Creates the edges for a design matrix
}
