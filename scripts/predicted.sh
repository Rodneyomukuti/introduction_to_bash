#!/bin/bash

# Define input and output file names
input_file="sequence_headers.txt"
output_file="organisms.txt"

# Extract organisms from sequence headers and remove duplicates
organisms=$(grep -oP '\b[A-Z][a-z]+ [a-z]+ [a-z]+\b' "$input_file" | sort | uniq)

# Count the total number of unique organisms
total_organisms=$(echo "$organisms" | wc -l)

# Count the number of predicted organisms
predicted_organisms=$(grep -c "PREDICTED" "$input_file")

# Save unique organisms to the output file
echo "$organisms" > "$output_file"

echo "Total number of unique organisms: $total_organisms"
echo "Number of predicted organisms: $predicted_organisms"
echo "Unique organisms saved to $output_file"

