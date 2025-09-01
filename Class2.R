# Assignment 2: Differential Gene Expression Classification
# --------------------------------------------------------
getwd()
setwd( "/Users/mac/Desktop/AI_Omics_Internship_2025/Module_I/")

# Define input and output folders
input_dir <- "raw_data" 
output_dir <- "results"

classify_gene <- function(logFC, padj) {
  ifelse(logFC > 1 & padj < 0.05, "Upregulated",
         ifelse(logFC < -1 & padj < 0.05, "Downregulated", "Not significant"))
}

# 2. Create a Results folder if it does not exist
if (!dir.exists("results")) {
  dir.create("results")
}

# 3. List datasets to process
files_to_process <- c("DEGs_data_1.csv", "DEGs_data_2.csv")

# 4. Loop through datasets
for (file_names in files_to_process) {
    cat("\nProcessing:", file_names, "\n")
    
    input_file_path <- file.path(input_dir, file_names)
    
    # Import dataset
    data <- read.csv(input_file_path, header = TRUE)
    cat("File imported. Checking for missing values...\n")
  
    # Replace missing padj values with 1
    data$padj[is.na(data$padj)] <- 1
    
    #Apply classify_gene() to each row safely
    data$status <- classify_gene(data$logFC, data$padj )
    cat("classify_gene has been caculated./n")
  
  # Save processed file into Results folder
  out_file <- paste0("results/processed_", file_names)
  write.csv(data, out_file, row.names = FALSE)
  cat("Result saved to:", out_file)
  
  # Print summary counts
  cat("\nSummary for", file_names, ":\n")
  print(table(data$status))
}

save.image(file = "Boateng_Agyekum_Class_2-Assignment.RData")
