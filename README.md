
# SARC

## Statistical Analysis on Regions with CNVs

SARC applies several statistical tests of CNVs detected from WES (whole exome sequencing)/ WGS (whole genome sequencing) tools or pipelines. 

Most CNV detection strategies will lead to false positives, and SARC aims to 1) reduce the number of false positives by applying simple statisical tests on regions where a CNV was detected, and 2) provide a quicker and automated alternative to viewing CNVs in the Interactive Genome Browser (IGV). 

## Input data

SARC needs two file types:

1. BED FILE - list of all CNVs detected from pipeline. Should contain columns which are named: CHROM, START, END, VALUE. BED files are the most common form of output from CNV detection tools/ annotation tools.
https://en.wikipedia.org/wiki/BED_(file_format)

2. COV FILE - matrix of genomic regions and reads per sample. This can be created from bedtools Multicov or samtools coverage.
https://bedtools.readthedocs.io/en/latest/content/tools/multicov.html \n
http://www.htslib.org/doc/samtools-coverage.html \n

## Install package

```
library(devtools)
install_github("Krutik6/SARC")
```

Package has been submitted to bioconductor, until this is resolved, the tool is available from github. 

### Usage

Please read the vignette locted in the *vignettes* folder for explanations of the functions.

### Citation

The tool will be used in several WES cohorts and citations will be upcoming.

### Liscence

GPL-3.
