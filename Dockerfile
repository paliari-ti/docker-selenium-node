FROM ubuntu:16.04

LABEL Mantainer="Felipe Bohnert Paetzold <felipe.paetzold@gmail.com>"
LABEL Description="A docker image for Selenium and nodejs"

RUN apt-get update -y && \
    apt-get install wget chromium-browser default-jre nodejs npm -y && \
    npm install -g n && \
    n latest && \
    npm install -g yarn && \
    npm uninstall n -g && \
    export PATH="$(yarn global bin):$PATH" && \
    apt-get remove wget -y && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*