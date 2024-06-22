# Start from a base Python image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the Flask back-end requirements and install them
COPY backend/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Install gunicorn
RUN pip install gunicorn

# Copy the back-end files
COPY backend/ ./

# Set up the Python Flask back-end
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
