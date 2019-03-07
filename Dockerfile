FROM ubuntu:16.04

LABEL Mantainer="Felipe Bohnert Paetzold <felipe.paetzold@gmail.com>"
LABEL Description="A docker image for Selenium and nodejs"

RUN apt-get update -y && \
    apt-get install wget -y && \
    apt-get install unzip -y && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
    apt-get update -y && \
    apt-get install google-chrome-stable -y && \
    wget -N 'http://chromedriver.storage.googleapis.com/2.46/chromedriver_linux64.zip' -P ~/ && \
    unzip ~/chromedriver_linux64.zip -d ~/ && \
    rm ~/chromedriver_linux64.zip && \
    mv ~/chromedriver /usr/local/bin/chromedriver && \
    chown root:root /usr/local/bin/chromedriver && \
    chmod 0755 /usr/local/bin/chromedriver && \
    apt-get install -y default-jre && \
    apt-get install -y default-jdk && \
    apt-get install -y nodejs && \
    apt-get install -y npm && \
    npm install -g n && \
    n latest && \
    npm install -g yarn && \
    export PATH="$(yarn global bin):$PATH"

EXPOSE 8080