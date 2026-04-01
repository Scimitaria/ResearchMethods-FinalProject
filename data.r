options(repos = "https://cran.rstudio.com")
anes <- read.csv('./anes2024.csv')

  ###############
 ## Functions ##
###############
#print data with description
printf <- function(desc,dat){ prints(paste0(desc,": ",dat)) }
#print string without quotes
prints <- function(str){ cat(noquote(str),fill=T) }
#If an element is a feature, change to one, otherwise change it to 0
#This allows correlation checking between non-numeric values
#as.numeric interprets 1 and 0 as their boolean counterparts
numericize <- function(lst,cond){ as.numeric(lst == cond) }

  ############
 ## Issues ##
############
#Trump and Harris feeling thermometers
anes$harrisTherm <- ifelse(anes$V241156<0 | anes$V241156>100,NA,anes$V241156)
anes$trumpTherm <- ifelse(anes$V241157<0 | anes$V241157>100,NA,anes$V241157)
#who R voted for - 1: Harris; 2: Trump; other
anes$voted <- ifelse(anes$V242067>2,"Other",ifelse(anes$V242067<0,NA,anes$V242067))
#7-pt scale; lower is liberal
anes$bias <- ifelse(anes$V241177<0 | anes$V241177>7,NA,anes$V241177)
#financial worry; lower is more worried
anes$worry <- ifelse(anes$V241539 < 0,NA,anes$V241539)
#16-point scale; lower means less educated
anes$education <- ifelse(anes$V241463<0 | anes$V241463>16,NA,anes$V241463)
#5-point scale; lower means favoring aid to Ukraine
anes$ukraine <- ifelse(anes$V241740 < 0,NA,anes$V241740)
#5-point scale; lower means favoring aid to Israel
anes$israel <- ifelse(anes$V241741 < 0,NA,anes$V241741)
#5-point scale; lower means crime is more important
anes$crime <- ifelse(anes$V242177 < 0,NA,anes$V242177)
#5-point scale; lower means favoring more immigrants
anes$immigrants <- ifelse(anes$V241747 < 0,NA,anes$V241747)

  ################
 ## Assemblage ##
################
#1 if they prefer Harris to Trump else 0
anes$pref <- ifelse(anes$V241156>anes$V241157,1,0)
#politically liberal, voted for Trump
anes$leftTheLeft <- as.numeric(anes$bias<4 & anes$voted == 2)
#politically conservative, voted for Harris
anes$renouncedTheRight <- as.numeric(anes$bias>4 & anes$voted == 1)
#all people who voted against their political leaning
anes$switch <- as.numeric(anes$leftTheLeft | anes$renouncedTheRight)
