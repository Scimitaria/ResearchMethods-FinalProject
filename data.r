options(repos = "https://cran.rstudio.com")

anes <- read.csv('./anes2024.csv')

#If an element is a feature, change to one, otherwise change it to 0
#This allows correlation checking between non-numeric values
numericize <- function(lst,cond){ as.numeric(lst == cond) }

anes$harrisTherm <- ifelse(anes$V241156<0 | anes$V241156>100,NA,anes$V241156)
anes$trumpTherm <- ifelse(anes$V241157<0 | anes$V241157>100,NA,anes$V241157)

  ############
 ## Issues ##
############
#1: Harris; 2: Trump; other
anes$voted <- ifelse(anes$V242067>2,"Other",ifelse(anes$V242067<0,NA,anes$V242067))
#7-pt scale; lower is liberal
anes$bias <- ifelse(anes$V241177<0 | anes$V241177>7,NA,anes$V241177)
#financial worry; lower is more worried
anes$worry <- ifelse(anes$V241539 < 0,NA,anes$V241539)

  ################
 ## Assemblage ##
################
#1 if they prefer Harris to Trump else 0
anes$pref <- ifelse(anes$V241156>anes$V241157,1,0)
#politically liberal, voted for Trump
leftTheLeft <- subset(anes,bias<4 & voted == 2)
#politically conservative, voted for Harris
renouncedTheRight <- subset(anes,bias>4 & voted == 1)
#all people who voted against their political leaning
switched <- rbind(leftTheLeft,renouncedTheRight)
