FROM ubuntu:trusty

RUN apt-get update -qq &&\
  apt-get install -y strace
