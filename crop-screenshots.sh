#!/bin/bash

# check if input is provided
if [ -z "$1" ]; then
  echo "Error: Please provide an input file or directory"
  echo "Usage: ./crop-screenshots.sh <input_file_or_directory>"
  exit 1
fi

INPUT="$1"

# check if input is a file or directory
if [ -f "$INPUT" ]; then
  # process single file
  filename=$(basename "$INPUT")
  directory=$(dirname "$INPUT")
  magick "$INPUT" -gravity north -chop "0x52" -trim +repage "$directory/cropped_$filename"
elif [ -d "$INPUT" ]; then
  # process directory
  OUTPUT_DIR="$INPUT/cropped"
  # create output directory if it doesn't exist
  mkdir -p "$OUTPUT_DIR"

  # process all png files in the input directory
  for file in "$INPUT"/*.png; do
    if [ -f "$file" ]; then
      filename=$(basename "$file")
      magick "$file" -gravity north -chop "0x52" -trim +repage "$OUTPUT_DIR/$filename"
    fi
  done
else
  echo "Error: Input is neither a valid file nor directory"
  exit 1
fi
