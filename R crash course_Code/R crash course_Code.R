# "Análise de dados longitudinais: Parte I - Breve introdução ao R"
# author: "Tiago Ferreira"

print("Olá!")


# Sessão de trabalho no R
getwd()
setwd("C:/Users/tiago/Desktop")

choose.dir()

# Operadores e objetos 
x1 <- 10 # assigns number 10 to object "x1"
x1 # display object "x1""
x2 <- 0:10  # assigns integers from 0 to 20 to object "x2" 
x2
x3 <- c(5, 4, 1, 6, 7, 2, 2, 3, 2, 8)  # using concatenate to create a numeric vector 
x3

## Operadores aritméticos    
x1 <- 2 + 2 #	addition
x2 <- 6 - 2 #	subtraction
x3 <- x1 * x2 #	multiplication
x4 <- x3 /	8 # division
x5 <- x2^x4 # exponentiation; OR 6**2
print(c(x1, x2, x3, x4, x5))

## Operadores relacionais (ou lógicos)  
x1 < 5 # smaller than 
x1 <= x5 # smaller or equal than
x1 >= x2 # larger or equal than
x1 == x1	# exactly equal to
x1 != x5 # not equal to

## Operadores booleanos  
x1 | x3 == 4 #	x1 OR x3
x1 & x3 <= 16	# x1 AND x3

## Gestão de objetos
ls()  #  return the names of the objects in the specified environment
save.image("myfile") # saves the workspace to myfile (def. = .RData)
save(objectlist, file = "myfile.RData") # saves a list of objects to a file
rm(x1)  # remove "x1" from the environment
rm(list = ls())  # using ls() in the argument "list" will 
                 # remove all objects from the environment

rm(list=ls())


## Limpar consola
cat("\014") # cleans console 
# OR 
shell("cls") # shell("clear") if Linux or Mac.
# OR shortcut Ctrl + l

## Ajuda  
help.start() # general help

help("rm") # help on the function "rm" (quotation marks are optional) | OR 

?mean
help.search("ls") # searches the help system using the keyword "ls" | OR ??ls


# Estruturas de dados
## Estruturas de dados no R
id <- c(1:5)
sex <- c("Male", "Male", "Female", "Male", "Female")
class(sex)

name <- c("Ana", "Manuel", "Afonso", "Maria") # character vector
name

t0_date <- as.Date(c("2017-11-2",'2017-11-4','2017-11-5','2017-11-10','2017-11-11'))

ruser <- c(TRUE, FALSE, FALSE, TRUE) 
class(ruser)
class(name)

length(ruser)

t0_beh_prob <- c(11, 14, 5, 20, 16)
intervention <- c(TRUE, TRUE, FALSE, TRUE, FALSE)
t1_date <- as.Date(c('2018-11-1','2018-11-3','2018-11-4','2018-11-10','2018-11-11'))
t1_beh_prob <- c(8, 11, 7, 15, 16)

data_beh <- data.frame(id, sex, t0_date, t0_beh_prob, intervention, t1_date, t1_beh_prob)
  
## Estruturas de dados - Vetores  
id <- 1:4 # sequential numerical vector 
id
age <-  c(20, 24, 21, 40) # non-sequential numerical vector
class(age) # returns object class
name <- c("Ana", "Manuel", "Afonso", "Maria") # character vector
name
class(name)
length(name) # returns object lenght
ruser <- c(TRUE, FALSE, FALSE, TRUE) # logical vector
ruser
class(ruser)
table(ruser)
rbaseskills <- c(40, 35, 20, 60) # previous skills in R using a scale from 1 to 100
rmotivation <- c(60, 90, 10, 50) # motivation in a scale from 1 to 100






rbaseskills[2] # returns vector's 2nd value

ruser
rbaseskills[ruser] # returns vector's 2nd and 3rd values



des <- c(100, 102, 90, 50)



rbaseskills > rmotivation # logical operations
rbaseskills + 1 # arithmetic operations
rbaseskills + rmotivation # arithmetic operations



## Estruturas de dados - Matrizes  
dailyuse <- rnorm(20, mean = 2, sd = .5) # Creates a vector with 20 elements
dailyuse <- round(dailyuse, 0) # rounds the vector to 0 decimals
dailyuse
class(dailyuse)
dailyuse <- matrix(dailyuse,  nrow = 4, ncol = 5, dimnames = list(NULL, 
                                                                  c("day1", "day2", "day3", "day4", "day5")))
dailyuse
class(dailyuse)
dailyuse[c(1:3), 2]  # select rows from 1 to 3 and columns 2
dailyuse[c(1, 4), ] # leaving column field blank will select entire columns
dailyuse[ -2:-3, -1] # select all rows 2 and 3 and columns 1

a <- "one" # Creates a character vector
b <- 1 # Creates a numeric vector
c <- 1L # Creates a numeric (integer) vector
d <- TRUE # Creates a logical vector
print(c(a, class(a)))
print(c(b, class(b)))
print(c(c, class(c)))
print(c(d, class(d)))


## Classes de objetos e coerção (cont.)   
a <- c(1.4, "apple", 1, 6.3, "fig", 2, TRUE) 
b <- c("apple", TRUE, FALSE, "pear", "orange", "blueberry")
c <- c(TRUE, 1, 0, TRUE, 0, FALSE)
a <- c(TRUE, FALSE, FALSE, TRUE, TRUE, FALSE)
class(a)
b <- as.numeric(a)
class(b)
c <- as.character(b)
class(c)

## Estruturas de dados - Bases de dados   
df  <-  data.frame(id, name, ruser, rbaseskills, rmotivation, dailyuse) 
df

data() # lists all available datasets
browseURL("http://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html") 
# informations about available datasets
?mtcars # diplays information about cars dataset
data(mtcars)  # loading a dataset

dim(mtcars)
names(mtcars)
ncol(mtcars)
nrow(mtcars)

str(mtcars)

mtcars # displays a dataset
head(mtcars,2)

mtcars[1:3, 1]

mtcars$mpg


sample(1:nrow(mtcars), 2)
mtcars[sample(1:nrow(mtcars), 2), ]



formals(read.table) # the list of function's arguments
?read.table
?formals



getwd

choose.files()

bechdel <-
  read.table(
    "G:\\My Drive\\FPCEUP\\R trainning\\GitRepo\\R crash course\\R_crash_course\\R crash course_Data\\bechdel.csv",
    header = TRUE,
    sep = ";",
    quote = "\"", 
    dec = ".",
    na.strings = " ",
    stringsAsFactors = FALSE,
    colClasses =  c("numeric", "character", "numeric", "factor", "numeric", "numeric", "numeric"),
    fileEncoding="UTF-8-BOM"
  )

str(bechdel)

bechdel <-
  read.csv2(
    "G:\\My Drive\\FPCEUP\\R trainning\\GitRepo\\R crash course\\R_crash_course\\R crash course_Data\\bechdel.csv",
    fileEncoding="UTF-8-BOM")
head(bechdel, 2)
dim(bechdel)
names(bechdel)
summary(bechdel)


install.packages("foreign", "Hmisc")
install.packages



library(foreign)
library(Hmisc)
tail(ls("package:Hmisc"))
?read.spss

bechdel <- read.spss("G:\\My Drive\\FPCEUP\\R trainning\\GitRepo\\R crash course\\R_crash_course\\R crash course_Data\\bechdel.sav", 
                     to.data.frame = TRUE)

str(bechdel)
dim(bechdel)
bechdel[1234, ]

?spss.get

bechdel <- spss.get("G:\\My Drive\\FPCEUP\\R trainning\\GitRepo\\R crash course\\R_crash_course\\R crash course_Data\\bechdel.sav")


str(bechdel)
head(bechdel, 3)


# Funções integradas (built-in) para procedimentos estatísticos básicos

sample(1:10, 4)

a <- c(9, 2, 5, 4, 12, 7, 8, 11, 9, 3, 7, 4, 12, 5, 4, 10, 9, 6, 9, 4)
sum(a)
length(a)
sum(a)/length(a)
mean <- sum(a)/length(a)
mean(a) 

mean(a) # OR sum(a)/length(a)
(a-mean(a))^2
sum((a-mean(a))^2)
1/(length(a)-1)
1/(length(a)-1)*sum((a-mean(a))^2)
sqrt(1/(length(a)-1)*sum((a-mean(a))^2))
sd_user <- function(a) {
  sqrt(1/(length(a)-1)*sum((a-mean(a))^2))
}
sd_user(a)
sd(a)

## Funções Básicas - Sumário de dados
data(mtcars)
class(mtcars) # reports the data format
dim(mtcars) # reports data dimensions
names(mtcars) # view variable names
str(mtcars) # summarizes data structure

head(mtcars) # returns first observations
mtcars[2,] # returns line 2
mtcars[,1] # returns collumn 1
mtcars$mpg # extract column "mpg"
summary(mtcars[,1:8]) # summarize R objects
plot(mtcars$qsec) # plot 1/4 mile time
hist(mtcars$qsec) # histogram for 1/4 mile time
mean(mtcars$hp)
sd(mtcars$hp)
cor(mtcars[,c(4,6,7)])

## Fórmulas no R
names(mtcars)
model1 <- lm(qsec ~ hp, data = mtcars) # linear regression model
summary(model1)
plot(qsec ~ hp, data = mtcars)
abline(model1, lwd=2)
# calculate residuals and predicted values
res <- signif(residuals(model1), 5)
pre <- predict(model1)
# plot distances between points and the regression line
segments(mtcars$hp, mtcars$qsec, mtcars$hp, pre, col="darkred")

## Fórmulas no R (cont.)
### Estimação de um modelo de variância (ANOVA) -  regressão com VI dummy
model2 <- aov(mpg ~ as.factor(cyl), data=mtcars)  
summary(model2) 
model2$coefficients
# post-hoc test - which specific groups’s means (compared with each other) are different?
TukeyHSD(model2) 
plot(mpg ~ as.factor(cyl), data=mtcars)



# Alguns pacotes úteis 
# "Comprehensive R Archive Network" (CRAN) webpage
browseURL("http://cran.r-project.org/web/views/")
# available packages alphabetically ordered
browseURL("http://cran.stat.ucla.edu/web/packages/available_packages_by_name.html")
# web community dedicated to the dissemination of R packages
browseURL("http://crantastic.org/") 
# lists installed packages
library()  
# lists loaded packages
search()   
# check package version
packageVersion("psych") 
# package citation
citation("psych") 

## Instalar pacotes
# Download package
install.packages("ggplot2")  
?install.packages
# loading packages
library(Hmisc) 

help(package="Hmisc")

## O pacote *"data.table"*
install.packages("data.table")
help(package="data.table")
library(data.table)
?data.table::fread

bechdel <- fread("G:\\My Drive\\FPCEUP\\R trainning\\GitRepo\\R crash course\\R_crash_course\\R crash course-Data\\bechdel.csv")
names(bechdel)
head(bechdel,3)

## O pacote *"psych"*
install.packages("psych")
help(package="psych")
library(psych)
class(bechdel)
bechdel$movie_title <- as.character(bechdel$movie_title)
bechdel$bechdel_test_binary <- as.factor(bechdel$bechdel_test_binary)
sapply(bechdel, class)
names(bechdel)
psych::describe(bechdel[ ,c(3,5)], check=FALSE)

## O pacote *"psych"*
describeBy(bechdel[ ,5], group=bechdel[ ,4])
reliab <- psych::alpha(bechdel[ ,c(5, 6)]) # Consistência interna
reliab$total

correlations <- corr.test(bechdel[ ,c(3, 5:7)])
correlations$r
correlations$p
cor.plot(bechdel[ ,c(3, 5:7)])
