% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/setupCNVplot.R
\name{setupCNVplot}
\alias{setupCNVplot}
\title{setupCNVplot}
\usage{
setupCNVplot(MA, namedgranges, covprepped)
}
\arguments{
\item{MA}{MultiAssayExperiment object used to store all information.}

\item{namedgranges}{List of grange objects, one for each CNV. These objects should have exons and genes, and will be in metadata after being created by SARC::addExonsGenes.}

\item{covprepped}{List of dataframes, one for each CNV. This list should be in metadata after bring created by SARC::plotCovPrep.}
}
\value{
List of dataframes, each dataframe can be plotted using plotting functions from this package.
}
\description{
Sets up dataframes for plotting the CNVs. If there are grange objects with no genes/ exons, it may be the CNVs are too small. These CNVs should be removed to not lead to errors.
}
\examples{
data("test_bed")
data("test_cov")
test_bed <- test_bed[c(1),]
SARC <- regionSet(bed = test_bed, cov = test_cov)
SARC <- plotCovPrep(MA = SARC, bed = test_bed, cov = test_cov,
                   startlist = metadata(SARC)[[1]],
                   endlist = metadata(SARC)[[2]])
SARC <- regionGrangeMake(MA = SARC, covprepped = metadata(SARC)[[3]])

library(TxDb.Hsapiens.UCSC.hg38.knownGene)
library(Homo.sapiens)
TxDb(Homo.sapiens) <- TxDb.Hsapiens.UCSC.hg38.knownGene
txdb <- TxDb.Hsapiens.UCSC.hg38.knownGene
tx <- transcriptsBy(Homo.sapiens, columns = "SYMBOL")
txgene <- tx@unlistData

SARC <- addExonsGenes(MA = SARC, covgranges = metadata(SARC)[[4]],
                      txdb = txdb, txgene = txgene)

SARC <- setupCNVplot(MA = SARC, namedgranges =  metadata(SARC)[[5]],
                  covprepped = metadata(SARC)[[3]])
}
