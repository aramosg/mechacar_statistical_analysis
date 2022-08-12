# Import libraries
library( tidyverse )
library( dplyr )

###########################
# Deliverable 1 - Linear Regression for MPG Prediction

# Importing MechaCar data
MechaCar_mpg <- read.csv( file='MechaCar_mpg.csv', check.names=F, stringsAsFactors = F )

# Linear regression
lm( mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, MechaCar_mpg )

# Summary to determine p-value and r-squared
summary( lm( mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, MechaCar_mpg ) )


###########################
# Deliverable 2 - Summary Statistic on Suspension Coils

# Import suspension_coil data
Suspension_Coil <- read.csv( file='Suspension_Coil.csv', check.names=F, stringsAsFactors = F )

#Total summary
total_summary <- Suspension_Coil %>% summarize( Mean=mean( PSI ), Median=median( PSI ), Variance=var( PSI ), STDEV=sd( PSI ) )

# Create the lot summary dataframe
lot_summary <- Suspension_Coil %>% group_by( Manufacturing_Lot ) %>% summarize( Mean=mean( PSI ), Median=median( PSI ), Variance=var( PSI ), STDEV=sd( PSI ), .groups = 'keep' )


###########################
# Deliverable 3 - T-Test on Suspension Coils

# Perform t-test to determine if manufacturing lots are different from pop mean
t.test( Suspension_Coil$PSI, mu=1500 )

# Perform t-test to determine if individual lots are statistical different from  pop mean

# Lot 1
t.test( subset( Suspension_Coil, Manufacturing_Lot == "Lot1" ) $PSI, mu= 1500 )

# Lot 2
t.test( subset( Suspension_Coil, Manufacturing_Lot == "Lot2" ) $PSI, mu= 1500 )

# Lot 3
t.test( subset( Suspension_Coil, Manufacturing_Lot == "Lot3" ) $PSI, mu= 1500 )

