#!/bin/bash

# This script demonstrates a solution to the race condition bug using locks.

# Create two files
touch file1.txt
touch file2.txt

# Use flock to ensure exclusive access to each file
flock -n 1 file1.txt; echo "Process 1" > file1.txt; flock -u 1 file1.txt &
flock -n 1 file2.txt; echo "Process 2" > file2.txt; flock -u 1 file2.txt &

# Wait for both processes to finish
wait

# Print the contents of the files
cat file1.txt
cat file2.txt