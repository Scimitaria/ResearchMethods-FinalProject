options(repos = "https://cran.rstudio.com")
source("data.r")

printf <- function(desc,dat){
    print(noquote(paste0(desc,": ",dat)))
}

printf("mean Harris thermometer rating",mean(harrisTherm,na.rm=T))
printf("mean Trump thermometer rating",mean(trumpTherm,na.rm=T))
