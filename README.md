# introduction_to_bash

This repo contains introduction to bash excercises 

## Exercise (Introduction to Linux)

**Instructions:** *For each of these questions, provide the commands you used: (prepare a markdown document)*
 
**Question 1. Create a project directory called Exercise. Which commands did you use?**

```
mkdir exercise
```

**Question 2. In the directory, create all the sub-directories you would need for a Bioinformatics Project**

```
cd excercise

mkdir {data,scripts,results}
```

**Question 3. With the provided dataset files, put them in the appropriate directories you created under your Bioinformatics Project**

```
mv /mnt/c/Users/ADMIN/Downloads/*.fa ./data

```

**Question 4. Extract the sequence headers and save into a file `sequence_names.txt` in the appropriate directory**

```
grep "^>" *.fa > sequence_headers.txt

```

**Question 5. Save the commands you used in question 4 in a script file `extract_seq.sh`**

```
# Create a script using nano
nano extract_seq.sh
```
```
# The actual script
#!/usr/bin/bash
# Create an output file
outfile="sequence_headers.txt"
for file in `./*.fa`
do
#Extract sequence headers from the current file and append to the output file
grep "^>" "$file" >> "$outfile"
echo "Headers have been successfully extracted from $file and saved to $outfile"
```
 
**Question 6. Count the number of mRNA.- What other sequences apart from mRNA?- For each category, how many are there?- Save the above output to files.txt**

```
#!/bin/bash

# Definition of input and output file names
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

```

**Question 7. How many organisms (create a file with the organisms without duplicates)**

```
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

```
**Question 8. How many are predicted?**

```
#!/bin/bash

# Define input and output file names
input_file="sequence_headers.txt"
output_file="predicted.txt"

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

```
**Question 9. How many nucleotides are in the file? How many of each of the bases are there**

```
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

```
