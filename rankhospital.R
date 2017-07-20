## Set the directory to where the files exist

setwd("D:/Users/tsoiwa/datasciencecoursera")

rankhospital <- function(state, outcome, num = "best"){

## read outcome data and assign it to rdata vector

    read_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
## set out the possible outcome
    
    poss_outcome <- c("heart attack","heart failure","pneumonia")
     
## check if state and outcome are valid
    
    if (!state %in% read_data$State){
        
        stop(print("Invalid state"))
        }
    
        
        else if (!outcome %in% poss_outcome){
            stop(print("Invalid outcome"))
        }

## setting the correct data depending on the outcome
    
    if (outcome == "heart attack"){
        outcome = 11
    }
        
        else if (outcome == "heart failure"){ 
        outcome = 17
        }
    
        else {
        outcome = 23
        }
        
## Return hospital name according to ranking
    
    print_data <- subset(read_data, State == state)
    
    print_data [,outcome] <- as.numeric(print_data[,outcome])
    
    print_data <- print_data[(!is.na(print_data[,outcome])),]
    
    print_data <- print_data[order(print_data[,outcome],print_data[,2]),]
    
    if (num == "best"){
        num <- 1
    }
    
    else if (num == "worst"){
        num <- nrow(print_data)
    }
    return(print_data[num,2])
}
