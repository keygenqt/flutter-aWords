FROM ubuntu:jammy

RUN apt update && apt install -y libsqlite3-dev wget unzip

RUN wget https://bitbucket.org/phpliteadmin/public/downloads/phpLiteAdmin_v1-9-8-2.zip
RUN unzip phpLiteAdmin_v1-9-8-2.zip -d phpLiteAdmin
RUN mv phpLiteAdmin/phpliteadmin.php phpLiteAdmin/index.php
