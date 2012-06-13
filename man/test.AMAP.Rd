\name{test.AMAP}
\alias{test.AMAP}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
 Calculate the test statistics of the AMAP tests 
}
\description{
Calculate the test statistics of the AMAP tests 
}
\usage{
test.AMAP(data, MGN, del.lim = NULL, FC = NULL, print.steps = FALSE, Integration = "MC",nMC=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
RNA-seq data standardized by function RNASeq.Data() 
}
  \item{MGN}{
The joint distribution, pi(lambda,delta), in form of Mixture Gamam-Normal
}
  \item{del.lim}{
An interval, for example del.lim=c(-1,1), that is the null space for delta 
}
  \item{FC}{
A number >=1 so that the test detects genes with fold-changes greater than FC. If to detect DE genes, FC=1.
}
  \item{print.steps}{
Print the process when calculating the test statistics 
}
  \item{Integration}{
Value can be "grid" or "MC". If Integration="grid", then the integration is done by dividing the 2-D space into grids. If Integration="MC", then the integration is done by Monte Carlo sampling. 
}
  \item{nMC}{number of data points randomly  drawn from MGN distribution by Monte Carlo simulation,the default is 50000}
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
  \item{stat}{test statistics of the AMAP tests, in logarithm scale}
  \item{prob}{posterior probability of the null hypothesis, equal to exp(stat)}
  \item{fdr}{estiamted FDR level if the cut-off is chosen at the gene}
}

%% ~Make other sections like Warning with \section{Warning }{....} ~
\examples{

######## Please read the help instribution above and the manuscript to 
######## CHOOSE PROPER PARAMETERS LIKE nK, iter.max, nK0, FC and nMC for best use of the function 
set.seed(100)
data("SimuHapMap")  # a matrix 'counts' storing simulated data with 10000 genes, two treatments, of which each has 5 replicates
head(cbind(counts,del.true))
counts=counts[1:200,] ### use data for only 200 genes to save time for testing example
                      ### the computation usually requires tens of minutes for 10000 genes
group=rep(1:2,each=5)

### standardize the RNA-seq data

size=Norm.GMedian(counts)   ## normalizing factor using Geometric Median
mydata=RNASeq.Data(counts=counts,size=size,group=group,model="nbinom")

### test DE genes

decom.est=MGN.EM(mydata,nK=3,iter.max=3,nK0=3,nMC=100)
s1=test.AMAP(mydata,MGN=decom.est$MGN,FC=1.0,nMC=100)
head(s1)

### test for FC>1.1

decom.est=MGN.EM(mydata,nK=3,iter.max=3,nK0=0,nMC=100)
s2=test.AMAP(mydata,MGN=decom.est$MGN,FC=1.1,nMC=100)
head(s2)

}

\references{
Yaqing Si and Peng Liu (2012), An Optimal Test with Maximum Average Power While Controlling FDR with Application to RNA-seq Data}
% Add one or more standard keywords, see file 'KEYWORDS' in the
