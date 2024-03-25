#!/bin/bash

# Global definitions:
#  - Scribble CLI version
#  - URL of tar gz
VERSION="0.0.1-alpha"
URL="https://github.com/ScribbleLabApp/ScribbleDeveloper-CLI/releases/tag/${VERSION}.tar.gz"

# Check for superuser privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run the ScribbleDeveloper-CLI Installer with superuser privileges. [ERR]"
    echo "==> Installation was unsuccessful."
    exit 1
fi

echo "Welcome to the ScribbleDeveloper-CLI Installer."
echo "To confirm the installation process you'll need to type 'y'."

read -p "Are you sure you want to continue? (y/n): " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
    if command -v xcode-select >/dev/null 2>&1; then
        echo ""
    else
        echo "Apple Command line tools are not installed."
        echo "ScribbleDeveloper-CLI needs them in order to work correctly."
        read -p "Do you want to install them? (y/n): " confirm_xcode

        if [[ "$confirm_xcode" =~ ^[Yy]$ ]]; then
            echo "==> Installing Apple Command Line Tools..."
            echo "Waiting for confirmation from xcode-select.."
            xcode-select --install
            echo "Please install the Command Line Tools, then run the installer again."
            exit 0
        else
            echo "Installation canceled. Exiting."
            exit 1
        fi
    fi

    # Download & extract scribble
    echo "==> Downloading ScribbleDeveloper-CLI tools..."
    curl -# -L $URL | pv -W >/dev/null 2>&1 -s $(curl -sI $URL | awk '/Content-Length/ {print $2}') -N "Download" -p >/dev/null 2>&1 -o ~/scribble.tar.gz

    echo "==> Extracting ScribbleDeveloper-CLI tools..."
    pv -W ~/scribble.tar.gz | tar xzf - -C ~/

    # Move executables to system-wide location
    echo "==> Installing ScribbleDeveloper-CLI..."
    sudo mv ~/scribble/bin/* /usr/local/bin/

    # Clean up download archive
    echo "==> Cleaning up installation files..."
    rm ~/scribble.tar.gz

    echo "🎊✨ ScribbleDeveloper-CLI tools have been successfully installed. ✨🎊"
    echo "Installer Terminated with exit code 0 [SUCCESS]"
    echo ""
    echo "To use the ScribbleDeveloper-CLI tools from anywhere in your terminal,"
    echo "make sure to add the installation directory to your PATH environment variable."
    echo "You can do this by adding the following line to your shell configuration file (e.g., ~/.bashrc, ~/.zshrc):"
    echo ""
    echo "    export PATH=\"/usr/local/bin:\$PATH\""
    echo ""
    echo "You can also create an alias for the scribble command by adding the following line to your shell configuration file:"
    echo ""
    echo "    alias scribble=\"/usr/local/bin/scribble\""
    echo ""
    echo "After adding the line(s), save the file and run 'source ~/.bashrc' (or 'source ~/.zshrc') to apply the changes."
    echo "You can then use the 'scribble' command from any location in your terminal."
    exit 0
else
    echo "Installation was not successful."
    exit 1
fi

