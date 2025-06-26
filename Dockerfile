FROM swift:5.9 as builder

WORKDIR /app

# Pre-cache dependencies separately
COPY Package.swift .
RUN swift package resolve

# Then copy the rest of your code and build
COPY . .
RUN swift build -c release

# Final runtime image
FROM swift:5.9-slim

WORKDIR /app

COPY --from=builder /app/.build/release /app

EXPOSE 8080
CMD ["./App"]
