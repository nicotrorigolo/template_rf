# FROM python:slim-buster
FROM python:3.11-rc-slim-buster

ARG DEBIAN_FRONTEND=noninteractive 

RUN apt-get -y update
RUN apt-get -y upgrade

# Install Robotframework et librarie
RUN pip install  \
    robotframework \
    robotframework-seleniumlibrary \
    robotframework-excellib

# Install dependencies of Chrome driver and chrome
RUN apt-get install -y libnss3 libdbus-1-dev xdg-utils libgbm1 libasound2 fonts-liberation xvfb wget unzip

# Install google-chrome-driver
RUN wget -q https://chromedriver.storage.googleapis.com/105.0.5195.52/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip \
    && rm chromedriver_linux64.zip
RUN mv chromedriver bin

# (Optional) Start dbus in WSL, see https://github.com/microsoft/WSL/issues/376#issuecomment-295933508
# RUN /etc/init.d/dbus start

# Install google-chrome
RUN apt-get install -y wget
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -y ./google-chrome-stable_current_amd64.deb
RUN rm -f google-chrome-stable_current_amd64.deb

# Mise en place espace de travail (workdir)
WORKDIR /robots
VOLUME [ "/robots" ]

RUN apt-get install -y git
RUN apt-get install -y nano

# RUN git clone https://github.com/nicotrorigolo/robot_jenkins.git
# RUN mv robot_jenkins/tests/test_robot_google.robot .
# RUN mv robot_jenkins/tests/aaa.robot .

# CMD ["sleep", "3600"]
# CMD ["robot"]