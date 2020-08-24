\name{att}
\alias{att}
\title{R function to compute the Average Treatment Effect to a specific category after runing psm_multi comand}
\usage{
  att(datafrom_psm_multi, formula, print_regression)
}
\description{
  After running psm_multi comand, use att function to compute the Average Treatment Effect to an specific group of treatment.
  You just to consider the treatment variable with the first independent variable in the parameter formula. att will return other value otherwise.
  You just use a data returned by the psm_multi function in datafrom_psm_multi parameter.
}
\arguments{
  \item{datafrom_psm_multi}{Consider a data returned by the psm_multi function in this parameter}
  \item{formula}{It just contains the impact variable as the dependent variable and the treatment variable as first independent variable.}
  \item{print_regression}{If "TRUE", the function returns the summary of the ATT regression.}
}
\examples{
  # In this example, x1 is the multi-categorical treatment variable
  # x2 and x3 are variables that determines the treatment.
  # Note that x1 is the first column in the data frame, that is, var_multi = 1
  # We are using two nearest neighbor, that is, k = 2.
  # We are interested in the group of treatment number one, that is, group=1.
  #
  # dt <- data.frame(x1 =rep(c(1,2,3), 4), x2 = rnorm(12, 0, .5), x3 = rnorm(12, 1, .5))
  # dt1 <- psm_multi(data = dt, k = 2, group = 1, formula = x1 ~ x2 + x3, var_multi = 1)
  # att(datafrom_psm_multi = dt1, formula = x2 ~ treatment + x3, print_regression = F)
}
