#!/bin/sh

# Check the input parameters
if [ "$#" -ne 2 ]; then
    echo "Illegal number of arguments"
    echo "expected: <filesdir> <searchstr>"
    exit 1
fi


FILESDIR=$1
SEARCHSTR=$2

if [ ! -d $FILESDIR ]; then
    echo "$FILESDIR does not represent a directory on the filesystem!"
    exit 1   
fi

FILESNO=$( ls $FILESDIR | wc -l )
MATCHINGLINES=$(grep -rnwl $FILESDIR -e $SEARCHSTR | wc -l)

echo "The number of files are $FILESNO and the number of matching lines are $MATCHINGLINES"

echo "success"
exit 0


