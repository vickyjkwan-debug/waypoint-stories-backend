# Use official Swift image for building
FROM swift:5.9 as builder

WORKDIR /app

# Copy source code
COPY . .

# Build the Swift app in release mode
RUN swift build -c release

# Use a smaller image for running
FROM swift:5.9-slim

WORKDIR /app

# Copy the built executable from the builder
COPY --from=builder /app/.build/release /app

# Expose port (adjust if your app uses a different port)
EXPOSE 8080

# Set the default command (replace 'App' with your executable name if different)
CMD ["./App"]
