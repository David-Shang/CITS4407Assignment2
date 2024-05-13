#!/bin/bash

# file1_path=$1
# file2_path=$2
# file3_path=$3

file1_path="gdp-vs-happiness.tsv"
file2_path="homicide-rate-unodc.tsv"
file3_path="life-satisfaction-vs-life-expectancy.tsv"

output="output.tsv"

# Function to extract headers from all files and combine them
extract_and_combine_headers () {
    for file in "$@"; do
        # Extract the header of each file, combine, and remove duplicates
        head -n 1 "$file"
    done | tr '\t' '\n' | sort -u | tr '\n' '\t' | sed 's/\t$/\n/'
}

# # Function to join all files based on keys
# join_files () {
#     for file in "$@"; do
#         # Exclude header and sort by keys
#         tail -n+2 "$file"
#     done | sort -t $'\t' -k1,1 -k2,2 -k3,3 | awk -F '\t' '{
#         key = $1 FS $2 FS $3
#         val = substr($0, length(key) + 2)
#         if (key in lines) {
#             lines[key] = lines[key] FS val
#         } else {
#             lines[key] = val
#         }
#     } END {
#         for (key in lines) {
#             print key FS lines[key]
#         }
#     }'
# }

# Extract and combine headers from all files and save to output file
extract_and_combine_headers "$file1_path" "$file2_path" "$file3_path" > "$output"

# # Join all files based on keys and append to output file
# join_files "$file1_path" "$file2_path" "$file3_path" | sort -t $'\t' -k1,1 -k2,2 -k3,3 >> "$output"

