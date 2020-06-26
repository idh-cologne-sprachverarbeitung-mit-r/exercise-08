readCorpus <- function(dirname="data", fPattern="*.txt", tokenize=TRUE, scanSep=ifelse(tokenize,"","\n")) {
	files <- dir(dirname, pattern=fPattern)
	lapply(files, function(x) {
		scan(file.path(dirname,x), what=character(), quote=NULL,sep=scanSep)
	})
}

# a)
doc10 <- readLines("data/F10.txt")
grep("\\sEUR\\s\\d", doc10)

# b)
length(grep("(^A\\s|^An\\s)", doc10))/length(doc10)*100

# c)
doc10 <- scan(file="data/F10.txt", what="character", quote=NULL)
grep("\\?", doc10)

# d)
questionMarks <- unlist(lapply(corpus, function(x) {grep("\\?", x)})) 
numquestionMarks <- length(questionMarks)
sentences <- unlist(lapply(corpus, function(x) {grep("[.?!]", x)})) 
numSentences <- length(sentences)
numquestionMarks/numSentences*100

# e)


# f)
lapply(corpus, function(x) {grep("(China|Beijing|Chinese)", x, value=TRUE)})
