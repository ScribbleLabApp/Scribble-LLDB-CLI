#!/bin/bash

# Global definitions
#   - Installation path
INSTALL_PATH="/usr/local/bin/scribble"

# Style definitions
## colors using tput
RED=$(tput setaf 1)
RESET=$(tput sgr0)

## Formatting
BOLD=$(tput bold)
RESET_B=$(tput sgr0)

UNDERLINE=$(tput smul)
RESET_U=$(tput sgr0)

# Check for superuser privileges
if [ "$EUID" -ne 0 ]; then
  echo "${RED}${BOLD}ERROR:${RESET}${RESET_B} Please run the ScribbleDeveloper-CLI Uninstaller with superuser privileges."
  echo "To understand why ScribbleDeveloper-CLI Uninstaller needs superuser privileges visit our README.md"

  echo "    ${UNDERLINE}https://github.com/ScribbleLabApp/ScribbleDeveloper-CLI"${RESET_U}

  echo -e "${BOLD}Deinstallation was interupted! Finished with exit code 1.${RESET_B}"
  exit 1
fi

###########################################################################################################

echo "${BOLD}Welcome to the Official ScribbleDeveloper-CLI Uninstaller.${RESET_B}"
echo -n ""
echo "${BOLD}y:${RESET_B} Uninstall scribble-cli"
echo "${BOLD}q:${RESET_B} Exit Uninstaller"
echo -n ""
read -p "${BOLD}${UNDERLINE}Choose (y/q):${RESET_U}${RESET_B} " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
  echo -n ""
  echo "${BOLD}************ ScribbleDeveloper-CLI Uninstaller ************${RESET_B}"

  # Check if Scribble is installed
  echo "${BOLD}==>${RESET_B} Locate scribble-cli on system"
  if [ -x "$INSTALL_PATH" ]; then
    echo "==> Scribble CLI found at $INSTALL_PATH"
  else
    echo "${BOLD}${RED}ERROR:${RESET}${RESET_B} Scribble CLI not found at $INSTALL_PATH. Exiting..."
    exit 1
  fi

  read -p "Are you sure to uninstall scribble-cli? You can't revert your changes. (y/n): " confirmation

  if [[ "$confirmation" =~ ^[Yy]$ ]]; then
    echo "==> Remove scribble-cli from system"
    rm -rf "$INSTALL_PATH"

    echo "==> Cleaning up..."
    echo "The following command should not give any output output."
    which scribble
    
    exit 0
  else
    echo "Deinstallation was interupted!"
    exit 0
  fi
else
  echo "Deinstallation was interupted!"
  exit 0
fi
