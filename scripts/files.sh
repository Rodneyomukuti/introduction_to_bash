#!/bin/bash

# Define input and output file names
input_file="sequence_headers.txt"
output_file="files.txt"

# Count the number of mRNA sequences
mRNA_count=$(grep -c "mRNA" "$input_file")

# Extract other sequences apart from mRNA
other_sequences=$(grep -v "mRNA" "$input_file" | cut -d ":" -f2- | sort | uniq -c)

# Save the results to the output file
echo "Number of mRNA sequences: $mRNA_count" > "$output_file"
echo "" >> "$output_file"
echo "Other sequences:" >> "$output_file"
echo "$other_sequences" >> "$output_file"
echo "Output saved to $output_file"

