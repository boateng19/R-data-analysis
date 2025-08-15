getwd()

setwd("/Users/mac/Desktop/AI_Omics_Internship_2025/Module_I"
)

# 1. Checking Cholesterol level
cholesterol_level <- 230
if(cholesterol_level > 240){
  print("High Cholesterol")
}

#2. Checking Blood Pressure Status
Systolic_bp <- 130
if( Systolic_bp < 120){
  print('Blood Pressure is normal')
} else {
  print('Blood Pressure is high')
}

#3. Automating Data Type Conversion with for loop
#A.Working on patient_info.csv
actual_data <- read.csv("patient_info.csv")
str(actual_data)
refine_data <- actual_data
factor_cols <- c("patient_id", "gender", "diagnosis", "smoker")
for( col_name in factor_cols){
  if(is.character(refine_data[[col_name]])){
    refine_data[[col_name]] <- as.factor(refine_data[[col_name]])
    
  }
}
str(refine_data)

#B. Working on Metadata.csv
raw_data <- read.csv("Metadata.csv")
str(actual_data)
clean_data <- raw_data
factor_cols1 <- c("name", "gender", "height")
for( col_name1 in factor_cols1){
  if(is.character(clean_data[[col_name1]])){
    clean_data[[col_name1]] <- as.factor(clean_data[[col_name1]])
    
  }
}
str(clean_data)


####can also use this alternative approach####
#refine_data <- actual_data
#factor_cols <- c("patient_id", "gender", "diagnosis", "smoker")

#for (i in match(factor_cols, names(refine_data))) {
 # if (is.character(refine_data[[i]])) {
    #refine_data[[i]] <- as.factor(refine_data[[i]])
 # }
#}

#4. Converting Factors to Numeric Codes
str(refine_data)
binary_col <- c("smoker")
for(colname2 in binary_col){
  refine_data[[colname2]] <- ifelse(refine_data[[colname2]] == "Yes", 1, 0)

}

#  Verification

str(refine_data)
str(actual_data)

