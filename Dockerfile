FROM elixir:1.9
LABEL maintainer "serra@allgood.dev"

RUN apt-get update
RUN apt-get full-upgrade -y
RUN apt-get install -y postgresql
RUN pg_ctlcluster 11 main start

RUN mix local.hex --force && mix local.rebar --force && mix hex.info

RUN groupadd -r phoenix && useradd -r -s /bin/false -g phoenix phoenix
USER phoenix
