FROM python:3.12.3-slim
LABEL authors="Asif Shaukat"

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt