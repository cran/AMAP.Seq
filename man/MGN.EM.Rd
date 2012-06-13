\name{MGN.EM}
\alias{MGN.EM}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimate the mixture gamma-normal (MGN) distribution using expectation-maximization (EM) algorithm
}
\description{
the MGN distribution model the joint distribution, pi(lambda,delta), by a K-component MGN distribution, and allows degenerate normal for delta when the null hypothesis is simple.
}
\usage{
MGN.EM(data, nK, p0 = NULL, d0 = 0, nK0 = 0, iter.max = 10, print.steps = FALSE, MGN0 = NULL, model = NULL, nMC = 10000)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
 the RNA-seq data, should be the output from RNASeq.Data
}
  \item{nK}{
   the number of components in MGN. When testing for fold-changes (FC), nK includes all components, when testing for differential expression (DE), nK only includes the components that are NOT degenerated. 
}
  \item{p0}{
   the proportion of null genes when testing for DE genes. 
}
  \item{d0}{
   the point where 'delta' is degerated, default is 0 when testing for DE genes.
}
  \item{nK0}{
  the number of components that are degenerated when testing for DE genes.
}
  \item{iter.max}{
  maximium number of interations in the EM algorithm
}
  \item{print.steps}{
  print the esimates of MGN in each iteration step, if TRUE. Default is FALSE
}

  \item{MGN0}{
  The initialization of the MGN.
  It should be a data.frame with 5 columns: pr, alpha, beta, mu, sigma.
  The methods of moment estimation will be used if not provided. 
}
  \item{model}{
  data model, can be 'nbinom' or 'poisson'. the default will be the same as in 'data' 
}
  \item{nMC}{
  the number of random samples from Gamma and Normal distrubitons in the Monte-Carlo simulation.
}
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
 \item{MGN}{The estimated MGN distribution, as a data.frame with 5 columns: pr, alpha,beta,mu,sigma. 
    pr: the proportion (weight) of each component \\
    alpha: alpha in the Gamma distribution \\
    beta: beta in the Gamma distribution \\
    mu: mu (mean) of the Normal distribution\\
    sigma: sigma (standard deviation) of the Normal distribution. sigma=0 is allowed for degenerated Normal  }
   \item{lam}{the shrinked estimation of lambda (mean expression for each gene)}
   \item{del}{the shrinked estimation of delta (log-fold change) for each gene}
%% ...
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
#### see examples by typing 'help(test.AMAP)'
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.

