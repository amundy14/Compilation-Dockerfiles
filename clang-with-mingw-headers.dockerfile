# Use a lightweight base image
FROM alpine:latest

# Install necessary packages
RUN apk update && \
    apk add --no-cache \
    clang \
    mingw-w64 \
    make \
    cmake

# Set up environment variables for mingw with clang
ENV CC=x86_64-w64-mingw32-clang \
    CXX=x86_64-w64-mingw32-clang++ \
    PATH=/usr/x86_64-w64-mingw32/bin:$PATH

# Create a work directory
WORKDIR /workspace

# Define the entry point for the container
ENTRYPOINT ["sh"]

