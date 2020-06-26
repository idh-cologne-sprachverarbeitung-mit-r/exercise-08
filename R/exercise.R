readCorpus <- function(dirname="data", fPattern="*.txt", tokenize=TRUE, scanSep=ifelse(tokenize,"","\n")) {
	files <- dir(dirname, pattern=fPattern)
	lapply(files, function(x) {
		scan(file.path(dirname,x), what=character(), quote=NULL,sep=scanSep)
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
which(unlist(lapply(corpus, function(x) {sum(grep("(China|Chinese|Beijing)", x)>0)})) > 0)