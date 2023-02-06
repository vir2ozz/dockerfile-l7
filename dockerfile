# Dockerfile

# Base image - Ubuntu 18.04
FROM ubuntu:18.04

# Update the package list and install python and pip
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip

# Copy requirements.txt to /tmp/
COPY requirements.txt /tmp/

# Install dependencies from requirements.txt
RUN pip install -qr /tmp/requirements.txt

# Copy the application files to /opt/webapp
COPY . /opt/webapp

# Set the working directory to /opt/webapp
WORKDIR /opt/webapp

# Expose port 5000
EXPOSE 5000

# Entrypoint - Start the application using "app.py"
ENTRYPOINT ["python", "app.py"]
