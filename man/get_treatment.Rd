\name{get_treatment}
\alias{get_treatment}
\title{Main function to compute untreated group.}
\usage{
  get_treatment(data, k, group, formula, var_multi)
}
\description{
  The get_treatment function allows you to get the treated individuals and your controls according to k nearest neighbor method when treatment is a multi-categorical variable. The distance used to get the control group is based on the minimum distance between the propensity score of a specific treated individual and all untreated individuals.
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
}
\examples{
# In this example, x1 is the multi-categorical treatment variable
# x2 and x3 are variables that determines the treatment.
# Note that x1 is the first column in the data frame, that is, var_multi = 1.
# We are using two nearest neighbor, that is, k = 2.
# We are interested in the group of treatment number one, that is, group=1
#
# dt <- data.frame(x1 =rep(c(1,2,3), 4), x2 = rnorm(12, 0, .5), x3 = rnorm(12, 1, .5))
# get_treatment(data = dt, k = 2, group = 1, formula = x1 ~ x2 + x3, var_multi = 1)
}
