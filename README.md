# Exercise 8

**In General**: Please ask questions in the [ilias-Forum](https://www.ilias.uni-koeln.de/ilias/goto_uk_frm_3270419.html) for this course, so that others can also see the question and answer*.

*Please submit your solutions to this exercise until June 26th.*

The goal of this exercise is to get to learn about regular expressions.

*Note*: There is no automatic testing this week (because it caused more issues than it solved). Instead, the task descriptions below also state expected results for some inputs.

## Step 1

The relevant reading this week is section 4.4 in [Desagulier (2017)](https://www.springer.com/gp/book/9783319645704).

## Step 2

Clone this repository. The same as last week.

In the examples, I'll use "Textanalyse-mit-R", you should replace this with the path to your directory: `cd Textanalyse-mit-R`. Clone this repository: `git clone https://github.com/idh-cologne-sprachverarbeitung-mit-r/exercise-08.git`. Enter the directory `cd exercise-08`. Create a new branch for you: `git checkout -b USERNAME`.

## Step 3
Again (as last week), open the file `R/exercise.R` in your favorite text editor. Depending on your operating system and settings, double clicking may open an editor that came with the R installation. The directory `data` contains a few files we‘ll be using in the exercises.

This week we will continue doing corpus analysis using the functions established last week. You'll find the function `readCorpus()` in the exercise file, but it has been changed slightly: You can now pass an additional argument `tokenize`, which is set to `TRUE` per default. If set to `FALSE`, the resulting list will contain the texts sentence-wise, i.e., each vector element is a sentence in the document (and not a single token).

- a) Let's first focus on a single document. Read in the corpus in data, and access document 10. Please write an R expression that gives you which sentences mention Euro sums from in this document. Currency values in Euro are always written using EUR as a designation, but not all numbers are currency values. Only take the amount in front of decimal points into account (i.e., 1.1 million is counted as 1 million). The sentence ids are 897, 948, 954, 956, 1091, 1096, 1133, 1135, and 1252.

- b) Write an R expression that tells you the percentage of the sentences in document 10 that start with an indefinite article. Indefinite articles in English are "a" and "an". The number you're looking for is 1.356744 % (i.e., 17 sentences).

- c) Write an R expression that tells you how many sentences end in a question mark. The answer is 47. Please note that there is a space at the end of each string, which you will need to account for.

We will now switch to looking at the entire corpus. This works similarly to what you have been doing before, but you'll need to wrap your expressions into a call to `lapply()`, and put it into an anonymous function. As an example, consider the following expression to calculate the mean document length: 

```
corpus <- readCorpus(tokenize=TRUE)
mean(unlist(lapply(corpus, function(x) {length(x)})))
```

The anonymous function `function(x) {length(x)}` takes a vector and returns its length. You will need to replace the call to the length-function with something different :-)

- d) How do we get the mean percentage of sentences ending in a question mark in the entire corpus? It's 2.780674 %.

- e) How do we find out that document 97 is the one with the highest (relative) number of sentences that mention EUR currency values (4.4025157 %)?

- f) Write an R expression that tells us in which documents someone talks about China. In addition to "China", we also want to take "Chinese" and "Beijing" into account (in political speech, capitals are often used to refer to the government and thus, the country). These are documents 2, 8, 9, 15, 24, 32, 33, 42, 63, 66, 69, 70, 76, 80, 82, and 99.




## Step 4
Don't forget to save your file.
Now turning back to git: Add your file to the staging area (`git add R/exercise.R`), commit it (`git commit -m ""`, you need to fill in a commit message), and push it to the server (`git push --set-upstream origin BRANCHNAME`).

