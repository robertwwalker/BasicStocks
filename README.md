# BasicStocks

This is a basic R script to check for the presence of fImport and install it if it is not there.  
The original code started for a lab in GSM 5103: Lab 8 in the Fall of 2016.  

+ fImport-Equities.R is an R script that checks for fImport and installs it if missing.  It then invokes yahooSeries from fImport to download the tickers within the given date range (from) (to).  The frequency can be changed also.  For more information, ?fImport.  The code downloads the data given the ticker, calculates the returns (percent changes are (today - yesterday)/yesterday.), and then returns a single vector of changes [note the first day of changes are missing because there is no yesterday measured.  The code is implemented by calling the function DL.Cleaner("ticker").  I embed each call in a data.frame and name the data frames.  Then, in the last line, I combine the data.frame's together into one.
