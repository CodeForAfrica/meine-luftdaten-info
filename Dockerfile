FROM python:3.6.3

ENV DEBIAN_FRONTEND noninteractive
ENV PYTHONUNBUFFERED 1

# Upgrade pip and setuptools
RUN pip install -q -U pip setuptools

RUN mkdir /app
RUN useradd -d /app app

ADD requirements.txt /app
RUN pip install -r /app/requirements.txt

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV FLASK_APP "webapp:launch()"

USER app
WORKDIR /app
