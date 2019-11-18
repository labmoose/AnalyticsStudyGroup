# Create a list of all participants in the gift exchange; These will be the "Santas"
s <- c("Chris", "Carla", "Jim", "Pam", "Leslie", "Ben", "Mitch", "Cameron", "Louis", "Jessica", "Dwight", "Jeremy", "Ray", "Andy")
# Create a list of ID numbers 1 through 14 for each participant
ID <- c(1:14)
# Apply the names of the Santas from vector "s" to the vector of ID numbers "ID"
names(ID) <- s
s
# Create a vector "d" (draw) for the IDs of all partipants that aren't recipients in pre-fixed set: 
# ID 1 "Chris" has a gift for ID 2 "Carla", ID 2 will be removed from the random sampling.
d <- c(1, 3:14)
# Create a vector "so" (significant others) for the ID of which participants a Santa cannot buy for
so <- c(NA, 1, 4, 3, 6, 5, 8, 7, 10, 9, NA, NA, NA, NA)
# Create a vector "f" (frenemies) for the IDs of which participants a Santa will not buy for
f <- c(NA, NA, NA, NA, 12, NA, NA, NA, 13, NA, 3, NA, NA, NA)
# Create a dataframe "dfx" (exchange) to line up Santa IDs, SOs, and frenemies
dfx <- data.frame(ID, so, f)
dfx
# Create a vector "buyfor" for randomly sampled ID numbers to be placed in; Set the 1st result = 2 for Carla, as Chris is fixed to buy for Carla
buyfor <- c(2)
# Randomly sample the participant ID numbers without replacement from the "d" (draw) vector
sampled <- sample(d, 13, replace = FALSE)
# Add the sampled participants into the buyfor vector
buyfor <- c(buyfor, sampled)
# Add the buyfor vector to the dfx dataframe
dfx <- data.frame(dfx, buyfor)
# Print dataframe dfx to see all categories are present: ID Numbers (ID), SOs (so), Frenemies (f), and Buy For (buyfor)
dfx
# Use logical checks to look for disallowed matches (Buyfor ID # != ID, so, or f)
# Logical T/F test for buyfor ID & ID numbers, return a FALSE result for disallowed matches
testID <- c(buyfor != ID)
# Check the vector testID for FALSE (disallowed matches); Save result as new variable to use later (TID)
TID <- FALSE %in% testID
# Print the result of variable TID to check that this code is working
TID
# Logical T/F test for buyfor ID & SO ID numbers, return a FALSE result for disallowed matches
testso <- c(buyfor != so)
# Check the vector testso for FALSE (dissallowed matches); Save result as a new variable to use later (TSO)
TSO <- FALSE %in% testso
# Print the result of variable TSO to check that this code if working
TSO
# Logical T/F test for buyfor ID & frenemy ID numbers, return a FALSE result for disallowed matches
testf <- c(buyfor != f)
# Check the vector testf for FALSE (disallowed matches); Save result as new variable to use later (TF)
TF <- FALSE %in% testf
# Print the result of variable TSO to check that this code if working
TF
# If there are disallowed matches in the testing above, print message to signal where adjustments are required
if(TID == TRUE) {
  print("DISALLOWED MATCH- LIST REQUIRES ADJUSTMENT")
  dftest <- data.frame(ID, buyfor, buyfor != ID, buyfor !=so, buyfor !=f)
  dftest
} else if (TSO == TRUE){
  print("DISALLOWED MATCH- LIST REQUIRES ADJUSTMENT")
  dftest <- data.frame(ID, buyfor, buyfor != ID, buyfor !=so, buyfor !=f)
  dftest
} else if (TF == TRUE){
  print("DISALLOWED MATCH- LIST REQUIRES ADJUSTMENT")
  dftest <- data.frame(ID, buyfor, buyfor != ID, buyfor !=so, buyfor !=f)
  dftest
} else {
  # If all results = TRUE and all matches are allowed, then create a result dataframe:
  dffinal <- data.frame(ID, buyfor)
  # Print the finalized dataframe dffinal
  dffinal
}

