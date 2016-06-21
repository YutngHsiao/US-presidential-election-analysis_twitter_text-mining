# US-presidential-election-analysis_twitter_text-mining
#[DEMO](https://jony0912.shinyapps.io/US_presendent_election_analysis_Twitter_text_mining/)

This report is to analyse the public opinions for the US persidental candidate Bernie Sanders on Twitter, to reveal how people think about him and evaluate the degree of support on social media. 
Finally, the major terms and topics that people used to mention about Sanders and the percentage of positive / negative 
post will be revealed. Including the social network diagram of Sanders’ supporters.

-	More than 45000 tweets were collected from twitter (07-17/04/2016) in python.
-	Source data was pre-processed through extracting, cleaning and stemming.
-	Data exploration is processed by graphical plotting, wordcloud and k-mean clustering. 
-	The analysis models include cluster grouping and topic model.
-	Final report is consisted of sentimental analysis and scoring, social network diagrams.

#Analysis
-	The most competitive candidate against Mr Bernie is Hillary Clinton.
-	The TV and web media plays massive role in the election to divert public opinion, e.g. Saturday night live, feel the bern.
-	People don’t trust political show and speech.
-	Mr Bernie won high reputation and support in New York.
-	70% of posters who mentioned about Mr Bernie were not likely to support him.
-	Half of re-tweets were done by Bernie supporters. 

#Conclusion
-	The social media strategy from Mr Bernie’s team should try to improve advertise efficiency.
-	Organize supporter and post more topic about taxation and pope Francis.
-	Enhance supporter network to increase retweets.
-	Stop offensive speech about Hillary’s personality.

#Package using:
- The package “tweepy” was used to collect tweets on twitter, by targeting the query “Bernie” and “Bernie Sanders”.
- TextBlob package was used to correct the spelling. However, several words were mis-corrected, especially the candidates’ names.
- By using “gsub” and “grepl” with regular expression, source tweets can be cleaned and extracted.
- Text mining package “tm” in R is a good tool for data processing.
- Cluster Dendrogram shows the hierarchical relationship in graphical representation of terms of a matrix of distances, which is perhaps the easiest to understand.
- Topic model was also applied to compare with cluster result. 
- The association terms with “Bernie”, “Hillary”, and “Trump” can be found by using keyword correlation. 
- Sentimental test was introduced by using Naïve Bayes classifier in python. 
- The score of opinion lexicons was introduced in both R/python
- Social network from Retweets


