## Set the directory to where the files exist

setwd("D:/Users/tsoiwa/datasciencecoursera")

best <- function(state, outcome){

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
        
## Return hospital name in that state with lowest 30-day death
    
    print_data <- subset(read_data, State == state)
    
    min_rate <- which(as.numeric(print_data[,outcome]) == 
                min(as.numeric(print_data[,outcome]), na.rm = TRUE))
    
    hosp <- print_data[min_rate,2]
    
    sort(hosp)[1]
    
}
