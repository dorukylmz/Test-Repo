FROM ubuntu:latest
WORKDIR /django
ADD . /django/
ENV PYTHONUNBUFFERED=1
COPY requirements.txt requirements.txt
RUN apt-get -y update
RUN apt-get -y install -y python3
RUN apt-get -y install python3-pip apache2 libapache2-mod-wsgi-py3
RUN pip3 install -r requirements.txt
RUN mv djangoconf.txt /etc/apache2/sites-available/hukukrobotu.conf
USER root
RUN a2ensite /etc/apache2/sites-available/hukukrobotu.conf
RUN service apache2 restart
EXPOSE 8000
EXPOSE 40
CMD [ "python3","manage.py","runserver", "0.0.0.0:8000" ]
