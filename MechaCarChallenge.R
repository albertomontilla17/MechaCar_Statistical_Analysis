# load the dplyr package
library(dplyr)


# DELIVERABLE 1
# import and read in the MechaCar_mpg file as a dataframe
mechaCar_mpg <- read.csv(file="MechaCar_mpg.csv")
head(mechaCar_mpg)

# perform linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCar_mpg)

# generate summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCar_mpg))



# DELIVERABLE 2
# import and read in the Suspension_Coil file as a dataframe
suspension_coil <- read.csv(file="Suspension_Coil.csv")
head(suspension_coil)

# create a total_summary df
total_summary <- suspension_coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# create a lot_summary df
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))




# DELIVERABLE 3
# t-test for all manufacturing lots
t.test(suspension_coil$PSI, mu=1500)

# subset for each manufacturing lot
lot1 <- subset(suspension_coil, Manufacturing_Lot == "Lot1", select=PSI)
lot2 <- subset(suspension_coil, Manufacturing_Lot == "Lot2", select=PSI)
lot3 <- subset(suspension_coil, Manufacturing_Lot == "Lot3", select=PSI)

# t-test for each manufacturing lot
t.test(lot1, mu=1500)
t.test(lot2, mu=1500)
t.test(lot3, mu=1500)
