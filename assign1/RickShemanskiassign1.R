## Rick Shemanski
## Econ 294 R lab
## Winter 2016

library("foreign", lib.loc="C:/Program Files/R/R-3.2.3/library")


first <- "Rick"
last <- "Shemanski"

student_id <- 1504018

print(paste( first, last, student_id))


########################
##loading in diff sources of data

df.dta <- read.dta("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_dta.dta")

df.csv <- read.csv("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_CSV.csv")

df.td<-read.table("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007")

load(url("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_RData.RData"))

print("The name of this data set is NHIS_2007_RData")

#######################################################
## 2 size of data sets

size.dta <- ("The .dta file is 193 KB")
size.csv <- ("The .csv file is 142 KB")
size.txt <- ("The .txt file is also 142 KB")
size.rdata <- ("The RData file is 46 KB")

print(paste(size.dta, size.csv,size.txt, size.rdata))

print("The smallest data data frame is the R Data set. The variability in size is due to
      the composition of the data frames. Comma Seperated, or Txt files both include spaces and 
      other characters in order to indicate where observations start and end. R does not have these
      and therefore it is smaller in size")

##################################################
####3
class(NHIS_2007_RData)
typeof(NHIS_2007_RData)

print("The class of the R data is a data frame, and the type is a list")

length <- length(NHIS_2007_RData)
dimen <- dim(NHIS_2007_RData)
nromws <- nrow(NHIS_2007_RData)
ncols <- ncol(NHIS_2007_RData)
summary(NHIS_2007_RData)

summary(NHIS_2007_RData)

print("The length of the data is 9, the dimensions are 4785 x 9, the number
      of rows are 4785, the number of columns are 9, and the information below
      summarizes the data.
      
      HHX             FMX             FPX             SEX       
      Min.   :   16   Min.   :1.000   Min.   :1.000   Min.   :1.000  
      1st Qu.:13404   1st Qu.:1.000   1st Qu.:1.000   1st Qu.:1.000  
      Median :27527   Median :1.000   Median :1.000   Median :2.000  
      Mean   :27009   Mean   :1.019   Mean   :1.359   Mean   :1.549  
      3rd Qu.:40192   3rd Qu.:1.000   3rd Qu.:2.000   3rd Qu.:2.000  
      Max.   :53955   Max.   :6.000   Max.   :8.000   Max.   :2.000  
      BMI            SLEEP             educ           height     
      Min.   :12.91   Min.   : 3.000   Min.   : 0.00   Min.   :59.00  
      1st Qu.:23.63   1st Qu.: 6.000   1st Qu.:12.00   1st Qu.:64.00  
      Median :26.97   Median : 7.000   Median :13.00   Median :67.00  
      Mean   :31.73   Mean   : 9.507   Mean   :14.25   Mean   :69.58  
      3rd Qu.:31.51   3rd Qu.: 8.000   3rd Qu.:16.00   3rd Qu.:71.00  
      Max.   :99.99   Max.   :99.000   Max.   :99.00   Max.   :99.00  
      weight     
      Min.   :100.0  
      1st Qu.:149.0  
      Median :175.0  
      Mean   :266.2  
      3rd Qu.:215.0  
      Max.   :999.0  ")

#####################################################
#####4

df <- read.dta("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/org_example.dta")
str(df)

print("In the data fram df there are 1119754 obervations, and 30 different variables.")

summary(df$rw)
print(" variable rw:
      min - 1.8     mean - 19.8    median - 15.9   max- 354.8 
      first quartile value = 10.7
      thrid quartile value = 24.4")
################################################################
####5

v<-c(1,2,3,4,5,6,7,4,NULL,NA)
length(v)

print("There is a difference because the word NULL is not considered a value")

mean(v,na.rm = TRUE)
print("After excluding the NA value in the mean calculation, the mean is 4")

#############################################
####6


x<-matrix(c(1,2,3,4,5,6,7,8,9),ncol=3,byrow=TRUE)

##transpose x and set up egen of x??
t(x)
eign<-eigen(x)

###find egen values and vectors
eign$vec
eign$val


y<-matrix(c(1,2,3,3,2,1,2,3,0),ncol=3,byrow=TRUE)
# y inverse
yin <- solve(y)
## y mult y inverse
y%*%yin

print("The product of y and y inverse is an identity matrix")

#########################################################
###7


carat<-c(5,2,0.5,1.5,5,NA,3)
cut<-c("fair","good","very good","good","fair","Ideal","fair")
clarity<-c("SI1","I1","VI1","VS1","IF","VVS2",NA)
price<-c(850,450,450,NA,750,980,420)

diamonds <-data.frame(carat,cut,clarity,price)
mean(diamonds$price,na.rm=TRUE)

print("The mean of price is 650")

#mean(diamonds$price & diamonds$cut == "fair" ,na.rm=TRUE)


fair<- subset(diamonds, cut == "fair")
mean(fair$price, na.rm=TRUE)

print("The mean price of fair cut diamonds is 673.3333")
#good very good ideal= GVGI
GVGI<-subset(diamonds, cut!= "fair")
mean(GVGI$price, na.rm=TRUE)

print("The mean price of the good, very good and ideal cuts is 626.66")

Carat.2 <-subset(diamonds, carat >2& cut=="Ideal"|carat >2& cut == "very good")
median(Carat.2$price, na.rm=TRUE)

print("There are no ideal or very good diamonds that are greater than 2 carats, so there is no median")
