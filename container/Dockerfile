# FROM python:3.11-rc-slim-buster
FROM docker-registry.s.arkea.com/debian:latest

ARG DEBIAN_FRONTEND=noninteractive

ENV CHROME_VERSION=99.0.4844.84
ENV GECKODRIVER=v0.31.0

RUN apt-get update \
&& apt-get install --no-install-recommends -y \
    wget \
    curl \
    unzip \
    openssh-client \
    firefox-esr \
    xvfb \
    xsel \
    libncurses5 \
    libxml2-dev \
    libxslt-dev \
    libz-dev \
    xclip \
    make \
    jq \
&& rm -rf /var/lib/apt/lists/*  \
&& apt-get clean && apt-get autoremove -y

# Install Robotframework.
RUN pip3 install --upgrade \
    robotframework \
    robotframework-pabot \
    robotframework-seleniumlibrary \
    robotframework-debuglibrary \
    robotframework-excellib \
    robotframework-requests \
    pyyaml

# Install google chrome and chrome driver
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
&& echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
&& apt-get update \
&& apt-get install --no-install-recommends -y \
   google-chrome-stable \
&& rm -rf /var/lib/apt/lists/*  \
&& apt-get clean && apt-get autoremove -y \
&& CHROMEDRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE_$CHROME_VERSION` \
&& wget -q "https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip" -O /tmp/chromedriver.zip \
&& unzip /tmp/chromedriver.zip -d /usr/bin/ \
&& rm -rf /tmp/chromedriver.zip

# Install firefox driver (gecko).
RUN wget -q "https://github.com/mozilla/geckodriver/releases/download/$GECKODRIVER/geckodriver-$GECKODRIVER-linux64.tar.gz" \
&& tar -x geckodriver -zf geckodriver-$GECKODRIVER-linux64.tar.gz -O > /usr/bin/geckodriver \
&& chmod +x /usr/bin/geckodriver \
&& rm -rf geckodriver-$GECKODRIVER-linux64.tar.gz

WORKDIR /data