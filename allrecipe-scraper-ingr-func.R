library(rvest)

#' Scrapes ingredients and other recipe characteristics 
errortxt<-"all-recipe-ingr-error.txt"
file.create(errortxt, overwrite=TRUE)

#' @param row_entry row entry from scraper links spreadsheet
#' @output recipe_entry to be stored

scrape_ingr <- function(row_entry){
  
  num <- row_entry$recipe_path
  # num <- 14024
  url <- paste("http://allrecipes.com/recipe/",num,sep="")
  
  # Scrap ingredients and misc recipe characteristics
  webpage <- read_html(url)
  
  recipe_name2 <- webpage %>%
    html_nodes(".recipe-summary__h1") %>%
    html_text %>%
    as.character()
  
  # Replace punctuation with space and set all test to lower case
  recipe_name2 <- tolower(gsub('[[:punct:]]', ' ', recipe_name2))
  
  recipe_time <- webpage %>%
    html_nodes(".ready-in-time") %>%
    html_text %>%
    as.character()
 recipe_time <- ifelse(length(recipe_time)==0,NA,recipe_time)
  
  recipe_servings <- webpage %>%
    html_nodes(".adjust-servings__form #servings") %>%
    html_attr("value") %>%
    as.numeric()
  
  recipe_calorie <- webpage %>%
    html_nodes(".calorie-count") %>%
    html_text
  recipe_calorie <- as.numeric(gsub("([0-9]+).*$", "\\1", recipe_calorie))
  
  recipe_ingr <- webpage %>%
    html_nodes(".added") %>%
    html_text %>%
    as.character()
  
  recipe_ingr_id <- webpage %>%
    html_nodes(".added") %>%
    html_attr("data-id")
  
  # Subset only the ingredients (those with data-id != 0)
  recipe_ingr <- tolower(recipe_ingr[!is.na(recipe_ingr_id) & !recipe_ingr_id=="0"])

    
  # Create a recipe row entry with ingredients as variables
  tryCatch({
    recipe_row <- cbind(row_entry, recipe_name2, recipe_time, recipe_servings, recipe_calorie)
    for(i in 1:length(recipe_ingr)){
      col<-paste("recipe_ingr",i,sep="")
      recipe_row[,col] <- recipe_ingr[i]
    }
    recipe_row},
    error = function(err){
      message(paste("Error with recipe no", num))
      write(paste("Error with recipe no", num), file=errortxt,append=TRUE) 
      recipe_row <- NA
    })
}