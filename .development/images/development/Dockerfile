FROM node:22

RUN apt-get update && \
  apt-get install -y openjdk-17-jdk && \
  apt-get install -y maven;

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable


USER node

WORKDIR /var/lib/ladesa-ro/ctx