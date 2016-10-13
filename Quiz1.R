## Quiz 1

## Question 1
## The file en_US.blog.txt is how many megabytes?
## Answer
file.info("en_US.blogs.txt")
file.info("en_US.blogs.txt")$size / 1024^2  ## [1] 200.4242 


## ------------------------------------------------
## Question 2
##The en_US.twitter.txt has how many lines of text
## Anser
en_twitter <- readLines("en_US.twitter.txt")
en_twitter
length(en_twitter) ## [1] 2,360,148
## blogs and news files lines of text
en_blogs <- readLines("en_US.blogs.txt")
length(en_blogs)  ## [1] 899,288
en_news <- readLines("en_US.news.txt")
length(en_news) ## [1] 1,010,242


## ------------------------------------------------
## Question 3
## What is the length of the longest line seen in any of the three en_US data sets?
## Answer:
max(nchar(en_blogs)) # [1] 40,835
max(nchar(en_news))  # [1] 11,384 
max(nchar(en_twitter)) # [1] 213 

## ------------------------------------------------
## Question 4
## In the en_US twitter data set, if you divide the number of lines where the word "love" (all lowercase)
## occurs by the number of lines the word "hate" (all lowercase) occurs, about what do you get?
## Answer:
love <- sum(grepl("love", en_twitter))
love  ## [1] 90,956
hate <- sum(grepl("hate", en_twitter))
hate ## [1] 22,138 
love / hate  ## [1] 4.108,592 

## ------------------------------------------------
## Question 5
## The one tweet in the en_US twitter data set that matches the word "biostats" says what?
## Answer:
biostats <- grep("biostats", en_twitter)
biostats  ### [1] 556,872
en_twitter[biostats]

## ------------------------------------------------
## Question 6
## How many tweets have the exact characters 
## "A computer once beat me at chess, but it was no match for me at kickboxing". 
## (I.e. the line matches those characters exactly.)

##:Answer:
sum(grepl("A computer once beat me at chess, but it was no match for me at kickboxing", en_twitter))  
## 3


