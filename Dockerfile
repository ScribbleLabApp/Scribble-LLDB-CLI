# FROM mcr.microsoft.com/mssql/server:2019-latest
FROM mcr.microsoft.com/mssql/server:2022-latest

# Install necessary packages (if any)

# Copy your installation script into the container
COPY scr/install.sh /usr/src/app/install.sh

# Make the script executable
# RUN chmod +x /usr/src/app/install.sh

# Run the installation script
CMD ["/usr/src/app/install.sh"]

