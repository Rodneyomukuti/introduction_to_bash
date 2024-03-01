#!/bin/bash

# Define input file name
input_file="combined_data.fa"

# Count the total number of nucleotides (excluding header lines)
total_nucleotides=$(grep -v "^>" "$input_file" | tr -d '\n' | wc -c)

# Count the occurrences of each base (excluding header lines)
A_count=$(grep -v "^>" "$input_file" | tr -d '\n' | grep -o 'A' | wc -l)
C_count=$(grep -v "^>" "$input_file" | tr -d '\n' | grep -o 'C' | wc -l)
G_count=$(grep -v "^>" "$input_file" | tr -d '\n' | grep -o 'G' | wc -l)
T_count=$(grep -v "^>" "$input_file" | tr -d '\n' | grep -o 'T' | wc -l)

# Save results to a final output file
echo "Total number of nucleotides: $total_nucleotides" > nucleotide_counts.txt
echo "A: $A_count" >> nucleotide_counts.txt
echo "C: $C_count" >> nucleotide_counts.txt
echo "G: $G_count" >> nucleotide_counts.txt
echo "T: $T_count" >> nucleotide_counts.txt
echo "Nucleotide counts saved to nucleotide_counts.txt"

