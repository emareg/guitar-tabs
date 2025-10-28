#!/bin/bash

# Directory containing the files (relative to the script location)
TARGET_DIR="."
OUTPUT_FILE="$TARGET_DIR/index.html"

# Start the HTML file
cat <<EOF > "$OUTPUT_FILE"
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Guitar Tab Index</title>
</head>
<body>
  <h1>Available Files</h1>
  <ul>
EOF

# Loop through files in the directory
for file in "$TARGET_DIR"/*; do
  filename=$(basename "$file")
  if [[ "$filename" =~ "index" ]]; then
    continue
  fi
  echo "    <li><a href=\"$filename\">$filename</a></li>" >> "$OUTPUT_FILE"
done

# Close the HTML file
cat <<EOF >> "$OUTPUT_FILE"
  </ul>
</body>
</html>
EOF

echo "Index generated at $OUTPUT_FILE"
