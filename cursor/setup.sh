#!/bin/bash

CURSOR_SETTINGS_DIR="$HOME/Library/Application Support/Cursor/User"
SETTINGS_FILE="settings.json"
KEYBINDINGS_FILE="keybindings.json"

# Create cursor settings directory if it doesn't exist
mkdir -p "$CURSOR_SETTINGS_DIR"

# Function to create symbolic link
create_symlink() {
    local source_file=$1
    local target_file="$CURSOR_SETTINGS_DIR/$1"
    
    # Remove existing file if it exists
    if [ -f "$target_file" ]; then
        rm "$target_file"
    fi
    
    # Create symbolic link
    ln -s "$(pwd)/$source_file" "$target_file"
    echo "Linked $source_file successfully!"
}

# Create symbolic links for both files
create_symlink $SETTINGS_FILE
create_symlink $KEYBINDINGS_FILE

echo "Cursor configuration files linked successfully!" 