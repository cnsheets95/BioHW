
##### Pulling the OD Readings for experiments ######

library(readxl)
library(tidyverse)

## Read in the file for that day ##
dat <- read_excel('C:/Users/cnshe/Desktop/SERDP/Ch.1_4_Degrees/Day0-MTT.xlsx',
                     range = 'C22:N30')

### Make a function to make a new df from the range of cells we want ###
clean.dat <- function(dat, Type, Day, Temp, Isolate){
n.dat <- data.frame(matrix(ncol = 10, nrow = 96)) 
dat <- as.matrix(dat)
n.dat[,1] <- as.vector(dat)
n.dat[,2] <- rep(c('A', 'B', 'C', 'D', 'E','F', 'G', 'H'), times = 12)
n.dat[,3] <- rep(1:12, each = 8)
n.dat[,4] <- Type
n.dat[,5] <- Day  
n.dat[,6] <- Temp
n.dat[,8] <- NA

## Name the new columns and assign the rows to the new df ##
colnames(n.dat) <- c('Reading', 'Row', 'Column', 
                     'Type', 'Day', 'Temp', 'Pos_Neg', 'Isolate')
n.dat <- n.dat[which(n.dat$Row == 'B' | n.dat$Row == 'C' |
                     n.dat$Row == 'D' | n.dat$Row == 'E'| n.dat$Row == 'F'),]

n.dat <- n.dat[-which(n.dat$Column == 1 | n.dat$Column == 12),]

## Identify the  negative and positive samples ##
n.dat$Pos_Neg <- 'Neg'
n.dat[which(n.dat$Column == 2 | n.dat$Column == 3 |
              n.dat$Column == 4 | n.dat$Column == 5|
              n.dat$Column == 6),'Pos_Neg'] <- 'Pos'
## Assign an isolate to each row according to experimental design ##
n.dat[which(n.dat$Row == 'B'),'Isolate'] <- Isolate[1]
n.dat[which(n.dat$Row == 'C'),'Isolate'] <- Isolate[2]
n.dat[which(n.dat$Row == 'D'),'Isolate'] <- Isolate[3]
n.dat[which(n.dat$Row == 'E'),'Isolate'] <- Isolate[4]
n.dat[which(n.dat$Row == 'F'),'Isolate'] <- Isolate[5]

return(n.dat)
}

## Final naming of new df after cleaning ##
clean.dat0 <- clean.dat(dat, Type = 'MTT', Day = 0, Temp = 4, 
                        Isolate = c('LA', 'OH', 'NM', 'TN', 'VT'))# %>%
  #mutate(MTTn = Pos_Neg$Pos - Pos_Neg$Neg)



###### Day 2 MTT ######

dat <- read_excel('C:/Users/cnshe/Desktop/SERDP/Ch.1_4_Degrees/Day2-MTT.xlsx',
                  range = 'C22:N30')

### Make a function to make a new df from the range of cells we want ###
clean.dat <- function(dat, Type, Day, Temp, Isolate){
  n.dat <- data.frame(matrix(ncol = 10, nrow = 96)) 
  dat <- as.matrix(dat)
  n.dat[,1] <- as.vector(dat)
  n.dat[,2] <- rep(c('A', 'B', 'C', 'D', 'E','F', 'G', 'H'), times = 12)
  n.dat[,3] <- rep(1:12, each = 8)
  n.dat[,4] <- Type
  n.dat[,5] <- Day  
  n.dat[,6] <- Temp
  n.dat[,8] <- NA
  
  ## Name the new columns and assign the rows to the new df ##
  colnames(n.dat) <- c('Reading', 'Row', 'Column', 
                       'Type', 'Day', 'Temp', 'Pos_Neg', 'Isolate')
  n.dat <- n.dat[which(n.dat$Row == 'B' | n.dat$Row == 'C' |
                         n.dat$Row == 'D' | n.dat$Row == 'E'| n.dat$Row == 'F'),]
  
  n.dat <- n.dat[-which(n.dat$Column == 1 | n.dat$Column == 12),]
  
  ## Identify the  negative and positive samples ##
  n.dat$Pos_Neg <- 'Neg'
  n.dat[which(n.dat$Column == 2 | n.dat$Column == 3 |
                n.dat$Column == 4 | n.dat$Column == 5|
                n.dat$Column == 6),'Pos_Neg'] <- 'Pos'
  ## Assign an isolate to each row according to experimental design ##
  n.dat[which(n.dat$Row == 'B'),'Isolate'] <- Isolate[1]
  n.dat[which(n.dat$Row == 'C'),'Isolate'] <- Isolate[2]
  n.dat[which(n.dat$Row == 'D'),'Isolate'] <- Isolate[3]
  n.dat[which(n.dat$Row == 'E'),'Isolate'] <- Isolate[4]
  n.dat[which(n.dat$Row == 'F'),'Isolate'] <- Isolate[5]
  
  return(n.dat)
}

## Final naming of new df after cleaning ##
clean.dat2 <- clean.dat(dat, Type = 'MTT', Day = 0, Temp = 4, 
                        Isolate = c('LA', 'OH', 'NM', 'TN', 'VT'))



Ch1_MTT_df <- rbind(clean.dat0, clean.dat2)



#### VISUALIZATIONS OF THE DATA ####
datTN_NM <- read_csv("C:/Users/cnshe/Desktop/SERDP/Ch.2_Common_Garden_Zoo/TN-NM Zoo.csv")
datLA <- read_csv("C:/Users/cnshe/Desktop/SERDP/Ch.2_Common_Garden_Zoo/LA_Zoo.csv")
datVT <- read_csv("C:/Users/cnshe/Desktop/SERDP/Ch.2_Common_Garden_Zoo/VT-Zoo.csv")
zoo <- read_csv("C:/Users/cnshe/Desktop/SERDP/Ch.2_Common_Garden_Zoo/OH_Zoos.csv")

#########################################################
## Peak Period Data ##
#########################################################


####### Sub setting the data for a 2 day peak period #########

OHzooStable <- zoo %>% 
  filter(Temp == 21) %>%
  filter(Day == "5" | Day == "6") %>%
  filter(Lineage == "Current"| Lineage == "Future")

OHzooCurrent_cur <- zoo %>% 
  filter(Temp == 5) %>%
  filter(Day == "6" | Day == "7") %>%
  filter(Lineage == "Current")

OHzooCurrent_fut <- zoo %>% 
  filter(Temp == 5) %>%
  filter(Day == "7" | Day == "8") %>%
  filter(Lineage == "Future")

OHzooFuture_cur <- zoo %>% 
  filter(Temp == 8) %>%
  filter(Day == "8" | Day == "9") %>%
  filter(Lineage == "Current")

OHzooFuture_fut <- zoo %>% 
  filter(Temp == 8) %>%
  filter(Day == "6" | Day == "7") %>%
  filter(Lineage == "Future")

## LA SUBSET ##

LAzooStable_cur <- datLA %>% 
  filter(Temp == 21) %>%
  filter(Day == "3" | Day == "5") %>%
  filter(Lineage == "Current")

LAzooStable_fut <- datLA %>% 
  filter(Temp == 21) %>%
  filter(Day == "5" | Day == "6") %>%
  filter(Lineage == "Future")

LAzooCurrent <- datLA %>% 
  filter(Temp == 5) %>%
  filter(Day == "4" | Day == "5") %>%
  filter(Lineage == "Current"| Lineage == "Future")

LAzooFuture <- datLA %>% 
  filter(Temp == 8) %>%
  filter(Day == "6" | Day == "7") %>%
  filter(Lineage == "Current"| Lineage == "Future")

## TN SUBSET ##

TNzooStable_cur <- datTN_NM %>% 
  filter(Temp == 21) %>%
  filter(Isolate == "TN") %>%
  filter(Day == "7" | Day == "8") %>%
  filter(Lineage == "Current")

TNzooStable_fut <- datTN_NM %>% 
  filter(Temp == 21) %>%
  filter(Isolate == "TN") %>%
  filter(Day == "4" | Day == "7") %>%
  filter(Lineage == "Future")

TNzooCurrent_cur <- datTN_NM %>% 
  filter(Temp == 5) %>%
  filter(Isolate == "TN") %>%
  filter(Day == "9" | Day == "13") %>%
  filter(Lineage == "Current")

TNzooCurrent_fut <- datTN_NM %>% 
  filter(Temp == 5) %>%
  filter(Isolate == "TN") %>%
  filter(Day == "7" | Day == "6") %>%
  filter(Lineage == "Future")

TNzooFuture_cur <- datTN_NM %>% 
  filter(Temp == 8) %>%
  filter(Isolate == "TN") %>%
  filter(Day == "7" | Day == "8") %>%
  filter(Lineage == "Current")

TNzooFuture_fut <- datTN_NM %>% 
  filter(Temp == 8) %>%
  filter(Isolate == "TN") %>%
  filter(Day == "5" | Day == "6") %>%
  filter(Lineage == "Future")

## NM SUBSET ##

NMzooStable <- datTN_NM %>% 
  filter(Isolate == "NM") %>%
  filter(Temp == 21) %>%
  filter(Day == "4" | Day == "5") %>%
  filter(Lineage == "Current"| Lineage == "Future")

NMzooCurrent <- datTN_NM %>% 
  filter(Temp == 5) %>%
  filter(Isolate == "NM") %>%
  filter(Day == "7" | Day == "6") %>%
  filter(Lineage == "Current"| Lineage == "Future")

NMzooFuture_cur <- datTN_NM %>% 
  filter(Temp == 8) %>%
  filter(Isolate == "NM") %>%
  filter(Day == "4" | Day == "5") %>%
  filter(Lineage == "Current")

NMzooFuture_fut <- datTN_NM %>% 
  filter(Temp == 8) %>%
  filter(Isolate == "NM") %>%
  filter(Day == "5" | Day == "6") %>%
  filter(Lineage == "Future")

## VT SUBSET ##

VTzooStable_cur <- datVT %>% 
  filter(Temp == 21) %>%
  filter(Day == "4" | Day == "6") %>%
  filter(Lineage == "Current")

VTzooStable_fut <- datVT %>% 
  filter(Temp == 21) %>%
  filter(Day == "4" | Day == "7") %>%
  filter(Lineage == "Future")

VTzooCurrent <- datVT %>% 
  filter(Temp == 5) %>%
  filter(Day == "6" | Day == "7") %>%
  filter(Lineage == "Current"| Lineage == "Future")

VTzooFuture <- datVT %>% 
  filter(Temp == 8) %>%
  filter(Day == "4" | Day == "9") %>%
  filter(Lineage == "Current"| Lineage == "Future")
################################################################################

##### R BIND ALL SUBSETS INTO Peak df ######

Ch2Peak_zoo_df <- rbind(VTzooFuture, VTzooCurrent, VTzooStable_fut, VTzooStable_cur, 
                        NMzooFuture_fut, NMzooFuture_cur, NMzooCurrent, NMzooStable,
                        TNzooFuture_fut, TNzooFuture_cur, TNzooCurrent_fut, TNzooCurrent_cur,
                        TNzooStable_fut, TNzooStable_cur, LAzooFuture, LAzooCurrent, 
                        LAzooStable_fut, LAzooStable_cur, OHzooFuture_fut, OHzooFuture_cur, 
                        OHzooCurrent_fut, OHzooCurrent_cur, OHzooStable)

#### Current Flux Conditions 5-25C ####
plot_5zoo <- Ch2Peak_zoo_df %>% 
  filter(Temp == 5) %>%
  filter(Lineage == "Current"| Lineage == "Future")


ggplot(plot_5zoo, aes(x = Isolate, y = Counts, fill = Lineage)) +
  geom_boxplot(aes(group = interaction(Isolate, Lineage)), width = 0.5) +
  geom_point(aes(group = Lineage), position=position_jitterdodge(jitter.width=0.05, dodge.width = 0.5, seed = 53), size=2, alpha=0.9, shape=21) +
  geom_signif(y_position=c(455, 380), xmin=c(0.75, 2.75), xmax=c(1.25, 3.25),
              annotation=c("*", "***"), textsize=6) +
  ggtitle("Current Flux (5-25C) Conditions") +
  ylab("Zoospores per mL(x10^4)") +
  xlab("Isolate") +
  scale_y_continuous(breaks = seq(0,400,100), limit = c(-0.1,455)) +
  scale_fill_manual(values = c("darkorange", "#1E90FF"))+
  theme_classic() +
  theme(axis.title.x = element_text(face = "bold", size = 18),
        axis.title.y = element_text(face = "bold", size = 18),
        axis.text.x = element_text(face = "bold", size = 18),
        axis.text.y = element_text(face = "bold", size = 18),
        axis.line = element_line(colour = 'black', size = 2),
        axis.ticks = element_line(colour = "black", size = 2),
        plot.title = element_text(face = "bold", hjust = 0.5, size = 18),
        legend.text = element_text(face = "bold", size = 16),
        legend.title = element_text(face = "bold", size = 18))

