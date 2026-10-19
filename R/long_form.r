#' @title long_form() 
#' @description This function pivots pivot world bank style data into longer form. Therefore it increases the number of rows and decreases the number of cols. Making it easier to work with for graphing, grouping data, and such. 
#' @param x dataframe of interest
#' @param varname new column name with the values from the combined columns  
#' @returns new dataframe in long format 
#' @examples
#' df <- data.frame(
#'   iso = c("CA", "US"),
#'   X1960 = c(10, 20),
#'   X1961 = c(11, 21))
#' long_form(df, "MMR")
#' @export

long_form <- function(x, varname) {
    x|>
    tidyr::pivot_longer(cols = dplyr::starts_with("X"), #selecting all cols that start with x 
                 names_to = "year", #creating new variable called Year 
                 names_prefix = "X", # removes X from year column (so only numerical shows)
                 values_to = varname)|>
        dplyr::mutate(year = as.numeric(year)) |>
        dplyr::select(iso,year, dplyr::all_of(varname)) #values of maternal mortality 
} 

