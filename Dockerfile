FROM registry.access.redhat.com/ubi7/ubi

MAINTAINER Anshul Verma

ADD . /webapp

RUN ls /webapp/;

WORKDIR /webapp/
ENV WEBAPP_IMAGE_DIR /webapp/
#ENV HTML_FILES /webapp/

RUN mkdir /.cache; chmod 777 /.cache; curl https://dl.google.com/go/go1.15.15.linux-amd64.tar.gz --output go1.15.15.linux-amd64.tar.gz; tar -xzf go1.15.15.linux-amd64.tar.gz --directory=/usr/local/;
#RUN ls /usr/local/go; echo $PATH

EXPOSE 8080/tcp

ENTRYPOINT PATH=$PATH:/usr/local/go/bin go run main.go
