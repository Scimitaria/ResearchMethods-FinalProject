options(repos = "https://cran.rstudio.com")

anes <- read.csv('./anes2024.csv')

harrisTherm <- ifelse(anes$V241156<0 | anes$V241156>100,NA,anes$V241156)
trumpTherm <- ifelse(anes$V241157<0 | anes$V241157>100,NA,anes$V241157)
voted <- ifelse(anes$V242067<0,NA,anes$V242067)

#1 if they prefer Harris to Trump else 0
anes$pref <- ifelse(anes$V241156>anes$V241157,1,0)
