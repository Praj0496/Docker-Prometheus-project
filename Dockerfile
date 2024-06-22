# Stage 1: Build the React front-end
FROM node:16-alpine as frontend

WORKDIR /app

# Copy the front-end files
COPY frontend/package.json frontend/package-lock.json ./
RUN npm install

COPY frontend/ ./
RUN npm run build

# Stage 2: Set up the Python Flask back-end
FROM python:3.9-slim

WORKDIR /app

# Copy the Flask back-end requirements and install them
COPY backend/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the back-end files
COPY backend/ ./

# Copy the front-end build artifacts to the back-end's static folder
COPY --from=frontend /app/build /app/static

# Expose the port that Flask runs on
EXPOSE 5000

# Set the environment variable for Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Command to run the Flask application
CMD ["flask", "run"]
