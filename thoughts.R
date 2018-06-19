# Pull and return the top 10 trending tags from the trends website 
pull_trending_tags <- function(url){
selectors <- c()
for (i in 1:10){
  selector <- paste0('#trend-list > div:nth-child(1) > ol > li:nth-child(', i, ')')
  selectors <- c(selectors, selector)
}

trending_tags <- c()
for (selector in selectors){
  trending_tag  <- url %>% read_html %>% html_node(css=selector) %>% html_text
  trending_tags <- c(trending_tags, trending_tag)
}
trending_tags
}

# Function that takes in the trending tags and returns the top tweets for each tag
 pull_top_tweets <- function(trending_tags){
   consumer_key <- "9cEPkojgDpPQgW5teaArJtEmR"
   consumer_secret <- "xLLyL8UFx3sOR1t76LprHw3z7qsNUIq71WVPkfTlJXMauLn5vW"
   access_token <- "1009004295960883201-G72RuWwcEqHc8qJ8BFlwkKq1DbDPKN"
   access_secret <- "f8iI5HEdvZ8qkN1Y87eMFy2T71ftR10Gcsjgq71fneWio"
   setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
   tweet_list = c()
   for (hashtag in trending_tags) {  
     tweets <- twitteR::searchTwitter(hashtag, n = 10)
     tweet_list <- c(tweet_list, tweets)
   }
   tweet_list
 }

# Fuction that takes top tweets then returns which if any are actually disasters
# detect_disaster <-  function(top_tweets){}

# Function that notifies administrator if a disaster has taken place
# notify_admin <-  function(disaster){}

# Function that takes in input from administrator and then notifies users to make a donation
# get_money <- function(disaster){}

# Function to run the program
run_program <- function(x){
  library(rvest)
  library(twitteR)
  url <- "https://trends24.in/united-states/"
  top_tweets <- url %>% pull_trending_tags %>% pull_top_tweets
}

print(run_program())


