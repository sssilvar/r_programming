# Categorical variables
# Sex vector
sex_vector <- c("Male", "Female", "Female", "Male", "Male")

# Convert sex_vector to a factor
factor_sex_vector <- factor(sex_vector)
factor_sex_vector

# Animals (Nominal Variable)
factor_animals_vector <- factor(c("Elephant", "Giraffe", "Donkey", "Horse"))
factor_animals_vector

# Temperature (Ordinal Variable)
factor_temperature_vector <- factor(c("High", "Low", "High","Low", "Medium"),
                                    order=TRUE, 
                                    levels=c("Low", "Medium", "High"))
factor_temperature_vector



# FACTOR LEVELS
# Code to build factor_survey_vector
survey_vector <- c("M", "F", "F", "M", "M")
factor_survey_vector <- factor(survey_vector)

# Specify the levels of factor_survey_vector
levels(factor_survey_vector) <- c("Female", "Male")
factor_survey_vector

# Generate summary for survey_vector and factor_survey_vector
summary(survey_vector)
summary(factor_survey_vector)



# Ordinal variables processing
# Create speed_vector and convert it into a factor
speed_vector <- c("medium", "slow", "slow", "medium", "fast")
factor_speed_vector <- factor(speed_vector, ordered=TRUE, levels=c("slow", "medium", "fast"))
factor_speed_vector
summary(factor_speed_vector)