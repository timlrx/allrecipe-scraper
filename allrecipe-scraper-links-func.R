library(rvest)

errortxt<-"all-recipe-links-error.txt"
file.create(errortxt, overwrite=TRUE)

#' @param max_page_no interger for the maximum number of search queries to scrape from
#' @param category list of categories to scrape 
#' @param url_list list of urls that correspond to categories
#' @param file_path file path to save output
#' @output csv files containing scrape links
scrape_links<-function(max_page_no, category, url_list, file_path){
  for(i in 1:length(url_list)){  
    for(page_no in 1:3){
      
      url<- paste(url_list[i],page_no,sep="")
      
      webpage <- tryCatch(
        read_html(url),
        error = function(err){
          message(paste("URL does not seem to exist:", url))
          write(paste("URL does not seem to exist:", url), file=errortxt,append=TRUE) 
        })
      
      recipe_path <- webpage %>% 
        html_nodes(".grid-col--fixed-tiles") %>%
        html_nodes(".favorite") %>%
        html_attr("data-id") %>%
        as.numeric()
      
      recipe_name <- webpage %>% 
        html_nodes(".grid-col--fixed-tiles") %>%
        html_nodes(".favorite") %>%
        html_attr("data-name") %>%
        as.character()
      
      # Replace punctuation with space and set all test to lower case
      recipe_name <- tolower(gsub('[[:punct:]]', ' ', recipe_name))
      
      recipe_category <- rep(category[i],length(recipe_path))
      recipe_page_no <- rep(page_no,length(recipe_path))
      recipe <- as.data.frame(cbind(recipe_category,recipe_page_no,recipe_path,recipe_name))
      
      csvpath <- paste(file_path,category[i],Sys.Date(),".csv",sep="")
      
      if(!file.exists(csv_path)){
        write.table(recipe, csvpath, append=T, sep=",", row.names=F, col.names=T)
      } else{
        write.table(recipe, csvpath, append=T, sep=",", row.names=F, col.names=F)  
      }
      
    }  
  }  
}