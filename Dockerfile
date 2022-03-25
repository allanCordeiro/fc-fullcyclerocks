FROM golang:1.18.0-alpine AS builder

WORKDIR /usr/src/app

COPY . /usr/src/app/
RUN go build -o /fcrocks

FROM scratch
COPY --from=builder /fcrocks /fcrocks

CMD [ "/fcrocks" ]