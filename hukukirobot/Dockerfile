FROM amazonlinux:2023.0.20230315.0
WORKDIR /django
ENV PYTHONUNBUFFERED=1
COPY requirements.txt requirements.txt
RUN yum -y update
RUN yum install -y python3
RUN yum -y install python-pip
RUN pip3 install -r requirements.txt


