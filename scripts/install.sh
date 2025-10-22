#!/bin/bash

# Variables
INSTALL_DIR="/usr/local/lib/ttrpgroller"
BIN_DIR="/usr/local/bin"
JAR_NAME="ttrpgroller.jar"
WRAPPER_NAME="roll"

# Resolve script directory (the folder where this install.sh lives)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
JAR_PATH="$SCRIPT_DIR/../bin/$JAR_NAME"

echo "Installing TTRPG Roller..."

# Check Java
if ! command -v java >/dev/null 2>&1; then
  echo "Error: Java is not installed. Please install Java and try again."
  exit 1
fi

# Check if jar file exists
if [ ! -f "$JAR_PATH" ]; then
  echo "Error: Could not find $JAR_NAME at $JAR_PATH"
  echo "Make sure the jar file is built and located correctly."
  exit 1
fi

# Create install directory
if ! sudo mkdir -p "$INSTALL_DIR"; then
  echo "Error: Failed to create install directory $INSTALL_DIR"
  exit 1
fi

# Copy jar file
if ! sudo cp "$JAR_PATH" "$INSTALL_DIR/"; then
  echo "Error: Failed to copy $JAR_NAME to $INSTALL_DIR"
  exit 1
fi

# Create wrapper script
sudo tee "$BIN_DIR/$WRAPPER_NAME" > /dev/null << EOF
#!/bin/bash
java -jar "$INSTALL_DIR/$JAR_NAME" "\$@"
EOF

# Make wrapper executable
if ! sudo chmod +x "$BIN_DIR/$WRAPPER_NAME"; then
  echo "Error: Failed to make wrapper executable"
  exit 1
fi

echo "Installation complete! You can now run your roller with:"
echo "  $WRAPPER_NAME <Rolls>d<die> eg; 1d12"

