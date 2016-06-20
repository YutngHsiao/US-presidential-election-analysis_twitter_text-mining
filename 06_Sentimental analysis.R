pos = scan('positive-words.txt', what='character', comment.char=';')
neg = scan('negative-words.txt', what='character', comment.char=';')

# add sentimental lexicons
pos.words = c(pos, 'upgrade')
neg.words = c(neg, 'wtf', 'wait', 'waiting', 'epicfail', 'mechanical')

delta.text = laply(tweets, function(t) t$getText() )

score.sentiment = function(sentences, pos.words, neg.words, .progress='none')
{
  require(plyr)
  require(stringr)
  
  # plyr handles a list or a vector
  scores = laply(sentences, function(sentence, pos.words, neg.words) {
    
    # clean up sentences with gsub()
    sentence = gsub('[[:punct:]]', '', sentence)
    sentence = gsub('[[:cntrl:]]', '', sentence)
    sentence = gsub('\\d+', '', sentence)
    # convert to lower case:
    sentence = tolower(sentence)
    
    # split into words. str_split
    word.list = str_split(sentence, '\\s+')
    # list() is one level of hierarchy too much
    words = unlist(word.list)
    
    # compare our words to the dictionaries of positive & negative terms
    pos.matches = match(words, pos.words)
    neg.matches = match(words, neg.words)
    
    # match() returns the position of the matched term or NA
    pos.matches = !is.na(pos.matches)
    neg.matches = !is.na(neg.matches)
    score = sum(pos.matches) - sum(neg.matches)
    
    return(score)
  }, pos.words, neg.words, .progress=.progress )
  
  scores.df = data.frame(score=scores, text=sentences)
  return(scores.df)
}

# result = score.sentiment(B1, pos.words, neg.words)
delta.scores = score.sentiment(delta.text, pos.words, neg.words, .progress='text')
# hist(delta.scores$score)
library(ggplot2)
q = qplot(delta.scores$score)
q = q + theme_bw()
q
