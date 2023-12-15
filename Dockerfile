FROM golang:alpine AS builder

WORKDIR /go/src

COPY src/ .

RUN go build -o ./main hello-world.go

FROM scratch

WORKDIR /bin

COPY --from=builder /go/src/main .

ENTRYPOINT [ "./main" ]
