#rf is the risk free rate for 3 month treasury bill
#Date = 2012-01
rm(list = ls())
rf = 2.0e-2 #Determined by online resources
#Usually taken as 2, may fluctuate little bit based on situations

library(quantmod)

#The stocks are :- 

#mastercard, aapl, pfizer, symentac, ebay, blackrock, cognizant, microsoft, intel, google

stocks <- c("MA", "AAPL", "PFE", "NLOK", "EBAY", "BLK", "CTSH", "MSFT", "INTC", "GOOGL")

company_df <- data.frame(stocks)

#get weekly return of these stocks and save them as return array

start_date <- "2018-04-01"
end_date <- "2019-04-01"
nweeks = 52

database <- data.frame(c(1:nweeks))

#for(stock in company_df$stocks){
#  stock_data <- getSymbols(stock, from = start_date, to = end_date, auto.assign = F, src = "yahoo")
#  stock_ret <- periodReturn(stock_data, period = "weekly", type = "log")
#  #print(stock_ret)
#  database <- cbind(database, col = data.frame(stock_ret$weekly.returns))
#  print(stock)
#}

#database

#Ret = data.matrix(database)
#Ret<-Ret[, -1]
#Ret <- Ret - rf
#print(Ret)
#Now drop the first column of the dataframe

#Returns a matrix of dimensions week * size data for excess returns of stocks passed

getData = function(stocks, start_date, end_date, rf, database){
  library(quantmod)
  for(stock in company_df$stocks){
    stock_data <- getSymbols(stock, from = start_date, to = end_date, auto.assign = F, src = "yahoo")
    stock_ret <- periodReturn(stock_data, period = "weekly", type = "log")
    #print(stock_ret)
    database <- cbind(database, col = data.frame(stock_ret$weekly.returns))
    print(stock)
  }
  #database
  
  #Put the return data in the form of the matrix
  Ret = data.matrix(database)
  Ret<-Ret[, -1]
  Ret <- Ret - rf
  #print(Ret)
  return(Ret)
}

Return_data <- getData(stocks, start_date = start_date, end_date = end_date, rf, database = database)

#write.csv(database,"ret_data.csv", row.names = FALSE)
