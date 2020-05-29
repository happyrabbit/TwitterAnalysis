## Packages
library(dplyr)
library(shiny)
library(coreNLP)
library(wordcloud)
library(tm)
library(NLP)
# R wrapper for Google's Compact Language Detector 3
library(cld3)
downloadCoreNLP() 
initCoreNLP(libLoc='stanford-corenlp-4.0.0')
dat <- read.csv("Data/tweets_netlify2020-05-22.csv",stringsAsFactors = F)
vercel <- read.csv("Data/tweets_vercel2020-05-28.csv",stringsAsFactors = F)
zeit <- read.csv("Data/tweets_zeit2020-05-28.csv",stringsAsFactors = F)
vercel = rbind(vercel, zeit)
# dat$language = detect_language(dat$text)
# write.csv(dat, "Data/tweets_netlify2020-05-22.csv", row.names = F)
dat = dat %>% filter(isRetweet == F & language == 'en')
annotres<-annotateString(dat$text)

vercel$language = detect_language(vercel$text)
vercel = vercel %>% filter(isRetweet == F & language == 'en')

annotres<-annotateString(dat$text)
save(annotres, file = 'Results/tweet_anno.RData')

annotres_vercel<-annotateString(vercel$text)
save(annotres_vercel, file = 'Results/tweet_vercel.RData')
