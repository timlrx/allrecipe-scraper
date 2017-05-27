library(rvest)

url<-"http://allrecipes.com/recipe/8495/chicken-cordon-bleu-i/?internalSource=rotd&referringId=659&referringContentType=recipe%20hub&clickId=cardslot%201"
url<- "http://allrecipes.com/recipe/86738/phenomenal-chicken-and-pasta-in-creamy-pesto-sauce/?internalSource=recipe%20hub&referringId=733&referringContentType=recipe%20hub&clickId=cardslot%2028"

#Using CSS selectors to scrap ingredients

webpage <- read_html(url)

recipe_name <- webpage %>%
               html_nodes(".recipe-summary__h1") %>%
               html_text

recipe_time <- webpage %>%
               html_nodes(".ready-in-time") %>%
               html_text

recipe_servings <- webpage %>%
                   html_nodes(".adjust-servings__form #servings") %>%
                   html_attr("value")

recipe_calorie <- webpage %>%
  html_nodes(".calorie-count") %>%
  html_text
recipe_calorie <- gsub("([0-9]+).*$", "\\1", recipe_calorie)

recipe_ingr <- webpage %>%
                    html_nodes(".added") %>%
                    html_text

recipe_ingr_id <- webpage %>%
                  html_nodes(".added") %>%
                  html_attr("data-id")

# Subset only the ingredients (those with data-id != 0)
recipe_ingr <- tolower(recipe_ingr[!is.na(recipe_ingr_id) & !recipe_ingr_id=="0"])

# Remove ingredient amounts / measurement / preparation methods / 
recipe_name
recipe_time
recipe_servings
recipe_calorie
recipe_ingr

## Remove punctuation and numbers
recipe_ingr <- gsub('[0-9]+|[[:punct:]]', '', recipe_ingr)
## Remove measurement units
recipe_ingr <- gsub('tablespoon.|teaspoon.|cup.|gram.|kilogram.|kg.|ounce.|lb.', '', recipe_ingr)
recipe_ingr <- gsub('jar.|to\\staste.', '', recipe_ingr)
