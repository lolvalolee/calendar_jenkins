FROM ubuntu:latest
LABEL authors="oleksandr.piskurov"

ENTRYPOINT ["top", "-b"]