#!/usr/bin/env Rscript

# Required packages
library(tm)
library(wordcloud)
# Locate and load the Corpus.
cname <- file.path("~", "Desktop", "programming", "R", "texts")
docs <- Corpus(DirSource(cname))
# Transforms
toSpace <- content_transformer(function(x, pattern) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/|@|\\|")
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeNumbers)
docs <- tm_map(docs, removePunctuation)
docs <- tm_map(docs, removeWords, stopwords("english"))
docs <- tm_map(docs, stripWhitespace)
docs <- tm_map(docs, stemDocument)

# Document term matrix.
dtm <- DocumentTermMatrix(docs)

findFreqTerms(dtm, lowfreq=450)
findAssocs(dtm, "data", corlimit=0.8)
freq <- sort(colSums(as.matrix(dtm)), decreasing=TRUE)
wf <- data.frame(word=names(freq), freq=freq)


#set.seed(142)
wordcloud(names(freq), freq, min.freq=500, scale=c(5, .1), colors=brewer.pal(6, "Dark2"))
