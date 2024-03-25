# FROM mcr.microsoft.com/mssql/server:2019-latest
FROM mcr.microsoft.com/mssql/server:2022-latest

# Install necessary packages (if any)

# Copy your installation script into the container
COPY scr/install.sh /usr/src/app/install.sh

# Make the script executable
RUN chmod +x /usr/src/app/install.sh

# Run the installation script
CMD ["/usr/src/app/install.sh"]

# ---------------- Update flag test ---------------- 

# FROM ruby:latest

## Set the working directory
# WORKDIR /usr/src/app

## Copy your Scribble CLI application files into the container
# COPY . /usr/src/app

## Define the command to run your Scribble CLI application with the --update option
# CMD ["./scribble", "--update"]

