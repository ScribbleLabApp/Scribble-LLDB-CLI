# Scribble CLI Troubleshooting Guide

## Introduction
This guide provides solutions to common issues encountered while using the Scribble Developer CLI tool. If you encounter any problems not covered here, please contact <!--support@scribblelab.com--> scribblelabapp.dev@gmail.com for further assistance.

### Overview

---

## Issue: Failed to Fetch Latest Version or Download URL

|                    |                                                                                                                |
| ------------------ | -------------------------------------------------------------------------------------------------------------- |
| **Error Message:** | "Failed to fetch latest version and/or download URL."                                                          |
| **Exit Code:**     |  2                                                                                                             |
| **Meaning:**       | The script couldn't retrieve the latest version or download URL from the GitHub releases. This could be due to network issues or changes in our GitHub API. Check your internet connection and try again later. If the error still exists after one day, please contact our development team.                                                                                             |

---

## Issue: Dowload Failed

|                    |                                                                                                                |
| ------------------ | -------------------------------------------------------------------------------------------------------------- |
| **Error Message:** | "Failed to fetch latest version and/or download URL."                                                          |
| **Exit Code:**     |  2                                                                                                             |
| **Meaning:**       |  The script couldn't retrieve the latest version or download URL from the GitHub releases. This could be due to network issues or changes in our GitHub API. Check your internet connection and try again later. If the error still exists after one day, please contact our development team.                                                                                             |

---

## Issue: Failed to Extract Scribble-Cli Tools

|                     |                                                                                                               |
| ------------------- | ------------------------------------------------------------------------------------------------------------- |
| **Error Message:**  | "Failed to extract ScribbleDeveloper-CLI tools."                                                              |
| **Exit Code:**      |  100                                                                                                          |
| **Meaning:**        |  The extraction of the downloaded ScribbleDeveloper-CLI tools failed. This could be due to corrupt or incomplete download files. Try re-downloading the tools and reinstalling.                                                                        |

---

## Issue: Existing Folder or Binary Named 'scribble'

|                    |                                                                                                                |
| ------------------ | -------------------------------------------------------------------------------------------------------------- |
| **Error Message:** | "A folder or binary named 'scribble' already exists in /usr/local/bin."                                        |
| **Exit Code:**     | 150  |                                                                                                         |
| **Meaning:**       | Another folder or binary with the name 'scribble' already exists in the installation directory (`/usr/local/bin`). This could conflict with the installation process. Remove or rename the existing 'scribble' folder or binary and retry the installation.                                                                                                                         |

---


## Issue: Installation Interrupted

|                    |                                                                                                                |
| ------------------ | -------------------------------------------------------------------------------------------------------------- |
| **Error Message:** | "Installation was interrupted."                                                                                |
| **Exit Code:**     | 200                                                                                                            |
| **Meaning:**       | The installation script was not run with superuser privileges. Re-run the installation script using `sudo`.    |

---

## Issue: Failed to Move Executables to System-Wide Location

|                    |                                                                                                                |
| ------------------ | -------------------------------------------------------------------------------------------------------------- |
| **Error Message:** | "Failed to move executables to system-wide location (`/usr/local/bin`)."                                       |
| **Exit Code:**     |  201 (see also 200)                                                                                            |
| **Meaning:**       | The script failed to move the Scribble-CLI executables to the system-wide location (`/usr/local/bin`). This could be due to permission issues or disk space limitations. Ensure you have the necessary permissions and sufficient disk space, then retry the installation.                                                                                                                     |

--- 

## Issue: Failed to Clean Up Installation Files

|                    |                                                                                                                |
| ------------------ | -------------------------------------------------------------------------------------------------------------- |
| **Error Message:** | "Failed to clean up installation files."                                                                       |
| **Exit Code:**     | 240 (see also 200)                                                                                             |
| **Meaning:**       | The script failed to clean up temporary installation files. This could be due to permission issues or file system errors. Manually remove the temporary files and retry the installation.                                                               |

---

If you encounter any other issues not listed here or require further assistance, please contact <!--support@scribblelab.com--> scribblelabapp.dev@gmail for additional help.