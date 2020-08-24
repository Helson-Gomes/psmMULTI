

get_treatment <- function(data, k, group, formula, var_multi = NULL){
  IDENT <- NULL
  multinom <- "%>%" <- left_join <- mutate <- show <- ggplot <- aes <- geom_density <- labs <- theme <- element_text <- theme_classic <- element_blank <- NULL
  invisible(lapply(list("dplyr", "tidyr", "nnet", "ggplot2"), require, character.only = T))
  print("Note: If your data set is too big, get_treatment function possibly will take a long time to run!")
  if(is.data.frame(data) == F){
    stop("Please, use a data.frame format to your data!")
  }
  if(is.numeric(k) == F){
    stop("Please, type a numeric value to k!")
  }
  if(is.numeric(var_multi) == F){
    stop("Please, type a numeric value to var_multi!")
  }
  controls <- data.frame()
  # codigo de identificação
  data$IDENT <- 1:length(data[,1])
  scores <- data.frame(multinom(formula, data = data)$fitted.values)[,group +1]
  scores<-data.frame(scores)
  data <- cbind(data, scores)
  treated <- subset(data, data[,var_multi] == group)
  untreated <- subset(data, data[,var_multi] != group)
  distance <- c()
  for(i in 1:length(treated[,1])) {
    for(j in 1:length(untreated[,1])){
      distance[j] <- abs(treated[,length(treated[1,])][i] - untreated[,length(untreated[1,])][j])
    }
    ranking <- c(rank(distance))
    dt <- data.frame(distance, ranking, untreated$IDENT)
    dt <- subset(dt, ranking <= k)
    controls <- rbind(controls, dt)
  }
  controls <- subset(controls, select = c(1,3))
  names(controls) <- c("distance", "IDENT")
  trt <- subset(treated, select = c(IDENT))
  trt$distance <- 0
  trt$treatment <- 1
  controls$treatment <- 0
  selecteds <- rbind(trt, controls)
  return(selecteds)
}




