test_that("long_form returns a long style data frame", {
  long <- long_form(maternal_data, "MMR")
  expect_s3_class(long, "data.frame") #making sure its long form data 
})

