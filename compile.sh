#! /usr/bin/env bash

set -e

rm -f ../pkg/alertmngr/*.pb.go
protoc --go_out=plugins=grpc:"$GOPATH/src/" -I ./ narvi/alertmngr/*.proto

mkdir -p grpc/health/v1/
curl -s https://raw.githubusercontent.com/grpc/grpc-proto/master/grpc/health/v1/health.proto > grpc/health/v1/health.proto
