library(wordcloud)
library(tm)
Bs <- VectorSource(tweets)
corpus <- Corpus(Bs)
#clean up doc
B_corpus <- tm_map(corpus, removePunctuation)
#B_corpus <- tm_map(B_corpus, removeNumbers)
B_corpus <- tm_map(B_corpus, content_transformer(tolower))
B_corpus <- tm_map(B_corpus, removeWords, stopwords("english"))
#B_corpus <- tm_map(B_corpus, stripWhitespace)

dtm <- DocumentTermMatrix(B_corpus)
dtm2 <- as.matrix(dtm)

freq <- colSums(dtm2)
freq <- sort(freq, decreasing=TRUE)
head(freq, 20)
words <- names(freq)

#basic wordcloud
#wordcloud(words, freq)


#choose color pallete $ colour set
#pal <- brewer.pal(9, "Set1")
#pal <- rev(pal)
#pal <- pal[-(8:9)]
#wordcloud(words, freq, min.freq = 50,random.order = F, colors = pal)

# wordcloud plot / find assosiation between 3 US president candidates 
set.seed(66)   
wordcloud(names(freq[-c(1:2)]), freq[-c(1:2)], max.words=100, scale=c(5, .1), colors=brewer.pal(6, "Dark2"))  
findAssocs(dtms, c("bernie" , "hillary", "trump"), corlimit=0.9)