# Use Python base image in version 3.8
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt requirements.txt

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Ensure the database is initialized with the pre-defined posts in the init_db.py file
RUN python init_db.py

# Expose the application port
EXPOSE 3111

# Define the command to run the application when the container starts
CMD ["python", "app.py"]

