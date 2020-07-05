FROM       python:3.7-alpine
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY  .  /usr/src/app/
RUN        pip install -r requirements.txt
CMD export $(cat .env | xargs) && python hello.py
