#This file generates the weights according to the tangency portfolio

Sigmainv.array1 <- rWishart(1e4, df = neu_p, Sigma = omega_p)

library(MASS)

mu_p = (T/(T+tau))*prior_mean  + (tau/(T + tau))*(sample_mean);

Final_num = matrix(nrow = 10, ncol = 1e4)
Deno = numeric(length = 1e4)


for(iteration in 1:1e4){
  mu.array <- mvrnorm(n = 1, mu = mu_p, Sigma = (1/(T+tau))*solve(Sigmainv.array1[,,iteration]));
  Expect <- (Sigmainv.array1[,,iteration] %*% mu.array) * sum(Sigmainv.array1[,,iteration] %*% mu.array);
  #Now we have a mu.array and a Sigma.Array
  Final_num[, iteration] = Expect;
  Deno[iteration] = sum(Sigmainv.array1[,,iteration] %*% mu.array)^2;
}

#mu.array <- mvrnorm(n = 1e4, mu = mu_p, Sigma = inv());
Num = rowMeans(Final_num)
Den = mean(Deno)

Result_melo_tp = Num/Den
print(Result_melo_tp)

sum(Result_melo_tp)

