library(rvest)

url <- "https://trends24.in/united-states/"


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

trending_tags <- pull_trending_tags(url)

# Run Selenium on the twitter search for each of the trending tags and return top tweets
