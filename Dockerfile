FROM golang:latest AS go

WORKDIR /go

COPY ./fullcycle.go fullcycle.go

RUN go build fullcycle.go

FROM scratch
COPY --from=go /go/fullcycle .
ENTRYPOINT [ "./fullcycle" ]

