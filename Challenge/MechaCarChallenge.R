# Libraries
library(dplyr)
library(tidyverse)

# Read in MechaCar dataset
mechaCar_df <- read.csv('Challenge/MechaCar_mpg.csv', check.names= F, stringsAsFactors = F)
mechaCar_df

# Calculate linear model for dataset
mecha_line <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCar_df)
summary(mecha_line)



# Reading in Suspension_Coil dataset
coil_df <- read.csv('Challenge/Suspension_Coil.csv', check.names = F, stringsAsFactors = F)

total_summary <- coil_df %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI)) # Create total_summary dataframe using the summarize function
total_summary

lot_summary <- coil_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI)) # Group each manufacturing lot by the mean, median, variance, and st.dv of the suspsion coil's PSI column.
lot_summary


# Use t.test() on PSI over all manufacturing lots
t.test(lot_summary$Mean, mu=1500)

# Test only lot 1
lot1_summary <- subset(coil_df, Manufacturing_Lot == 'Lot1')
t.test(lot1_summary$PSI, mu=1500)

# Test only lot 2
lot2_summary <- subset(coil_df, Manufacturing_Lot == 'Lot2')
t.test(lot2_summary$PSI, mu=1500)

# Test only lot 3
lot3_summary <- subset(coil_df, Manufacturing_Lot == 'Lot3')
t.test(lot3_summary$PSI, mu=1500)