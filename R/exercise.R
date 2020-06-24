readCorpus <- function(dirname="data", fPattern="*.txt", tokenize=TRUE, scanSep=ifelse(tokenize,"","\n")) {
	files <- dir(dirname, pattern=fPattern)
	lapply(files, function(x) {
		scan(file.path(dirname,x), what=character(), quote=NULL,sep=scanSep)
	})
}

readCorpus(tokenize = FALSE) -> file.collection

EUR.search <- function(file.content) {
  return(grep("EUR [0-9]*", file.content))
}

article.search <- function(file.content) {
  return(length(grep("^(A|An) ", file.content))/as.double(length(file.content)))
}

question.mark.search <- function(file.content) {
  return(length(grep("\\? $", file.content)))
}

China.search <- function(file.content) {
  return(length(grep("(China|Chinese|Beijing)", file.content)) > 0)
}

EUR.search(file.collection[[10]])
article.search(file.collection[[10]])
question.mark.search(file.collection[[10]])
question.mark.search.perc <- function(file.content) {
  return(length(grep("\\? $", file.content))/as.double(length(file.content)))
}

mean(unlist(lapply(file.collection, question.mark.search.perc)))

EUR.search.perc <- function(file.content) {
  return(length(grep("EUR [0-9]*", file.content))/as.double(length(file.content)))
}

which.max(unlist(lapply(file.collection, EUR.search.perc)))

readCorpus(tokenize = TRUE) -> file.collection.tokenized
which(unlist(lapply(file.collection.tokenized, China.search)))
