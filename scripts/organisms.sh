#!/bin/bash

# Define input and output file names
input_file="sequence_headers.txt"
output_file="organisms.txt"

# Extract organisms from sequence headers and remove duplicates
organisms=$(grep -oP '\b[A-Z][a-z]+ [a-z]+ [a-z]+\b' "$input_file" | sort | uniq)

# Save unique organisms to the output file
echo "$organisms" > "$output_file"
#count the number of organisms in the output file
total_organisms=$(echo "$organisms" | wc -l)
echo "The total number of unique organisms is: $total_organisms" >> "$output_file"
echo "The total number of orgganisms in the $output_file is: $total_organisms" 
echo "Unique organisms saved to $output_file"

