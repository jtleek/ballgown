\name{annotate_assembly}
\alias{annotate_assembly}
\title{match assembled transcripts to annotated transcripts}
\usage{
annotate_assembly(assembled, annotated)
}
\arguments{
  \item{assembled}{\code{GRangesList} object representing
  assembled transcripts}

  \item{annotated}{\code{GRangesList} object representing
  annotated transcripts}
}
\value{
data frame, where each row contains \code{assembledInd} and
\code{annotatedInd} (indexes of overlapping transcripts in
\code{assembled} and \code{annotated}), and the percent
overlap between the two transcripts.
}
\description{
match assembled transcripts to annotated transcripts
}
\details{
If \code{gown} is a \code{ballgown} object,
\code{assembled} can be \code{structure(gown)$trans} (or
any subset). You can generate a \code{GRangesList} object
containing annotated transcripts from a gtf file using the
\link{\code{gffReadGR}} function and setting
\code{splitByTranscripts=TRUE}.
}
\author{
Alyssa Frazee
}

