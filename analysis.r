options(repos = "https://cran.rstudio.com")
source("data.r")

printf <- function(desc,dat){
    print(noquote(paste0(desc,": ",dat)))
}

printf("mean Harris thermometer rating",mean(anes$harrisTherm,na.rm=T))
printf("mean Trump thermometer rating",mean(anes$trumpTherm,na.rm=T))
cat("
  ####################
 ## Economic worry ##
####################
")
cat(noquote("Voters who consider themselves liberal but voted for Trump\nfrom most to least worried about their financial situation."))
print(table(leftTheLeft$worry))
cat(noquote("Voters who consider themselves conservative but voted for Harris\nfrom most to least worried about their financial situation."))
print(table(renouncedTheRight$worry))
cat(noquote("Voters who voted against their ideological bias\nfrom most to least worried about their financial situation."))
print(table(switched$worry))
worry <- c(1,2,3,4,5)
worriers <- c(7,10,27,55,75)
summary(lm(worriers ~ worry))
