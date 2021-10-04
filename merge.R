#SSCI GAME DID MERGE
setwd("C:/Users/sh921/Desktop/jupyter/game project/2020KMAC")
getwd()


#data load
cash <- read.csv("cash.csv")
cha <-  read.csv('character.csv')
ram <-  read.csv('ram.csv')

str(cash)
str(cha)
str(ram)

df <- read.csv("master_did_210924.csv")
str(df)

df <- merge(df, cash, by=c('gameName'), all.x =T)
df <- merge(df, cha, by=c('gameName'), all.x =T)
df <- merge(df, ram, by=c('gameName'), all.x =T)
str(df)
colSums(is.na(df))


write.csv(df, "sample.csv")
covid <- read.csv("covid_api_0930.csv")
str(covid)
df <- merge(df, covid, by=c('date'), all.x =T)
str(df)
colSums(is.na(df))

write.csv(df, "master_did_211002_2.csv")

View(df)
local <- read.csv("theLog-scrap4.csv")
str(local)

df <- merge(df, local, by=c('gameName','date'), all.x =T)
str(df)
colSums(is.na(df))

View(df)


write.csv(df, "master_did_211002.csv")


df <- read.csv("master_for_stata.csv")
str(df)

code <-  read.csv('gameCode.csv')
df <- merge(df, code, by=c('gameName'), all.x =T)
colSums(is.na(df))

write.csv(df, "master_for_stata.csv")


#getting sample data
library(foreign)
data = read.csv('C:/Users/sh921/Desktop/jupyter/game project/2020KMAC/stata 분석용/master_stata_735.csv')
pcode = read.csv('publisherCode.csv')
str(pcode)
gcode = read.csv('gameCode.csv')
str(gcode)

#code merge
df <- merge(data, pcode, by=c('publisher'), all.x =T)
df <- merge(df, gcode, by=c('gameName'), all.x =T)
str(df)
write.csv(df, "master_stata_1002.csv")

df <- read.csv('C:/Users/sh921/Desktop/jupyter/game project/2020KMAC/master_stata_1002.csv')
df$time = ifelse(df$date >= 20200120,1,0)

#ram
table(df$ram)
didreg1 = lm(ln_totaltime ~ ram*time, data=df)
summary(didreg1)

#cash
table(df$cash)
didreg2 = lm(ln_totaltime ~ cash*time, data=df)
summary(didreg2)

#pve
table(df$PvE)
didreg3 = lm(ln_totaltime ~ PvE*time, data=df)
summary(didreg3)

#pvp
table(df$PvP)
didreg4 = lm(ln_totaltime ~ PvP*time, data=df)
summary(didreg4) #아마 너무 적어서 뒤집혀 나오는 것 같음

#singleplay
table(df$singlePlay)
didreg5 = lm(ln_totaltime ~ singlePlay*time, data=df)
summary(didreg5)

#team
table(df$teamPlay)
didreg6 = lm(ln_totaltime ~ teamPlay*time, data=df)
summary(didreg6) 

#gaming_interaction
table(df$gaming_interaction)
didreg7 = lm(ln_totaltime ~ gaming_interaction*time, data=df)
summary(didreg7)
