FROM python:3.11-slim

# Set working directory inside container
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY src/ ./src
COPY data/ ./data

# Set environment variables for DB connection
ENV POSTGRES_DB=recruitment
ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=admin123
ENV POSTGRES_HOST=postgres
ENV POSTGRES_PORT=5432

# Run the sync script when container starts
CMD ["python", "src/sync_data.py"]