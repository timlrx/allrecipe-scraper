library(rvest)
library(dplyr)

# Initialising
files <- list.files(path="raw_links/", pattern="*.csv", full.names=T, recursive=FALSE)
source("allrecipe-scraper-ingr-func.R")

# Loop over all files
for(i in 1:2){
  df <- read.csv(files[i], as.is=T)
  category <- df$recipe_category[1]
  recipe_df <- data.frame()

  # Loop over all recipe paths in the file
  for(x in 1:2){
    row_entry <- df[x,]
    recipe_row <- scrape_ingr(row_entry = row_entry)
    recipe_df <- bind_rows(recipe_df, recipe_row)
  }
  csvpath <- paste("recipe_data/",category,"_recipe_",Sys.Date(),".csv",sep="")
  write.table(recipe_df, csvpath, append=T, sep=",", row.names=F, col.names=T)
  
}

### Check manually
recipe_name2
recipe_time
recipe_servings
recipe_calorie
recipe_ingr

# Remove ingredient amounts / measurement / preparation methods / 
## Remove punctuation and numbers
recipe_ingr <- gsub('[0-9]+|[[:punct:]]', '', recipe_ingr)
## Remove measurement units
recipe_ingr <- gsub('tablespoon.|teaspoon.|cup.|gram.|kilogram.|kg.|ounce.|lb.', '', recipe_ingr)
recipe_ingr <- gsub('jar.|to\\staste.', '', recipe_ingr)
