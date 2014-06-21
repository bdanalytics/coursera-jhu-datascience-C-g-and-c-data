# Course Project for Getting & Cleaning Data Coursera Course
# Create tidy dataset from Samsung UCI HAR data files
rm(list = ls())

# Read feature names
system("ls -alrtF")
features_Df <- read.table("./features.txt", header=FALSE)
head(features_Df)
summary(features_Df)

## Features such as fBodyAcc-bandsEnergy()-1,8;1,16;1,24 are repeated
## Concatenate Feature name with number to make Name.Nbr unique
names(features_Df) <- c("Nbr", "Name")
features_Df$Name.Nbr <- paste("X", features_Df$Name, features_Df$Nbr, sep=".")
features_Df[grep("fBodyAcc-bandsEnergy()", features_Df$Name.Nbr), ]

# Read activity labels
activity_Df <- read.table("./activity_labels.txt", header=FALSE)
names(activity_Df) <- c("Activity.Nbr", "Activity")
head(activity_Df)
summary(activity_Df)

# Read train & test data files
read_file <- function(entity_name, file_type, col_names) {
    file_name <- paste("./", entity_name, "/", file_type, "_", entity_name
                       , ".txt", sep="")
    message("    reading file '", file_name, "'...")
    print(  "    sample records:")
    system(paste("head ", file_name, sep=""))
    file_type_Df <- read.table(file_name, header=FALSE)
    names(file_type_Df) <- col_names
    print(  "    sample obs:")
    print(head(file_type_Df))
    print(  "    Df summary:")
    print(summary(file_type_Df))
    return(file_type_Df)
}

read_data <- function(entity_name) {
    message("reading files for ", entity_name, " data...")
    #system(paste("ls -alrtF", entity_name, sep=" "))
    
    entity_subject_Df <- read_file(entity_name, "subject", "subject.nbr")
    entity_y_Df <- read_file(entity_name, "y", "y.activity.nbr")
    entity_X_Df <- read_file(entity_name, "X", features_Df$Name.Nbr)
    entity_Df <- cbind(entity_subject_Df, entity_y_Df, entity_X_Df)       
    return (entity_Df)
}

train_Df <- read_data("train")
test_Df <- read_data("test")
train_test_Df <- rbind(train_Df, test_Df)

# Extract only mean & std vars
subset_tn_tt_Df <- train_test_Df[,c("subject.nbr", "y.activity.nbr"
                                    , features_Df[grep("-mean|-std"
                                                       , features_Df$Name.Nbr)
                                                  , "Name.Nbr"])]

# Merge Activity labels
intersect(names(subset_tn_tt_Df), names(activity_Df))
actlbl_stt_Df <- merge(subset_tn_tt_Df, activity_Df
                       , by.x="y.activity.nbr", by.y="Activity.Nbr")

# Rename vars with descriptive names
orig_col_names <- names(actlbl_stt_Df)
desc_col_names <- orig_col_names
desc_col_names[1] <- "Activity.nbr"
desc_col_names[2] <- "Subject.nbr"
desc_col_names <- gsub("X.t", "t", desc_col_names)
desc_col_names <- gsub("X.f", "f", desc_col_names)

## Get rid of suffix beginning with "." but only if followed by a number
## Consequence of unique(fying) feature names earlier
extract_prefix <- function(str) {
    str_chrs <- strsplit(str, '')
    dot_pos <- sapply(str_chrs, function(x) which(x == '.'))
    #sprintf("str='%s'", str)
    #sprintf("str='%s'; dot_pos=%d", str, dot_pos)
    if (class(dot_pos) == "list") {dot_pos <- 0}    # Unsure why this happens
    if ((dot_pos > 0) &
        (str_chrs[[1]][dot_pos+1] >= "0") & 
        (str_chrs[[1]][dot_pos+1] <= "9")) { 
            return(paste0(str_chrs[[1]][1:dot_pos-1], collapse=""))
        }
    else {return(str)}
}
des2_col_names <- sapply(desc_col_names, extract_prefix)
names(des2_col_names) <- NULL # Easier to read in console
des3_col_names <- gsub("\\(\\)", "", des2_col_names)
des3_col_names <- gsub("-", ".", des3_col_names)

## Ensure no dup variable names; length shd be == 82
if (length(table(des3_col_names)) != 82) {
    message("possible dups in descriptive variable names")
    print(des3_col_names)
    stop("assertion error; stopping")
}
names(actlbl_stt_Df) <- des3_col_names

# Create tidy data set of means of all vars by subject & by activity
tidy_Df <- aggregate(subset(actlbl_stt_Df
                            , select=-c(subject.nbr, Activity, Activity.nbr))
                    , list(Subject = actlbl_stt_Df$subject.nbr
                    , Activity = actlbl_stt_Df$Activity), mean)
write.table(tidy_Df, "UCIHAR_tidy.txt", row.names=FALSE)