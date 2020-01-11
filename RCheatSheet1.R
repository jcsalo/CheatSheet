## Setup
library(survival) ## load 'survival' package

# Limit printing for sake of brevity using options
options(max.print=20)

## Getting Help
?mean  # Get help in a particular function

## File Navigation

getwd() # Show working directory

#setwd('H://file/path') # Set working directory

# R Studio: Create a project by pointing to an existing directory of scripts


## load stored dataset 
data(cancer) # load the dataset 'cancer' (from the 'survival' package)


## Explore dataset
colnames(cancer) # snows names of colums
summary(cancer$age) # shows summary of the contents of a given column
median(cancer$age,na.rm=TRUE) # Need to remove any NA values
str(cancer) # shows the structure of the object (dataframe).
str(cancer$age) # show structure of the object (column in dataframe)



## Counting observations

nrow(cancer) #count number of rows in dataframe

length(cancer) # count number of columns in dataframe
ncol(cancer)  # count number of columns in dataframe

cancer$sex==1 # Generate Boolean vector showing which observations satisfy the criteria

sum(cancer$sex==1) # Count number of observations which satisfy condition. 

sum(cancer$sex==1)/length(cancer$sex) #  Calculate proportions

## Detecting and counting NA observations

sum(is.na(cancer$wt.loss)) #count number of rows with NA for a given column

length(na.omit(cancer$wt.loss)) #count number of rows not NA for a given column
sum(!is.na(cancer$wt.loss)) 

complete.cases(cancer)   # Boolean showing rows with no NA values
sum(complete.cases(cancer))  # count how many rows have no NA values

nrow(na.omit(cancer))  # Alternate method of counting complete cases (rows with no NA)


## Subset dataframe

# Select rows:
cancer[1:10,]  # select first ten rows (and all columns)


# Select columns
cancer[,2] # selects all rows and only column 2
cancer[,"sex"]  #  selects all rows and only the colum labeled "sex"
cancer[3,]  #selects all columns of the third row of the dataframe


# Select rows and columns
cancer[1:5,c(1,3,4,5)] # Select first 5 rows and columns 1,3,4,5
cancer[1:5,c("age","sex","ph.karno")] # Select first 5 rows and columns age, sex, ph.karno

# Select cell
cancer[4,5]

# Create subset with bracket notation
cancer10<-cancer[1:10,] # create a new dataframe of first 10 rows

# Create subset with subset()
cancer.mecog1 <-subset(cancer,ph.ecog==1 & sex ==1 ) 
table(cancer.mecog1$sex,cancer.mecog1$ph.ecog,dnn=c("Gender","ECOG PS"))


## Descriptive Statistics

median(cancer$wt.loss) # Fails due to NA values
median(na.omit(cancer$wt.loss)) # elimminates NA values
median(cancer$wt.loss,na.rm=TRUE) # Removes NA values

## Factors

cancer$sex_F<-factor(cancer$sex, levels = c(1,2), labels=c("Male","Female"))
class(cancer$sex)
class(cancer$sex_F)

cancer$ph.karno_F<-factor(cancer$ph.karno)

table(cancer$sex_F,cancer$ph.karno_F,dnn=c("Gender","Physician Karnofsky Scale"))
cancer.karno7090 <-cancer[cancer$ph.karno_F %in% c(70,80,90),]
table(cancer.karno7090$sex_F,cancer.karno7090$ph.karno_F,dnn=c("Gender","Physician Karnofsky Scale"))
droplevels.data.frame(cancer.karno7090)
droplevels.factor(cancer.karno7090$ph.karno_F)
table(cancer.karno7090$sex_F,cancer.karno7090$ph.karno_F,dnn=c("Gender","Physician Karnofsky Scale"))


#Cut to transform continuous variable to categorical
cancer$agegroup_R<-cut(cancer$age, c(0,25,50,75,110))
str(cancer$agegroup_R)

#Recoding using ifelse
cancer$age_over_65 <- ifelse (cancer$age %in% c(65:100), "Over65", "Under65")

#Recoding using bracket notation
cancer$age_over_75 <- 0
cancer$age_over_75[cancer$age >75]<-1

cancer$agegroup_R<-droplevels.factor(cancer$agegroup_R)





## Slice dataframe into vectors
#Bracket notation slices a dataframe [rows,colums]

cancer.femalekarno70 <-cancer[cancer$ph.karno %in% c(70) & cancer$sex ==2,]
print (cancer.femalekarno70[,c("sex","ph.ecog")], row.names=FALSE)
# Supress printing of row names.




#Add a line
