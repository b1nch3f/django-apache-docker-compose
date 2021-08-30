# syntax=docker/dockerfile:1
FROM python:3
ENV PYTHONUNBUFFERED=1

RUN mkdir /code
WORKDIR /code

COPY requirements.txt /code/
RUN pip install -r requirements.txt

COPY . /code/

# update packages
RUN apt-get -qq update
RUN apt-get install --yes apache2 apache2-dev
RUN pip install mod_wsgi
