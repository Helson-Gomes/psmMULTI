att <- function(datafrom_psm_multi, formula, print_regression = FALSE){
  lm <- psm <- vcov <- weight <- coefficients <- psm <- NULL
  model <- lm(data = datafrom_psm_multi, formula = formula, weights = weight)
  if(abs(coefficients(model)[2]/sqrt(diag(vcov(model))[2]))>1.96){
    print("-----------------------------------------------------------")
    print("Propensity Score Matching with Multiple treatment levels")
    print("-----------------------------------------------------------")
    print(sprintf("Number of treated = %i", length(which(psm$treatment==1))))
    print(sprintf("Number of untreated = %i", length(which(psm$treatment==0))))
    print(sprintf("Average Treatmet Effect = %f", coefficients(model)[2]))
    print(sprintf("ATT Standard Error = %f", sqrt(diag(vcov(model)))[2]))
    print("ATT is calculated considering 5% significance")
    print("-----------------------------------------------------------")
  }else{
    print("-----------------------------------------------------------")
    print("Propensity Score Matching with Multiple treatment levels")
    print("-----------------------------------------------------------")
    print(sprintf("Number of treated = %i", length(which(psm$treatment==1))))
    print(sprintf("Number of untreated = %i", length(which(psm$treatment==0))))
    print(sprintf("ATT coefficient not significant for this group"))
    print(sprintf("Average Treatmet Effect = %f", 0.0000))
    print(sprintf("ATT Standard Error = %f", sqrt(diag(vcov(model)))[2]))
    print("ATT is calculated considering 5% significance")
    print("-----------------------------------------------------------")
  }
  if(print_regression == TRUE){
    return(summary(model))
  }
}

