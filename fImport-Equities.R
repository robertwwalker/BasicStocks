pkgTest <- function(x)
  {
    if (!require(x,character.only = TRUE))
    {
      install.packages(x,dep=TRUE, repos="http://cran.wustl.edu/")
        if(!require(x,character.only = TRUE)) stop("Package not found")
    }
  }
pkgTest("fImport")
pkgTest("RcmdrPlugin.HH")
DL.Cleaner <- function(ticker) {
  Eq.Data <- yahooSeries(ticker, from="2016-07-01", to="2016-10-31", frequency="daily")
  Eq.Data.S <- Eq.Data[,6]
  Equities.Data.1 <- (Eq.Data.S-lag(Eq.Data.S,1))/lag(Eq.Data.S,1)
  Daily.Ret.Adj.Close <- na.omit(as.data.frame(Equities.Data.1))
  names(Daily.Ret.Adj.Close) <- ticker
  Daily.Ret.Adj.Close
}
GSPC <- data.frame(DL.Cleaner("^GSPC"))
WF <- data.frame(DL.Cleaner("WF"))
YHOO <- data.frame(DL.Cleaner("YHOO"))
Stocks <- data.frame(GSPC,WF,YHOO)
# To add a new one, give it an object name and a ticker, let's try Amazon
AMZN <- data.frame(DL.Cleaner("AMZN"))
Stocks <- data.frame(AMZN,GSPC,WF,YHOO)
