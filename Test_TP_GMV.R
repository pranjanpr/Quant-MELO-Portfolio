#Portfolio Return
#For 2 weeks after the end date
#end_date <- "2012-04-01"

library(quantmod)

test_start_date <- "2019-04-15"
test_start_date2 <- "2019-04-22"
test_end_date <- "2020-01-15"
test_end_date2 <- "2020-01-22"
#We are testing it for 40 weeks

ret_data <- numeric(length = 10);



#CAGR <- Compound annual growth rate
#Cagr <- (FinalPrice/InitialPrice)^(1/Number of years) - 1

#For our study we remain invested for 13 weeks
#Hence Number of years = 40/52

pr = 40/52
 

Close_prices_end = numeric(length = 10)
Close_prices_start = numeric(length = 10)

test_database <- data.frame(c(1:40))

ind = 1;
for(stock in company_df$stocks){
  test_stock_data_st <- getSymbols(stock, from = test_start_date, to = test_start_date2, auto.assign = F, src = "yahoo")
  
  test_stock_data_end <- getSymbols(stock, from = test_end_date, to = test_end_date2, auto.assign = F, src = "yahoo")
  
  test_stock_data <- getSymbols(stock, from = test_start_date, to = test_end_date, auto.assign = F, src = "yahoo")
  test_stock_ret <- periodReturn(test_stock_data, period = "weekly", type = "log")
  #print(stock_ret)
  
  Close_prices_start[ind] =  mean(test_stock_data_st[,4])
  Close_prices_end[ind] =  mean(test_stock_data_end[,4])
  
  test_database <- cbind(test_database, col = data.frame(test_stock_ret$weekly.returns))
  
  print(stock)
  ind = ind+1;
}

  Test_Ret = data.matrix(test_database)
  Test_Ret<-Test_Ret[, -1]
  
  Annualised_sd_gmv_I = sqrt(t(Result_melo_mv) %*% cov(Test_Ret) %*% Result_melo_mv)*sqrt(252)
  Annualised_sd_gmv_NI = sqrt(t(Result_melo_mv_NI) %*% cov(Test_Ret) %*% Result_melo_mv_NI)*sqrt(252)
  Annualised_sd_tp_I = sqrt(t(Result_melo_tp) %*% cov(Test_Ret) %*% Result_melo_tp)*sqrt(252)
  Annualised_sd_tp_NI = sqrt(t(Result_melo_tp_NI) %*% cov(Test_Ret) %*% Result_melo_tp_NI)*sqrt(252)
  
  Final_portfolio_Price_gmv_I = sum(Close_prices_end * Result_melo_mv);
  Final_portfolio_Price_gmv_NI = sum(Close_prices_end * Result_melo_mv_NI);
  Final_portfolio_Price_TP_I = sum(Close_prices_end * Result_melo_tp);
  Final_portfolio_Price_TP_NI = sum(Close_prices_end * Result_melo_tp_NI);
  
  Initial_portfolio_Price_gmv_I = sum(Close_prices_start * Result_melo_mv);
  Initial_portfolio_Price_gmv_NI = sum(Close_prices_start * Result_melo_mv_NI);
  Initial_portfolio_Price_TP_I = sum(Close_prices_start * Result_melo_tp);
  Initial_portfolio_Price_TP_NI = sum(Close_prices_start * Result_melo_tp_NI);
  
  CAGR_gmv_I = (Final_portfolio_Price_gmv_I/Initial_portfolio_Price_gmv_I)^pr - 1;
  CAGR_gmv_NI = (Final_portfolio_Price_gmv_NI/Initial_portfolio_Price_gmv_NI)^pr - 1;
  CAGR_tp_I = (Final_portfolio_Price_TP_I/Initial_portfolio_Price_TP_I)^pr - 1;
  CAGR_tp_NI = (Final_portfolio_Price_TP_NI/Initial_portfolio_Price_TP_NI)^pr - 1;
  
  SR_gmv_I = (CAGR_gmv_I - 0.02)/Annualised_sd_gmv_I
  SR_gmv_NI = (CAGR_gmv_NI - 0.02)/Annualised_sd_gmv_NI
  SR_tp_I = (CAGR_tp_I - 0.02)/Annualised_sd_tp_I
  SR_tp_NI = (CAGR_tp_NI - 0.02)/Annualised_sd_tp_NI

  