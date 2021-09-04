FROM python:3.9-slim

RUN apt-get clean \
    && apt-get -y update

RUN apt-get -y install \
    python3-dev \
    nginx \
    build-essential

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt --src /usr/local/src

COPY . .

RUN pip install pytest pytest-cov && rm -rf /root/.cache
RUN pytest

EXPOSE 5000

CMD [ "python", "tree.py" ]
