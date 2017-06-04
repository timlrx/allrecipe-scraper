# Scrape the recipe links to input into the main scraper

library(rvest)

errortxt<-"all-recipe-links-error.txt"
file.create(errortxt, overwrite=TRUE)

source("allrecipe-scraper-links-func.R")

# ### Sample
# category <- c("japanese","indian")
# url_list <- c("http://allrecipes.com/recipes/699/world-cuisine/asian/japanese/?page=",
#               "http://allrecipes.com/recipes/233/world-cuisine/asian/indian/?page=")
#               
# scrape_links(max_page_no=2, category=category, url_list=url_list, file_path="raw_links/")
### End sample

category <- c("filipino","japanese","indian","chinese","thai","korean")

url_list <- c("http://allrecipes.com/recipes/696/world-cuisine/asian/filipino/?page=",
              "http://allrecipes.com/recipes/699/world-cuisine/asian/japanese/?page=",
              "http://allrecipes.com/recipes/233/world-cuisine/asian/indian/?page=",
              "http://allrecipes.com/recipes/695/world-cuisine/asian/chinese/?page=",
              "http://allrecipes.com/recipes/702/world-cuisine/asian/thai/?page=",
              "http://allrecipes.com/recipes/700/world-cuisine/asian/korean/?page=")

scrape_links(max_page_no=20, category=category, url_list=url_list, file_path="raw_links/")

### More Asian ###
category <- c("bangladeshi","pakistani","indonesian","malaysian","vietnamnese")

url_list <- c("http://allrecipes.com/recipes/16100/world-cuisine/asian/bangladeshi/?page=",
              "http://allrecipes.com/recipes/15974/world-cuisine/asian/pakistani/?page=",
              "http://allrecipes.com/recipes/698/world-cuisine/asian/indonesian/?page=",
              "http://allrecipes.com/recipes/701/world-cuisine/asian/malaysian/?page=",
              "http://allrecipes.com/recipes/703/world-cuisine/asian/vietnamnese/?page=")



### African ### 
category <- c("north african","south african","east african")

url_list <- c("http://allrecipes.com/recipes/17582/world-cuisine/african/north-african/?page=",
              "http://allrecipes.com/recipes/15035/world-cuisine/african/south-african/?page=",
              "http://allrecipes.com/recipes/17845/world-cuisine/asian/east-african/?page=")

### Australian, NZ and Canada ###
category <- c("australian", "canadian")

url_list <- c("http://allrecipes.com/recipes/228/world-cuisine/australian-and-new-zealander/?page=",
              "http://allrecipes.com/recipes/733/world-cuisine/canadian/?page=")

### European ###
category <- c("austrian", "belgian", "dutch", "eastern  european", "french", "german",
              "greek", "italian", "portugese", "scandinavian", "spanish", "swiss")

url_list <- c("http://allrecipes.com/recipes/718/world-cuisine/european/austrian/?page=",
              "http://allrecipes.com/recipes/719/world-cuisine/european/belgian/?page=",
              "http://allrecipes.com/recipes/720/world-cuisine/european/dutch/?page=",
              "http://allrecipes.com/recipes/712/world-cuisine/european/eastern-european/?page=",
              "http://allrecipes.com/recipes/721/world-cuisine/european/french/?page=",
              "http://allrecipes.com/recipes/722/world-cuisine/european/german/?page=",
              "http://allrecipes.com/recipes/731/world-cuisine/european/greek/?page=",
              "http://allrecipes.com/recipes/723/world-cuisine/european/italian/?page=",
              "http://allrecipes.com/recipes/724/world-cuisine/european/portugese/?page=",
              "http://allrecipes.com/recipes/725/world-cuisine/european/scandinavian/?page=",
              "http://allrecipes.com/recipes/726/world-cuisine/european/spanish/?page=",
              "http://allrecipes.com/recipes/727/world-cuisine/european/swiss/?page=",
              "http://allrecipes.com/recipes/719/world-cuisine/european/uk-and-ireland/?page=")

### Latin American ###
category <- c("carribean", "mexican", "south american")

url_list <- c("http://allrecipes.com/recipes/230/world-cuisine/latin-american/caribbean/?page=",
              "http://allrecipes.com/recipes/728/world-cuisine/latin-american/mexican/?page=",
              "http://allrecipes.com/recipes/730/world-cuisine/latin-american/south-american/?page=")
              
### Middle Eastern ###
category <- c("israeli", "lebanese", "persian", "turkish")

url_list <- c("http://allrecipes.com/recipes/1826/world-cuisine/middle-eastern/israeli/?page=",
              "http://allrecipes.com/recipes/1824/world-cuisine/middle-eastern/lebanese/?page=",
              "http://allrecipes.com/recipes/15937/world-cuisine/middle-eastern/persian/?page=",
              "http://allrecipes.com/recipes/1825/world-cuisine/middle-eastern/turkish/?page=")

