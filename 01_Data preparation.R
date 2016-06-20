library(tm)
B_row <- read.csv("B1.csv")
B_row$tweet <- as.character(B_row$tweet)
B_row$tweet[1]

#B_row$d1 <- gsub("http[^[:space:]]*", "", B_row$tweet)
B_row$d1 <- B_row$tweet
er <- grep("2016", B_row$tweet, invert = T)
#err <- rownames(B_row[-er,])

for (i in er){
  B_row[i-1,2] <- paste(B_row[i-1,2], B_row[i,2])
  B_row[i,2] <- NA
}
er <- grep("2016", B_row$d1, invert = T)
B_dat$d1 <- B_dat$tweet
B_dat <- na.omit(B_row)
er <- grep("2016", B_dat$tweet, invert = T)
#err <- rownames(B_row[-er,])

for (i in er){
  B_dat[i-1,2] <- paste(B_dat[i-1,2], B_dat[i,2])
  B_dat[i,2] <- NA
}
B_dat <- na.omit(B_dat)
er <- grep("2016", B_dat$tweet, invert = T)

# extract username
B_dat$usr <- sub("^(.*?)2016.*", "\\1", B_dat$d1)

# extract retweets
B_dat$RT <- sub(".*(RT.*\\:).*", "\\1", B_dat$d1)

err <- grep("RT", B_dat$RT, invert = T)

for (i in err){
  B_dat[i,4] <- NA
}
#B_d1 <- B_dat 
B_d1$time <- sub(".*(2016.{15}).*", "\\1", B_d1$tweet)

rownames(B_d1) <- 1:nrow(B_d1)

# extract time 
B_d1$d1 <- gsub("^.*?\\:\\d{2}\\:\\d{2}|\\#.*|\\@.*?\\s|RT", "", B_d1$tweet)
B_d1$d1 <- gsub("http\\S+\\s*|[Bb][Ee][Rr][Nn][Ii][Ee]|[Ss][Aa][Nn][Dd][Ee][Rr][Ss]|\\d", "", B_d1$d1)
B_d1$d1 <- gsub("[[:punct:]]", "", B_d1$d1)