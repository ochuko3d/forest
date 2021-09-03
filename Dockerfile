FROM python:3.9-slim

RUN apt-get clean \
    && apt-get -y update

RUN apt-get -y install \
    nginx \
    python3-dev \
    build-essential

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt --src /usr/local/src

COPY . .

EXPOSE 5000
<<<<<<< HEAD
CMD [ "python", "tree.py" ]
=======

CMD [ "python", "tree.py" ]
>>>>>>> a62124ea6439c0e9b53f4acc516735a3c683a441
