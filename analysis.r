options(repos = "https://cran.rstudio.com")
source("data.r")

printf <- function(desc,dat){
    print(noquote(paste0(desc,": ",dat)))
}
#use partisan lean variable vs voted
#D -> R, R -> D, and global model
printf("mean Harris thermometer rating",mean(anes$harrisTherm,na.rm=T))
printf("mean Trump thermometer rating",mean(anes$trumpTherm,na.rm=T))

print(table(leftTheLeft))
