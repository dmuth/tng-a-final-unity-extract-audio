
FROM python:3.12

ENV DOCKER=true

COPY requirements.txt /

COPY bin/entrypoint.sh /

RUN pip install -r /requirements.txt

ENTRYPOINT [ "/entrypoint.sh" ]

