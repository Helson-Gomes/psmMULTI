\name{psm_multi}
\alias{psm_multi}
\title{A function to compute propensity score matching with multiple matches}
\usage{
  psm_multi(data, k, group, formula, var_multi)
}
\description{
  With the psm_multi function you can calculate propensity score matching with multiple matches, returning a data frame with weights based in the inverse distance of a multinomial logit model.
}
\arguments{
  \item{data}{The original data frame with the multi-categorical variable and independent variables.}
  \item{k}{The number of nearest neighbors chosen by the user to calculate the distance between treated and untreated.}
  \item{group}{One category of the multi-categorical variable. The parameter group needs to be a numeric value and the categorical variable needs to be in a numerical format.}
  \item{formula}{Formula of the multinomial logit model.}
  \item{var_multi}{The position number of the multi-categorical variable in the data frame.}
}
\value{
\item{IDENT}{An identification code created to each observation.}
\item{distance}{The distance between the propensity score of a treated observation and your control observation.}
\item{treatment}{1 if the observation is treated in the group and 0 otherwise.}
\item{Treatment}{"Treated" if the observation is treated in the group and "Untreated" otherwise.}
}
\examples{
# In this example, x1 is the multi-categorical treatment variable
# x2 and x3 are variables that determines the treatment.
# Note that x1 is the first column in the data frame, that is, var_multi = 1
# We are using two nearest neighbor, that is, k = 2.
# We are interested in the group of treatment number one, that is, group=1.
#
# dt <- data.frame(x1 =rep(c(1,2,3), 4), x2 = rnorm(12, 0, .5), x3 = rnorm(12, 1, .5))
# psm_multi(data = dt, k = 2, group = 1, formula = x1 ~ x2 + x3, var_multi = 1)
}
