#!/bin/bash

# Variables
INSTALL_DIR="/usr/local/lib/ttrpgroller"
BIN_DIR="/usr/local/bin"
JAR_NAME="ttrpgroller.jar"
WRAPPER_NAME="roll"

echo "Installing TTRPG Roller..."

# Check Java
if ! command -v java >/dev/null 2>&1; then
  echo "Error: Java is not installed. Please install Java and try again."
  exit 1
fi

# Create install directory
sudo mkdir -p "$INSTALL_DIR"

# Copy jar file
sudo cp "$JAR_NAME" "$INSTALL_DIR/"

# Create wrapper script
sudo tee "$BIN_DIR/$WRAPPER_NAME" > /dev/null << EOF
#!/bin/bash
java -jar "$INSTALL_DIR/$JAR_NAME" "\$@"
EOF

# Make wrapper executable
sudo chmod +x "$BIN_DIR/$WRAPPER_NAME"

echo "Installation complete! You can now run your roller with:"
echo "  $WRAPPER_NAME 3d6"

