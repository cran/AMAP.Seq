\name{RNASeq.Data}
\alias{RNASeq.Data}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Standardize the data from RNA-seq experiment
}
\description{
Collect all necessary input data and standardize them for follow-up analysis %%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
RNASeq.Data(counts, size = NULL, group, model = "nbinom", dispersion = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{counts}{
   the counts of reads mapped to the gene. input as a G X S matrix, where G is the number of genes, and S is the number of samples
}
  \item{size}{
the normalization factors for the counts. 
It should be a vector with length S, for example, the total number of reads for each column. 
The default is Geometric Median of the counts in each column. 
Users can also input the 'size' as a G X S  matrix, so that each cell of the 'counts' matrix has one normalization factor.    
}
  \item{group}{
  a vector indicating the design of a 2-treatment assignment, for example group=c(1,1,2,2). 
}
  \item{model}{
  specify the discrete probability that model the counts.
  We allow 'nbinom' and 'poisson' in our test, where 'nbinom' is the default choice that use negative-binomal model.
}
  \item{dispersion}{
 the dispersion parameter for each gene (each row of the counts).
 users can specify the estimates by their own method, 
or by default, we will use quasi-likelihood method to estimate a dispersion for each gene
}
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
  \item{counts }{counts of reads}
  \item{size }{Normalization factor of each count}
  \item{group}{treatment group}
  \item{model}{distribution}
  \item{dispersion}{estimated dispersion parameter in the NB model. If model="poisson", dispersion=1e-4 for all genes}
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
### see examples by typing 'help(test.AMAP)'
}

