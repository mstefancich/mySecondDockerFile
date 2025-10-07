# Use a lightweight Python image
FROM python:3.11-slim

# Install system dependencies (optional here, but useful pattern)
RUN apt-get update && apt-get install -y \
    build-essential \
 && rm -rf /var/lib/apt/lists/*

# Set workdir
WORKDIR /app

# Copy and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your app code
COPY . .

# Run the web server
CMD ["python", "writeToFile.py"]

