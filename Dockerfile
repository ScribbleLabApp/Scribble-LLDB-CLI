FROM mcr.microsoft.com/mssql/server:2019-latest

# Install necessary packages (if any)

# Copy your installation script into the container
COPY scr/install.sh /install.sh

# Make the script executable
RUN chmod +x /install.sh

# Run the installation script
CMD ["/install.sh"]
