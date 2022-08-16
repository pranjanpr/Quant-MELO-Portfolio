# Quant-MELO-Portfolio
A Bayesian based architecture to evaluate the optimal weights of different stocks in a portfolio according to Global Minimum Variance and Tangency optimization problem.

This repository contains the comprehensive study of the paper Optimal portfolio choice: a Minimum Expected Loss Approach by Andrés Ramírez-Hassan and Rosember Guerra-Urzola as a part of the MTH535A (An Introduction to Bayesian Analysis) Course Project. The approach discussed by writers aims to minimize the systematic risks of a portfolio and generate profits at par with any other competing alternatives. Here we provide the complete simulation effort.

For detailed analysis, please find our project report [here](https://drive.google.com/file/d/1LX5zkZrb9TialKpXWFFYWJny2QcFDFTu/view?usp=sharing).
Checkout INSTALL.txt on directions on how to run the code.

We have currently chosen 10 stocks for the study however with small tweak it can be scaled to 50 stocks.

We collected the close prices and weekly return data for these stocks from starting time of "2018-04-01" and the ending time of "2019-04-01" (T = 53 weeks).
We tested our weights with the historical returns from the start time "2019-04-15" and the end time of "2020-01-15" (40 weeks).

The tickers used for study are:

* Mastercard
* Apple
* Pfizer
* Symantec
* eBay
* BlackRock
* Cognizant
* Microsoft
* Intel
* Google

Also find the original paper [here](https://doi.org/10.1007/s11579-019-00246-w).

# Update:
Changing the duration of training time improves the test sharpe ratio a lot (even above the S&P500).

Training Duration:

`start_date <- "2019-04-01"`

`end_date <- "2020-04-01"`

`nweeks <- "53"`

Testing Duration:

`test_start_date <- "2020-04-15"`

`test_end_date <- "2021-01-15"`

Results: Sharpe Ratio of MELO Portfolio: 0.71

Sharpe Ratio of S&P500: 0.03 - 0.52

Final Portfolio Price: 202.22
Initial Portfolio Price: 139.5
Return = 62%
