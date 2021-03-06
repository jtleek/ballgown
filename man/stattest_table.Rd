\name{stattest_table}
\alias{stattest_table}
\title{statistical tests for differential expression, without a ballgown object}
\usage{
stattest_table(gowntable, pData, mod = NULL, mod0 = NULL,
  feature = c("gene", "exon", "intron", "transcript"), timecourse = FALSE,
  covariate = NULL, adjustvars = NULL, df = 4, getFC = FALSE,
  libadjust = TRUE, log = TRUE)
}
\arguments{
  \item{gowntable}{matrix or matrix-like object with
  \code{rownames} representing feature IDs and columns
  representing samples, with expression estimates in the
  cells. Provide the feature name with \code{feature}.}

  \item{pData}{data frame giving phenotype data for the
  samples in the columns of \code{gowntable}. (Rows of
  \code{pData} correspond to columns of \code{gowntable}).}

  \item{mod}{object of class \code{model.matrix}
  representing the design matrix for the linear regression
  model including covariates of interest}

  \item{mod0}{object of class \code{model.matrix}
  representing the design matrix for the linear regression
  model without the covariates of interest.}

  \item{feature}{the type of genomic feature to be tested
  for differential expression. Must be one of
  \code{"gene"}, \code{"transcript"}, \code{"exon"}, or
  \code{"intron"}.}

  \item{timecourse}{if \code{TRUE}, tests whether or not
  the expression profiles of genomic features vary over
  time in the study.  Default \code{FALSE}.}

  \item{covariate}{string representing the name of the
  covariate of interest for the differential expression
  tests.  Must correspond to the name of a column of
  \code{pData(gown)}. If \code{timecourse=TRUE}, this
  should be the study's time variable.}

  \item{adjustvars}{optional vector of strings representing
  the names of potential confounders.  Must correspond to
  names of columns of \code{pData(gown)}.}

  \item{df}{degrees of freedom used for modeling expression
  over time with natural cubic splines.  Default 4.  Only
  used if \code{timecourse=TRUE}.}

  \item{getFC}{if \code{TRUE}, also return estimated fold
  changes (adjusted for library size and confounders)
  between populations. Only available for 2-group
  comparisons at the moment. Default \code{FALSE}.}

  \item{libadjust}{if \code{TRUE} (default), include a
  library-size adjustment as a confounder in the fitted
  models. The adjustment is currently defined as the sum of
  the sample's counts below that sample's 75th percentile.}
}
\value{
data frame containing the columns \code{feature}, \code{id}
representing feature id, \code{pval} representing the
p-value for testing whether this feature was differentially
expressed according to \code{covariate}, and \code{qval},
the estimated false discovery rate using this feature's
signal strength as a significance cutoff. An additional
column, \code{fc}, is included if \code{getFC} is
\code{TRUE}.
}
\description{
statistical tests for differential expression, without a
ballgown object
}
\details{
\code{mod} and \code{mod0} are optional arguments.  If
\code{mod} is specified, you must also specify \code{mod0}.
If neither is specified, \code{mod0} defaults to the design
matrix for a model including only a library-size
adjustment, and \code{mod} defaults to the design matrix
for a model including a library-size adjustment and
\code{covariate}. Note that if you supply \code{mod} and
\code{mod0}, \code{covariate}, \code{timecourse},
\code{adjustvars}, and \code{df} are ignored, so make sure
your covariate of interest and all appropriate confounder
adjustments, including library size, are specified in
\code{mod} and \code{mod0}.
}
\author{
Jeff Leek, Alyssa Frazee
}

