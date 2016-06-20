retweeter_poster <-  na.omit(cbind(unlist(B_d2$V1), unlist(B_d2$V2)))
RT_freq <- count(B_d2$V2)
RT_freq <- RT_freq[RT_freq$freq > 10, ]
RT_freq[order(RT_freq$freq, decreasing = T),]
#####
library(ggplot2)
require(plyr)
require(igraph)
p1 <- ggplot(RT_freq, aes(x, freq*6))    
p1 <- p1 + geom_bar(stat="identity")
p1 <- p1 + theme(axis.text.x=element_text(size = 12,angle=45, hjust=1))   
p1
####
RTs <- B_d2[B_d2$V2 %in% RT_freq$x[c(1:10)],]
RTs$V1 <- as.character(RTs$V1)

B_m <-  cbind(unlist(RTs$V1), unlist(RTs$V2))
B_m <- as.matrix.default(unlist(B_m))

rt_graph = graph.edgelist(B_m)

# get vertex names
ver_labs = get.vertex.attribute(rt_graph, "name", index=V(rt_graph))

# choose layout
glay = layout.fruchterman.reingold(rt_graph)

# plot
par(bg="gray15", mar=c(1,1,1,1))
plot(rt_graph, layout=glay,
     vertex.color="gray25",
     vertex.size=10,
     vertex.label=ver_labs,
     vertex.label.family="sans",
     vertex.shape="none",
     vertex.label.color=hsv(h=0, s=0, v=.95, alpha=0.5),
     vertex.label.cex=0.5,
     edge.arrow.size=0.5,
     edge.arrow.width=0.3,
     edge.width=3,
     edge.color=hsv(h=.95, s=1, v=.7, alpha=0.5))
# add title
title("Who retweets whom", cex.main=1, col.main="gray95")
