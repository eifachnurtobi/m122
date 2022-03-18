#!/bin/bash

# Check if params correct
if [ -z $1 ] || [ -z $2 ] || [ $# != 2 ]; then
  echo "Dateien vergleichen:"
  echo "script.sh file1 file2"
  exit
fi

# Check if params are files
if [ ! -f $1 ]; then
  echo "$1 is not a file."
  exit
fi

if [ ! -f $2 ]; then
  echo "$2 is not a file."
  exit
fi 

# Get both files line by line
f1cat="$(cat $1)"
f1=(${f1cat[@]})
f2cat="$(cat $2)"
f2=(${f2cat[@]})

echo "Comparing $1 to $2"
echo

n=0
# Iterate until all lines of both files are read
while [[ $n -lt ${#f1[@]} ]] || [[ $n -lt ${#f2[@]} ]]; do
  ((n=n+1))
  # Get specific lines
  l1=${f1[n-1]}
  l2=${f2[n-1]}

  # If extra line in file2 print it
  if [[ $n -gt ${#f1[@]} ]]; then
    echo "Extra line ($n) in $2: $l2"
    continue
  fi

  # If extra line in file1 print it
  if [[ $n -gt ${#f2[@]} ]]; then
    echo "Extra line in $1: $l1"
    continue
  fi
  
  # Print difference if line exists in both files 
  # but is different 
  if [ $l1 != $l2 ]; then
    echo "Difference on line $n:"
    echo "$1: $l1"
    echo "$2: $l2"
  fi
done