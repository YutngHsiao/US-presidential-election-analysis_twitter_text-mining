library(ggplot2) 
library(SnowballC)
library(tm)   

dir(cname)
tweets <- readLines("D:\\MSC\\Web\\CW\\all.txt", encoding = "UTF-8")
df <- as.data.frame(tweets)
# data cleansing regex
cname <- file.path("D:/MSC/Web/CW/DATA/")  
dfa <- as.data.frame(tweets)
doc <- VectorSource(tweets)  
# corpus doc
docs <- Corpus(doc)
for(j in seq(docs))   
{   
  docs[[j]] <- gsub(".*THD.*$|^.*?\\:\\d{2}\\:\\d{2}|\\#.*|*\\@.*?\\s|RT|\\'|\\’|\\‘", " ", docs[[j]])   
  docs[[j]] <- gsub("[Bb][Ee][Rr][Nn][Ii][Ee]|[Ss][Aa][Nn][Dd][Ee][Rr][Ss]", " ", docs[[j]])   
  docs[[j]] <- gsub("http\\S+\\s*|\\d|â|\\™|\\½|\\í|\\¸|\\•|\\¦|\\€", " ", docs[[j]])
  docs[[j]] <- gsub("[^[:alpha:]]", " ", docs[[j]])
}  

#docs_clean[[1]]
docs_clean <- tm_map(docs, removeNumbers)
docs_clean <- tm_map(docs_clean, tolower)
docs_clean <- tm_map(docs_clean, stemDocument)  
docs_clean <- tm_map(docs_clean, removePunctuation)
myStopwords <- c(stopwords('english'), "via")
docs_clean <- tm_map(docs_clean, removeWords, myStopwords)
docs_clean_f <- tm_map(docs_clean, stripWhitespace) 

for(k in seq(docs))   
{   
  docs_clean_f[[k]] <- gsub("htt.*?\\s|â|€|™|s\\s", " ", docs_clean_f[[k]])
  docs_clean_f[[k]] <- gsub("vote|voting", "vot", docs_clean_f[[k]])
  docs_clean_f[[k]] <- gsub("wins", "win", docs_clean_f[[k]])
  docs_clean_f[[k]] <- gsub("ppl", "people", docs_clean_f[[k]])
} 

docs_f <- tm_map(docs_clean_f, PlainTextDocument)   
dtmA <- DocumentTermMatrix(docs_f)
dtmA$dimnames

tdmA <- TermDocumentMatrix(docs_f)   
# term freq
freqA <- colSums(as.matrix(dtmA))   
ord <- order(freqA)   


dtms <- removeSparseTerms(dtmA, 0.98)
#inspect(dtms) 
findFreqTerms(dtms, lowfreq=100)
#freq(dtms)

freq <- sort(colSums(as.matrix(dtms)), decreasing=TRUE)   
Bdf <- data.frame(word=names(freq), freq=freq)  
#head(Bdf)  

# plot term freq.
p <- ggplot(head(Bdf, 26)[-c(1:2),], aes(word, freq))    
p <- p + geom_bar(stat="identity")
p <- p + theme(axis.text.x=element_text(size = 12,angle=45, hjust=1))   
p