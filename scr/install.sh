#!/bin/bash

# URL="https://github.com/ScribbleLabApp/ScribbleDeveloper-CLI/releases/tag/${VERSION}.tar.gz"

user_shell=$(basename "$SHELL")

get_lastest_version() {
  lastest_version=$(curl -s "https://api.github.com/repos/ScribbleLabApp/ScribbleDeveloper-CLI/releases/latest" | grep -o '"tag_name": ".*"' | sed 's/"tag_name": "//;s/"//')
}

get_download_url() {
  download_url=$(curl -s "https://api.github.com/repos/ScribbleLabApp/ScribbleDeveloper-CLI/releases/latest" | grep -o '"browser_download_url": ".*\/[0-9].*\.tar\.gz"' | grep -o '".*"' | sed 's/"//g')
}

# Check for superuser privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run the ScribbleDeveloper-CLI Installer with superuser privileges. [ERR]"
    echo "==> Installation was interrupted. Finished with exit code 200."
    exit 200
fi

echo "Welcome to the ScribbleDeveloper-CLI Installer."
echo "To confirm the installation process you'll need to type 'y'."

read -p "Are you sure you want to continue? (y/n): " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
    # Fetch latest version information
    # Global functions:
    echo "==> Fetch scribble-cli from GitHub"    

    # Global definitions:
    #  - Scribble CLI version
    #  - URL of tar gz
    VERSION=$(get_lastest_version)
    URL=$(get_download_url)


    if [ -n "$VERSION" ] && [ -n "$URL" ]; then
      echo "Version information:"
      echo "v:   $VERSION"
      echo "url: $URL"
    else
      echo "[ERROR]: Failed to fetch latest version and/or download url. Please check your internet connection if try again later."
      echo "Failed with nonzero exit code 2"
      exit 2
    fi

    # Download & extract scribble
    echo "==> Downloading ScribbleDeveloper-CLI tools..."
    curl -# -L $URL | pv -W >/dev/null 2>&1 -s $(curl -sI $URL | awk '/Content-Length/ {print $2}') -N "Download" -p >/dev/null 2>&1 -o ~/scribble.tar.gz
    
    if [ $? -ne 0 ]; then
      echo "[ERROR]: Download failed. Exiting..."
      echo "Failed with nonzero exit code 2"
      exit 2
    fi

    echo "==> Extracting ScribbleDeveloper-CLI tools..."
    pv -W ~/scribble.tar.gz | tar xzf - -C ~/

    if [ $? -ne 0 ]; then
      echo "Failed to extract scribble-cli tools. Exiting..."
      echo "Failed with nonzero exit code 100"
      exit 100
    fi

    # Move executables to system-wide location
    # and check if the folder or binary already exists in /usr/local/bin
    if [ -d "/usr/local/bin/scribble" ] || [ -f "/usr/local/bin/scribble" ]; then
      echo "[ERROR]: A folder or binary named 'scribble' already exists in /usr/local/bin. Aborting installation."
      echo "Failed with nonzero exit code 150"
      exit 150
    fi

    echo "==> Installing ScribbleDeveloper-CLI..."
    sudo mv ~/scribble/bin/* /usr/local/bin/

    if [ $? -ne 0 ]; then
      echo "[ERROR]: Failed to move executables to system-wide location (/usr/local/bin). Exiting..."
      echo "Failed with nonzero exit code 201"
      exit 201
    fi

    # Clean up download archive
    echo "==> Cleaning up installation files..."
    rm ~/scribble.tar.gz

    if [ $? -ne 0 ]; then
      echo "[ERROR]: Failed to clean up installation files. Exiting..."
      echo "Failed with nonzero exit code 240"
      exit 240
    fi

    echo "🎊✨ ScribbleDeveloper-CLI tools have been successfully installed. ✨🎊"
    echo "Installer Terminated with exit code 0 [SUCCESS]"
    echo ""
    echo "To use the ScribbleDeveloper-CLI tools from anywhere in your terminal,"
    echo "make sure to add the installation directory to your PATH environment variable."
    echo "You can do this by adding the following line to your shell configuration file (e.g., ~/.bashrc, ~/.zshrc):"
    echo ""
    echo "    export PATH=\"/usr/local/bin:\$PATH\""
    echo ""

    echo "==> Finish installation..."
   
    if [ "$user_shell" = "bash" ]; then
      echo "==> Adding alias to ~/.bashrc..."
      echo "alias scribble=\"/usr/local/bin/scribble\"" >> ~/.bashrc
      source ~/.bashrc
    elif [ "$user_shell" = "zsh" ]; then
      echo "==> Adding alias to ~/.zshrc..."
      echo "alias scribble=\"/usr/local/bin/scribble\"" >> ~/.zshrc
      source ~/.zshrc
    else
      echo "[ERROR]: Unsupported shell. Please add the alias manually to your shell configuration file."
      echo "Failed with nonzero exit code 250"
      exit 250
    fi

    echo "==> Testing 'scribble' command..."
    scribble --help

    if [ $? -ne 0 ]; then
      echo "[ERROR]: Failed to execute 'scribble --help'. Exiting..."
      echo "Failed with nonzero exit code 10"
      exit 10
    fi

    echo "You can then use the 'scribble' command from any location in your terminal."
    exit 0
else
    echo "[ERROR]: Installation was not successful. Exiting..."
    echo "Installer failed with exit code 204"
    exit 204
fi

