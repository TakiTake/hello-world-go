FROM golang:1.12.1-alpine3.9 AS builder
WORKDIR /go/src/github/TakiTake/hello-world
COPY . .
RUN CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go install -a -tags netgo -ldflags '-w -extldflags "-static"'

FROM alpine:3.9
WORKDIR /app
COPY --from=builder /go/bin/hello-world /app
ENTRYPOINT ["/app/hello-world"]
