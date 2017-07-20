## Set the directory to where the files exist

setwd("D:/Users/tsoiwa/datasciencecoursera")

rankall <- function(outcome, num = "best"){

## read outcome data and assign it to rdata vector

    read_data <- read.csv("outcome-of-care-measures.csv")
    
## set out the possible outcome
    
    poss_outcome <- c("heart attack","heart failure","pneumonia")
     
## check outcome is valid
    
    if (!outcome %in% poss_outcome){
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
        

    read_data[,outcome] <- suppressWarnings(as.numeric(levels(read_data[,outcome])[read_data[,outcome]]))
    read_data[ ,2] <- as.character(read_data[ ,2])

## generate an empty vector to be filled for final output
    
    output <- vector()
    
    states <- levels(read_data[, 7])
    
    for (i in 1:length(states)){
        statedata <- read_data[grep(states[i],read_data$State),]
        orderdata <- statedata[order(statedata[,outcome],statedata[,2],na.last=NA),]
    
        hospital <- if(num == "best"){
            orderdata[1,2]}

            else if(num == "worst"){
                orderdata[nrow(orderdata),2]}
                
            else{
                orderdata[num,2]}
        
        output <- append(output,c(hospital,states[i]))
        
        }    


## return a data frame with hospital names and states abbreviation

    output <- as.data.frame(matrix(output, length(states), 2, byrow=TRUE))

    colnames(output) <- c("hospital","states")

    rownames(output) <- states

    output

}
    
