#!/bin/sh

# Check the input parameters
if [ "$#" -ne 2 ]; then
    echo "Illegal number of arguments"
    echo "expected: <writefile> <writestr>"
    exit 1
fi

WRITEFILE=$1
WRITESTR=$2

# create the file
if ! $(mkdir -p "$(dirname "$WRITEFILE")" && touch $WRITEFILE) ; then
   echo "The $WRITEFILE couldn't be created"
   exit 1
fi

# overwrite text in file
$(echo $WRITESTR > $WRITEFILE)

echo "success"
exit 0

