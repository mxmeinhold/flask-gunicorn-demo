FROM python:3.8-alpine
LABEL maintainer="Max Meinhold <mxmeinhold@gmail.com>"

RUN apk add tzdata && \
    cp /usr/share/zoneinfo/America/New_York /etc/localtime && \
    echo 'America/New_York' > /etc/timezone && \
    apk del tzdata

WORKDIR /opt/demo

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

CMD ["gunicorn", "demo:APP", "--bind=0.0.0.0:8080", "--access-logfile=-"]
