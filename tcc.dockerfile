# Use a lightweight base image
FROM alpine:latest

# Install necessary packages
RUN apk update && \
    apk add --no-cache \
    tcc \
    make \
    cmake

# Create a work directory
WORKDIR /workspace

# Define the entry point for the container
ENTRYPOINT ["sh"]

