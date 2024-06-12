FROM python:3.10

LABEL Maintainer="jmgodino"

WORKDIR /usr/app/src

RUN pip install dice

COPY main.py ./

CMD [ "python", "./main.py"]

