
psm_multi <- function(data, k, group, formula, var_multi){
  left_join <- "%>%" <- mutate <- multinom <- show <- ggplot <- aes <- geom_density <- labs <- theme <- element_text <- theme_classic <- element_blank <- NULL
  CD_GEOCMU <-  fit <- IDENT <- Treatment <- treatment <- NULL
  invisible(lapply(list("dplyr", "tidyr", "nnet", "ggplot2"), require, character.only = T))
  print("Note: If your data set is too big, psm_multi function possibly will take a long time to run!")
  if(is.data.frame(data) == F){
    stop("Please, use a data.frame format to your data!")
  }
  if(is.numeric(k) == F){
    stop("Please, type a numeric value to k!")
  }
  if(is.numeric(var_multi) == F){
    stop("Please, type a numeric value to var_multi!")
  }
  data$fit <- multinom(formula = formula, data = data)$fitted.values[,1]
  data$IDENT <- 1:length(data[,1])
  dt0 <- get_treatment(data = data, k = k, group = group, formula = formula, var_multi = var_multi) %>%
    left_join(data, by = "IDENT") %>% mutate(Treatment = ifelse(treatment == 1, "Treated", "Untreated"),
                                             weight = 1/(1-fit))
  show(ggplot(dt0, aes(x=fit)) +
         geom_density(aes(group=Treatment, colour=Treatment, fill=Treatment),alpha=0.6)+
         labs(x=sprintf("Propensity score (k = %s)", k), y="Density")+
         theme(legend.position="bottom")+
         theme(legend.title = element_text(colour="blue", size=12,face="bold"))+
         theme_classic(base_size = 15, base_line_size = .2, base_rect_size=1,
                       base_family = 'Times') +
         theme(legend.title=element_blank())+
         theme(legend.position="bottom"))
return(dt0)
}
