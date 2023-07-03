# Python image from Docker Hub
FROM python:3.11

# Copy all files from current directory to /app in container
COPY . /app

# Set working directory to /app
WORKDIR /app

# Install all dependencies
RUN pip install -r requirements.txt

# Run download_all_fx_data.py
CMD ["python", "download_all_fx_data.py"]