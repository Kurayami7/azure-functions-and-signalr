#!/bin/bash

# Run the command and save the output
output=$(azd env get)

# Parse the output and write to .env file
echo "$output" | while IFS= read -r line
do
    # Split the line into name and value
    echo "Parsing line: $line"
    name=$(echo $line | cut -d' ' -f1)
    value=$(echo $line | cut -d' ' -f2-)
    echo "Parsed name: $name, value: $value"

    # Write to .env file
    echo "$name=$value" >> .env
done