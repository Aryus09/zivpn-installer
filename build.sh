#!/bin/bash

echo "Build multi-arch..."

GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o udp-update-amd64 main.go
GOOS=linux GOARCH=arm64 go build -ldflags="-s -w" -o udp-update-arm64 main.go
GOOS=linux GOARCH=arm GOARM=7 go build -ldflags="-s -w" -o udp-update-arm main.go

echo "Selesai!"
