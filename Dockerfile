FROM python:3.12.3-slim
LABEL org.opencontainers.image.title="Hello World, Sample Application" \
      org.opencontainers.image.description="My first hello world application on docker hub." \
      org.opencontainers.image.version="1.0" \
      org.opencontainers.image.authors="Asif Shaukat <asifshaukat50@gmail.com>" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.documentation="https://github.com/asifshaukat50/hello-world-docker"

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD ["uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "8000"]