FROM golang:1.11.1-alpine3.7 AS builder
ADD . /src
RUN cd /src && go build -o hello-world

FROM alpine:3.7
WORKDIR /app
COPY --from=builder /src/hello-world /app/
ENTRYPOINT /app/hello-world
