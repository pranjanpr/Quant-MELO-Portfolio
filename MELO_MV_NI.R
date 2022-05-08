#rm(list = ls())
#This file contains code for non informative distribution for GMV

Final_num = matrix(nrow = 10, ncol = 1e4);
Deno <- numeric(length = 1e4)

nstocks = 10;
for(iteration in 1:1e4){
  
  Sigmainv.array <- rWishart(1, df = nweeks-2, Sigma = cov(Return_data))
  
  Ones = matrix(1, nrow = nstocks, ncol = 1);
  Num_val <- (Sigmainv.array[,,1] %*% Ones) * (sum(rowSums(Sigmainv.array[,,1])));
  Den_val <- ((sum(rowSums(Sigmainv.array[,,1])))^2);
  
  Final_num[, iteration] = Num_val;
  Deno[iteration] = Den_val;
}
Num <- rowMeans(Final_num);
Den <- mean(Deno)

Result_melo_mv_NI <- Num/Den

scale_result <- function(x){
  x/sum(x);
}

#y <- c(46.377226, 24.014517,  3.948867, 21.092082, 34.583492, 21.664190, 26.220039, 10.383541, 5.496263, 17.427975)