FROM node:20

# Install dependencies required for downloading Reviewdog
RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*

# Define Reviewdog version
ENV REVIEWDOG_VERSION="0.20.3"

# Download and extract Reviewdog
RUN wget -O /tmp/reviewdog.tar.gz "https://github.com/reviewdog/reviewdog/releases/download/v${REVIEWDOG_VERSION}/reviewdog_${REVIEWDOG_VERSION}_Linux_x86_64.tar.gz" \
    && tar -xvzf /tmp/reviewdog.tar.gz -C /usr/local/bin \
    && chmod +x /usr/local/bin/reviewdog \
    && rm -f /tmp/reviewdog.tar.gz

# Set up working directory
WORKDIR /app

# Set entrypoint to Reviewdog
ENTRYPOINT ["/usr/local/bin/reviewdog"]
