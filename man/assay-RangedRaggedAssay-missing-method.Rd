% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assay-methods.R
\docType{methods}
\name{assay,RangedRaggedAssay,missing-method}
\alias{assay,RangedRaggedAssay,missing-method}
\title{Create a Matrix of score values using a GRanges or own ranges}
\usage{
\S4method{assay}{RangedRaggedAssay,missing}(x, i, mcolname = "score",
  background = NA, make.names = FALSE, ranges = NULL, type = "any")
}
\arguments{
\item{x}{A \linkS4class{RangedRaggedAssay} or \link{GRangesList} class}

\item{i}{Argument from generic (default 1L)}

\item{mcolname}{A single string indicating the metadata column to use for
the assay conversion}

\item{background}{A default background value for the resulting assay matrix
(default NA). This works for non-matching sample and range pairs in the data
and will be imputed in the matrix (e.g., 2 for diploid genomes)}

\item{make.names}{logical (default FALSE) whether to create character format
ranges for the rows of the matrix (either from the \code{ranges} argument
or from the \code{RangedRaggedAssay} itself). Example character format:
"chr1:2-3:+"}

\item{ranges}{An optional \link{GRanges} object for comparing accross all
sample ranges and for superseding the rows for the resulting matrix
(default NULL)}

\item{type}{The type argument from \link{overlapsAny}}
}
\value{
A \code{matrix} of values from the score column of the metadata.
}
\description{
This function can take a GRanges argument and use each range to check for
overlaps with any of the current ranges in the first argument and return a
score value from the corresponding metadata. This function will only operate
on fully disjoint ranges (see \code{isDisjoint} for details). It can only
work if metadata is present and there is a "score" column in the metadata.
Please see example on how to add metadata to a
\linkS4class{RangedRaggedAssay} or \link{GRangesList} class. This function
uses the \link{overlapsAny} function from the \code{GenomicRanges} package.
}
\examples{
example("RangedRaggedAssay")

## Add some phony metadata to the RangedRaggedAssay
metadata(myRRA) <- list(snparrray1 = DataFrame(score = 1),
snparray2 = DataFrame(score = 1),
snparray3 = DataFrame(score = 3))

assay(myRRA, background = 2)

}
\seealso{
\link{overlapsAny}
}

