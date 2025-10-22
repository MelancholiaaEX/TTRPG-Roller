#!/bin/bash

# Variables (must match install script)
INSTALL_DIR="/usr/local/lib/ttrpgroller"
BIN_DIR="/usr/local/bin"
WRAPPER_NAME="roll"
JAR_NAME="ttrpgroller.jar"

echo "Uninstalling TTRPG Roller..."

# Remove jar directory
if [ -d "$INSTALL_DIR" ]; then
  sudo rm -rf "$INSTALL_DIR"
  echo "Removed installation directory: $INSTALL_DIR"
else
  echo "Installation directory not found: $INSTALL_DIR"
fi

# Remove wrapper script
if [ -f "$BIN_DIR/$WRAPPER_NAME" ]; then
  sudo rm -f "$BIN_DIR/$WRAPPER_NAME"
  echo "Removed wrapper script: $BIN_DIR/$WRAPPER_NAME"
else
  echo "Wrapper script not found: $BIN_DIR/$WRAPPER_NAME"
fi

echo "Uninstallation complete!"

