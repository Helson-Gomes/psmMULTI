# psmMULTI
R package do compute Propensity Score Matching when the treatment is a multi-categorical variable

## get_treatment
The *get_treatment* function allows you to get the treated individuals and your controls according to k nearest neighbor method when treatment is a multi-categorical variable. The distance used to get the control group is based on the minimum distance between the propensity score of a specific treated individual and all untreated individuals.

The usage is get_treatment(data, k, group, formula, var_multi)

Where:
***data*** is the original data frame with the multi-categorical variable and independent variables.

***k*** is the number of nearest neighbors chosen by the user to calculate the distance between treated and untreated.

***group*** is One category of the multi-categorical variable. The parameter group needs to be a numeric value and the categorical variable needs to be in a numerical format.

***formula*** Is the formula of the multinomial logit model.

***var_multi*** Is the position number of the multi-categorical variable in the data frame.

Example:

\# In this example, x1 is the multi-categorical treatment variable.

\# x2 and x3 are variables that determines the treatment.

\# Note that x1 is the first column in the data frame, that is, var_multi = 1.

\# We are using two nearest neighbor, that is, k = 2.

\# We are interested in the group of treatment number one, that is, group=1

dt <- data.frame(x1 =rep(c(1,2,3), 4), x2 = rnorm(12, 0, .5), x3 = rnorm(12, 1, .5))

get_treatment(data = dt, k = 2, group = 1, formula = x1 ~ x2 + x3, var_multi = 1)

## psm_multi
A function to compute propensity score matching with multiple matches

The usage is psm_multi(data, k, group, formula, var_multi)

Where:

***data*** is the original data frame with the multi-categorical variable and independent variables.

***k*** is the number of nearest neighbors chosen by the user to calculate the distance between treated and untreated.

***group*** is One category of the multi-categorical variable. The parameter group needs to be a numeric value and the categorical variable needs to be in a numerical format.

***formula*** Is the formula of the multinomial logit model.

***var_multi*** Is the position number of the multi-categorical variable in the data frame.

Example:

\# In this example, x1 is the multi-categorical treatment variable.

\# x2 and x3 are variables that determines the treatment.

\# Note that x1 is the first column in the data frame, that is, var_multi = 1.

\# We are using two nearest neighbor, that is, k = 2.

\# We are interested in the group of treatment number one, that is, group=1

dt <- data.frame(x1 =rep(c(1,2,3), 4), x2 = rnorm(12, 0, .5), x3 = rnorm(12, 1, .5))

psm_multi(data = dt, k = 2, group = 1, formula = x1 ~ x2 + x3, var_multi = 1)

# att
R function to compute the Average Treatment Effect to a specific category after runing psm_multi comand.

After running psm_multi comand, use att function to compute the Average Treatment Effect to an specific group of treatment.

You just to consider the treatment variable with the first independent variable in the parameter formula. att will return other value otherwise.

You just use a data returned by the psm_multi function in datafrom_psm_multi parameter.
  
The usage is att(datafrom_psm_multi, formula, print_regression)

Where:

***datafrom_psm_multi*** Is a data returned by the psm_multi function in this parameter.

***formula*** Is the formula of the att model. It just contains the impact variable as the dependent variable and the treatment variable as first independent variable.

***print_regression*** is a parameter that if "TRUE", the function returns the summary of the ATT regression.

example:

\# In this example, x1 is the multi-categorical treatment variable.

\# x2 and x3 are variables that determines the treatment.

\# Note that x1 is the first column in the data frame, that is, var_multi = 1.

\# We are using two nearest neighbor, that is, k = 2.

\# We are interested in the group of treatment number one, that is, group=1.

dt <- data.frame(x1 =rep(c(1,2,3), 4), x2 = rnorm(12, 0, .5), x3 = rnorm(12, 1, .5))

dt1 <- psm_multi(data = dt, k = 2, group = 1, formula = x1 ~ x2 + x3, var_multi = 1)

att(datafrom_psm_multi = dt1, formula = x2 ~ treatment + x3, print_regression = F)
