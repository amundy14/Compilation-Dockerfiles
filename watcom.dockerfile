# Use a lightweight base image
FROM alpine:latest

# Install necessary packages
RUN apk update && \
    apk add --no-cache \
    openwatcom \
    make \
    cmake

# Set up environment variables for Watcom
ENV PATH=/opt/watcom/binl64:$PATH

# Create a work directory
WORKDIR /workspace

# Define the entry point for the container
ENTRYPOINT ["sh"]

