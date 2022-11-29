FROM golang:latest AS builder

RUN mkdir rocks
WORKDIR /rocks

RUN apt-get update && \
    apt-get install vim -y 

RUN  go mod init example/rocks 

COPY ./rocks .

RUN go build

FROM hello-world

COPY --from=builder /rocks/rocks .

CMD [ "./rocks" ] 