FROM python:3.6.3

ENV DEBIAN_FRONTEND noninteractive
ENV PYTHONUNBUFFERED 1

# Upgrade pip and setuptools
RUN pip install -q -U pip setuptools

RUN mkdir /app
WORKDIR /app
RUN mkdir logs

ADD requirements.txt /app
RUN pip install -r /app/requirements.txt

# Copy the current directory contents 
# into the container at meine-luftdaten-info
ADD . /app/

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV FLASK_APP "webapp:launch()"

# Expose port
EXPOSE 5000

COPY ./contrib/start.sh /start.sh
CMD [ "/start.sh" ]
