FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl git tmate openssh-client sudo ca-certificates gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean

# Set working directory
WORKDIR /app

# Copy files
COPY start.sh server.js ./
RUN chmod +x start.sh

# Install Node.js packages
RUN npm init -y && npm install express

# Run script
CMD ["./start.sh"]
