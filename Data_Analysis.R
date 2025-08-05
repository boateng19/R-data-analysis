getwd()
#creating folders
dir.create("raw_data")
dir.create("clean_data")
dir.create('script')
dir.create("results")
dir.create("plot")

# load and clean  patient_info.csv

# Import Data from CSV

data <- read.csv("patient_info.csv")

# View data in spreadsheet format
View(data)

# Check structure of the dataset
str(data)

# Convert 'gender' to factor
data$gender_fac <- as.factor(data$gender)
str(data)

# Convert factor to numeric using ifelse statement (Female = 1, Male = 0)
data$gender_num <- ifelse(data$gender_fac == "Female", 1, 0)
str(data$gender_num)

# Convert numeric gender code to factor
data$gender_num <- as.factor(data$gender_num)
class(data$gender_num)

#convert diagnosis to factor
data$diagnosis_fac <- as.factor(data$diagnosis)
str(data$diagnosis_fac)

#change level, Normal, Cancer
data$diagnosis_fac <- factor(data$diagnosis_fac,
                             levels = c("Normal", "Cancer"))
levels(data$diagnosis_fac)

data$diagnosis_fac

## Creating a new variable for smoking status as a binary factor:

# 1 for "Yes", 0 for "No"
data$smoker_fac <- as.factor(data$smoker)
data$smoker_num <- ifelse(data$smoker_fac == "Yes", 1, 0)

#Save the cleaned dataset in your clean_data folder with the name patient_info_clean.csv
write.csv(data, file = "clean_data/patient_info_clean.csv")

# saving the workspace
save.image(file = "class_Ib.RData")
