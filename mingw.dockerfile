# Use a lightweight base image
FROM alpine:latest

# Install necessary packages
RUN apk update && \
    apk add --no-cache \
    mingw-w64 \
    gcc \
    g++ \
    make \
    cmake

# Set up environment variables for mingw
ENV CC=x86_64-w64-mingw32-gcc \
    CXX=x86_64-w64-mingw32-g++ \
    PATH=/usr/x86_64-w64-mingw32/bin:$PATH

# Create a work directory
WORKDIR /workspace

# Define the entry point for the container
ENTRYPOINT ["sh"]

