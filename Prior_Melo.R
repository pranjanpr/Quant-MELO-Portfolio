#prior calculations
# we assume that the prior mean would be equal to rf
T = nweeks #52
tau = 1.5*T
N = 10
neu = N + 40
neu_p = neu + T

sample_mean = apply(Return_data, 2, function(x){mean(x)});

library(MASS)
prior_mean = colMeans(mvrnorm(n = 1e4, mu = sample_mean, Sigma = (1/tau)*(cov(Return_data))))

mean_val = (prior_mean - t(t(sample_mean)));

omega_p = (T-1)*(cov(Return_data)) + (T*tau/(T + tau))* (mean_val) %*% t(mean_val)
#prior_mean = mvrnorm(n = 1e4, mu = sample_mean, Sigma = (1/tau)*(cov(Ret)))