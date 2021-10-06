FROM golang:1.17.1-alpine AS builder
ARG VERSION=dev
WORKDIR /Users/chino/go/go-pipeline-testdemo
COPY main.go .
RUN go build -o main -ldflags=-X=main.version=${VERSION} main.go

FROM alpine:3.14
COPY --from=builder /Users/chino/go/go-pipeline-testdemo/main /Users/chino/go/bin/main
ENV PATH="/Users/chino/go/bin:${PATH}"
CMD ["main"]