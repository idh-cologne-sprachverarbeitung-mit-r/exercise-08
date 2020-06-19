readCorpus <- function(dirname="data", fPattern="*.txt", tokenize=TRUE, scanSep=ifelse(tokenize,"","\n")) {
	files <- dir(dirname, pattern=fPattern)
	lapply(files, function(x) {
		scan(file.path(dirname,x), what=character(), quote=NULL,sep=scanSep)
	})
}