# Build the Gatus binary
FROM golang:1.26.3-alpine AS builder

WORKDIR /src

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build \
    -trimpath \
    -ldflags="-s -w" \
    -o /out/gatus \
    .

# Run Gatus using a smaller non-root image
FROM gcr.io/distroless/static-debian12:nonroot

WORKDIR /app

COPY --from=builder /out/gatus /app/gatus
COPY config.yaml /config/config.yaml

ENV GATUS_CONFIG_PATH=/config/config.yaml \
    GATUS_LOG_LEVEL=INFO \
    PORT=8080

EXPOSE 8080

USER 65532:65532

ENTRYPOINT ["/app/gatus"]