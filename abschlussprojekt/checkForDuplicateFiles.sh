#!/bin/bash

# Check if param exists
if [ -z $1 ] || [ $# != 1 ]; then
  echo "Checks for Duplicate files in a folder:"
  echo "script.sh directory/"
  exit
fi

# Check if param is directory
if [ ! -d $1 ]; then
  echo "$1 is not a directory."
  exit
fi

# remove last slash, because it looks better in output
directory=${1%/}

# Define Map, since not available in bash < 4
map=()

function getMapEntry () {
    for value in "${map[@]}"; do
        # split entries again
        IFS=':' read -r -a entry <<< "$value"

        # check if map key is equal to param
        if [ "${entry[0]}" = "$1" ]; then
            echo "${entry[1]}"
        fi
    done
}

function setMapEntry () {
    # set map entry as value delimited by colon (not allowed in mac filenames)
    # because nested arrays dont work
    map+=("$1:$2")
}

# find duplicate files
find -L $directory | while read file; do
    # If file is a directory continue
    if [ -d $file ]; then
        continue
    fi

    # get hash
    hash=$(md5 -q $file)
    # get possibly existing file
    existingEntry=$(getMapEntry $hash)

    if [ -z $existingEntry ]; then
        # if no existing file, enter hash + name into map  
        setMapEntry $hash $file
    else
        # print message for duplicate
        echo "$existingEntry is a duplicate of $file"
    fi
done

