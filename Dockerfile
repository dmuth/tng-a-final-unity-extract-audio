
FROM python:3.12

RUN apt update
RUN apt install -y sox

COPY requirements.txt /
RUN pip install -r /requirements.txt

COPY bin/entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]

