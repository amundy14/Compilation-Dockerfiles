# Use a lightweight base image
FROM alpine:latest

# Install necessary packages
RUN apk update && \
    apk add --no-cache \
    clang \
    make \
    cmake \
    curl \
    bash

# Copy the get-headers.sh script into the container
COPY get-headers.sh /workspace/get-headers.sh

# Run the script to get MSVC headers
RUN chmod +x /workspace/get-headers.sh && /workspace/get-headers.sh

# Set up environment variables for Clang with MSVC headers
ENV CC=clang \
    CXX=clang++ \
    MSVC_HEADERS=/workspace/msvc \
    CFLAGS="-I$MSVC_HEADERS/include" \
    CXXFLAGS="-I$MSVC_HEADERS/include" \
    LDFLAGS="-L$MSVC_HEADERS/lib"

# Create a work directory
WORKDIR /workspace

# Define the entry point for the container
ENTRYPOINT ["sh"]

