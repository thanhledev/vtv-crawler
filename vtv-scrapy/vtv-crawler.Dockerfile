# Pulling Ubuntu image
FROM ubuntu:20.04

# Updating packages and installing python3 & cron
RUN apt-get update && \
    apt-get install python3 python3-pip cron -y

# create source directory
WORKDIR /scrapy_app

# Copy & install requirements.txt
COPY ./requirements.txt requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# copy source code
COPY . .
ADD ./init.sh /init.sh

RUN chmod +x /init.sh

ENV SCRAPY_ENV prod

# Creating entrypoint for cron
ENTRYPOINT ["/init.sh"]
