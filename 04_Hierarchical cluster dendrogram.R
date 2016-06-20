library(cluster) 
library(ggdendro)

#Find the sum of words in each Document
cTotals <- apply(dtms , 2, sum) 
dtms.new   <- dtms[,cTotals> 200]
#dtms.new$dimnames

#computing distance matrix
d <- dist(t(dtms.new[,-c(4,63)]), method="euclidian")   
#fit hierarchical clustering
fit <- hclust(d=d, method="ward.D2")   
plot(fit, hang=-1) 