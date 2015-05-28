setwd("~/Documents/GTD/R Piping")
remove(list=ls())

library(dplyr)
library(nycflights13)

data(flights)

glimpse(flights)


flightsToChicago_NESTING<-arrange(
  summarize(
    group_by(
      filter(flights,dest=="ORD",day==1),carrier),numFlights=n()),desc(numFlights)
)

flightsToChicago_NESTING




flightsToChicago_PIPING<-flights%>%
  filter(dest=="ORD",day==1)%>%
  group_by(carrier)%>%
  summarise(numFlights=n())%>%
  arrange(desc(numFlights))

flightsToChicago_PIPING
