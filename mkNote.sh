# Source variables
. ~/.userVars.var

# Remove
echo $USERPATH
echo $NOTEPATH
echo $TIMESTAMP

# Instantate file handle and open vim 
vim $USERPATH/$NOTEPATH/$TIMESTAMP.txt
