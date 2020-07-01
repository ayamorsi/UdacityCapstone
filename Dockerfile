FROM python:3.7
RUN apt-get update
RUN apt-get install python3-pip -y
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY  ./pythonApp  /usr/src/app/
RUN   pip install -r requirements.txt
CMD export $(cat .env | xargs) && python3 hello.py
