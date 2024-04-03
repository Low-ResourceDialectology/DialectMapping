#!/bin/bash

# Input files
csv_file="./data/info/gadm_country_list_2022.csv"
txt_file="./data/info/german_countries.txt"

# Output file
output_file="./data/inter/german_countries_codes.txt"
not_found_file="./data/inter/german_countries_not_found.txt"

# Check if input files exist
if [ ! -f "$csv_file" ]; then
    echo "CSV file not found: $csv_file"
    exit 1
fi

if [ ! -f "$txt_file" ]; then
    echo "Text file not found: $txt_file"
    exit 1
fi

# Create an associative array to store country codes from CSV
declare -A country_codes

# Read CSV file and populate the associative array
while IFS=, read -r code country; do
    country_codes["$country"]=$code
done < "$csv_file"

# Initialize array to store not found countries
not_found_countries=()

# Read text file, find corresponding country codes, and write to output file
echo "Country Codes:" > "$output_file"
while IFS= read -r country; do
    code="${country_codes[$country]}"
    if [ -n "$code" ]; then
        echo "$code - $country" >> "$output_file"
    else
        not_found_countries+=("$country")
    fi
done < "$txt_file"

# Write not found countries to a separate file
if [ ${#not_found_countries[@]} -gt 0 ]; then
    echo "Countries not found:" > "$not_found_file"
    for country in "${not_found_countries[@]}"; do
        echo "$country" >> "$not_found_file"
    done
    echo "Countries not found have been written to $not_found_file"
fi

echo "Country codes have been written to $output_file"
