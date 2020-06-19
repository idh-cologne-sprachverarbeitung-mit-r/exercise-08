readCorpus <- function(dirname="data", fPattern="*.txt", tokenize=TRUE, scanSep=ifelse(tokenize,"","\n")) {
	files <- dir(dirname, pattern=fPattern)
	lapply(files, function(x) {
		scan(file.path(dirname,x), what=character(), quote=NULL,sep=scanSep)
	})
}

sw <- c("i", "me", "my", "myself", "we", "our", "ours", "ourselves", "you", "your", "yours", "yourself", "yourselves", "he", "him", "his", "himself", "she", "her", "hers", "herself", "it", "its", "itself", "they", "them", "their", "theirs", "themselves", "what", "which", "who", "whom", "this", "that", "these", "those", "am", "is", "are", "was", "were", "be", "been", "being", "have", "has", "had", "having", "do", "does", "did", "doing", "a", "an", "the", "and", "but", "if", "or", "because", "as", "until", "while", "of", "at", "by", "for", "with", "about", "against", "between", "into", "through", "during", "before", "after", "above", "below", "to", "from", "up", "down", "in", "out", "on", "off", "over", "under", "again", "further", "then", "once", "here", "there", "when", "where", "why", "how", "all", "any", "both", "each", "few", "more", "most", "other", "some", "such", "no", "nor", "not", "only", "own", "same", "so", "than", "too", "very", "s", "t", "can", "will", "just", "don", "should", "now")

removeStopwords <- function(list, stopwords=sw) {
	lapply(list, function(x) {
		x[!tolower(x) %in% stopwords]
	})
}



corpus_s <- readCorpus(tokenize=FALSE)
corpus_t <- readCorpus(tokenize=TRUE)

# a) 
grep("(EUR)\\s\\d+",corpus_s[[10]])

# b) 
length(grep("^An?\\b", corpus_s[[10]], value=TRUE))/length(corpus_s[[10]])

# c)
length(grep("\\?\\s+$", corpus[[10]], value=TRUE))

# d)
mean(unlist(lapply(corpus_s, function(x) {length(grep("\\?\\s+$", x))/length(x)})))

# e)
which.max(unlist(lapply(corpus_s, function(x) {length(grep("EUR", x))/length(x)})))

# f)
which(unlist(lapply(corpus, function(x) {sum(grep("(China|Chinese)", x)>0)})) > 0)