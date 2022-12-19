FROM python:3.6-slim

# Update dependencies and install dependencies
# hadolint ignore=DL3008
RUN apt-get clean \
    && apt-get -y install --no-install-recommends \
    python3-dev \
    build-essential \
    && apt-get -y update \
    && rm -rf /var/lib/apt/lists/*

# Create a working directory
WORKDIR /app

# Copy requirements.txt first to cache
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt --src /usr/local/src

# Copy source code to working directory
COPY . .

## Step 4:
# Expose port 5000
EXPOSE 5000

#Start flask
CMD ["python", "app.py"]
