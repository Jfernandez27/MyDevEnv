#!/bin/bash

# Define the base directory
BASE_DIR="MyDevEnv/www"

# Check if the base directory exists
if [ ! -d "$BASE_DIR" ]; then
    echo "Directory $BASE_DIR does not exist."
    exit 1
fi

# Loop through each directory inside the base directory
for dir in "$BASE_DIR"/*; do
    if [ -d "$dir" ]; then
        echo "Entering directory $dir"
        cd "$dir"

        # Check if the directory is a git repository
        if [ -d ".git" ]; then
            echo "Pulling latest changes in $dir"
            git pull
        else
            echo "$dir is not a git repository."
        fi
    fi
done
