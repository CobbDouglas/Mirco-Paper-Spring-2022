library(tidyverse)
library(haven)
library(broom)
library(stargazer)
## Import 
##usa_00001 <- read_dta("usa_00001.dta")
##View(usa_00001)
## filter for georiga 
##ACSS <- usa_00001 %>%
##filter(usa_00001$statefip==13)
## remove big dataset that's taking up memory
##remove(usa_00001)
## ACSlabor <- ACSS %>%
##select(serial,metro,ownershp,taxincl,rent,hhincome,sex,age,
      # birthqtr,marst,hispan,racamind,racasian,racblk,racwht,empstat,
       #labforce,ftotinc,incwelfr,uhrswork)
 # write_csv(ACSlabor,file = "ACSlabor.csv")
  read.csv("ACSlabor.csv")

ACSlabor<- ACSlabor %>%
  filter(ftotinc <= 75000) 
  ACSlabor %>%
  ggplot(aes(x=ftotinc))+
  geom_histogram()
  
  ACS

m1 <- lm(ftotinc ~ uhrswork,ACSlabor )
summary(m1)
m2 <- glm(ftotinc ~ uhrswork,family = gaussian(),data = ACSlabor, weights = c(weight1))
summary(m2)

stargazer(m1, type = "html",out = "model1.html")
stargazer(m2, type = "html",out = "model2.html")


## Creation of weights?
ACSlabor$weight1 <- .5 
## talk to farhidi about weighting because i dont think we can
## weight stuff like he said. 