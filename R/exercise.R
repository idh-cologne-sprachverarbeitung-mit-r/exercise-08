readCorpus <- function(dirname="data", fPattern="*.txt", tokenize=TRUE, scanSep=ifelse(tokenize,"","\n")) {
  files <- dir(dirname, pattern=fPattern)
  lapply(files, function(x) {
    scan(file.path(dirname,x), what=character(), quote=NULL,sep=scanSep)
  })
}

setwd("C:\\Users\\Lukas\\exercise-08")
getwd()


# Korpora einlesen
a <- readCorpus(tokenize = FALSE)
b <- readCorpus()

a_doc10 <- a[10]

task_a <- grep("(EUR)\\s\\d+",a_doc10[[1]])

task_b_sentences <- grep("^An?\\b", a_doc10[[1]])
task_b_percentage <- length(task_b_sentences)/length(a_doc10[[1]])*100

task_c_sentences <- grep("\\?\\s$", a_doc10[[1]])
task_c_length <- length(task_c_sentences)

task_d <- mean(unlist(lapply(a, function(x) {length(grep("\\?\\s$", x))/length(x)})))*100

task_e <- which.max(unlist(lapply(a, function(x) {length(grep("(EUR)", x))/length(x)})))
task_e_doc97_percentage <- mean(unlist(lapply(a[97], function(x) {length(grep("(EUR)", x))/length(x)})))*100

#ERROR: Argument zu 'which' ist nicht boolesch (Versuch durch as.factor zu lösen)
task_f <- which(unlist(lapply(b, function(x) {as.factor(sum(grep("(China|Chinese|Beijing)", x)))})))

