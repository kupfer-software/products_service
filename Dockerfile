FROM python:3.6

ARG GITHUB_TOKEN

WORKDIR /code

COPY ./requirements/base.txt requirements/base.txt
COPY ./requirements/production.txt requirements/production.txt
RUN pip install --upgrade pip && pip install -r requirements/production.txt
RUN pip install git+https://$GITHUB_TOKEN:x-oauth-basic@github.com/kupfer-software/kupfer_commons.git@0.0.3

ADD . /code

ENTRYPOINT ["bash", "/code/docker-entrypoint.sh"]
