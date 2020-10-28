FROM python:3.8-alpine
LABEL maintainer="Max Meinhold <mxmeinhold@gmail.com>"

WORKDIR /opt/demo

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

RUN ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

CMD ["gunicorn", "demo:APP", "--bind=0.0.0.0:8080", "--access-logfile=-"]
