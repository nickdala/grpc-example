# grpc-example

This example gets you started using gRPC using .Net Core for the server and Go for the client.

## Setup

### Install protobuf

```sh
brew install protobuf
```

## Greeting .Net Core Service

A sample gRPC service in .Net Core.

## Docker Build

```sh
docker build --tag grpc-greeter:1.0.0 .
```

## Run

```sh
docker run -p 8080:80 -it grpc-greeter:1.0.0
```

## Greeting Go Client

### Install gRPC

```sh
go get -u google.golang.org/grpc
```

### Install Protocol Buffers v3

```sh
go get -u github.com/golang/protobuf/protoc-gen-go
```

```sh
export PATH=$PATH:$GOPATH/bin
```

### Generate gRPC code

```sh
protoc -I Protos/ Protos/greet.proto --go_out=plugins=grpc:client/Greeting
```

### Build the client

```sh
cd client
go build
```

### Run the client

```sh
./client
```

You should see an output like the following.

```sh
2019/11/08 12:18:39 Greeting: Hello greeter
```
