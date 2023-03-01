FROM golang:alpine AS builder
WORKDIR /app
COPY hello.go .
RUN go env -w GO111MODULE=off
RUN go build -o /app/hello

FROM scratch
WORKDIR /app
COPY --from=builder /app/hello /app/hello
ENTRYPOINT ["/app/hello"]
