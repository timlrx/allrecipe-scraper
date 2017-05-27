# Scrape the recipe links to input into the main scraper

library(rvest)

errortxt<-"all-recipe-links-error.txt"
file.create(errortxt, overwrite=TRUE)

source("allrecipe-scraper-links-func.R")

### Sample
category <- c("japanese","indian")
url_list <- c("http://allrecipes.com/recipes/699/world-cuisine/asian/japanese/?page=",
              "http://allrecipes.com/recipes/233/world-cuisine/asian/indian/?page=")
              
scrape_links(max_page_no=2, category=category, url_list=url_list, file_path="raw_links/")
### End sample

category <- c("japanese","indian","chinese","thai","filipino","korean")

url_list <- c("http://allrecipes.com/recipes/699/world-cuisine/asian/japanese/?page=",
              "http://allrecipes.com/recipes/233/world-cuisine/asian/indian/?page=",
              "http://allrecipes.com/recipes/695/world-cuisine/asian/chinese/?page=",
              "http://allrecipes.com/recipes/702/world-cuisine/asian/thai/?page=",
              "http://allrecipes.com/recipes/696/world-cuisine/asian/filipino/?page=",
              "http://allrecipes.com/recipes/700/world-cuisine/asian/korean/?page=")

