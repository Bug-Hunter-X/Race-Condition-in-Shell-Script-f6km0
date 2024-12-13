#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Run two processes simultaneously, each trying to write to the files
(echo "Process 1" > file1.txt &) 
(echo "Process 2" > file2.txt &) 

# Wait for both processes to finish
wait

# Print the contents of the files
cat file1.txt
cat file2.txt