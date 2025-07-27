# Build stage
FROM golang:1.24.4 AS builder

WORKDIR /app

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o server ./cmd/server/main.go

# Run stage
FROM alpine:latest

WORKDIR /root/
COPY --from=builder /app/server .
COPY .env .env

EXPOSE 8080
CMD ["./server"]
