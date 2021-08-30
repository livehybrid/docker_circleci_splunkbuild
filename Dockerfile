FROM circleci/buildpack-deps:stable
MAINTAINER Will Searle <will@livehybrid.com>

RUN sudo apt-get update && \
    sudo apt-get install -y python3 python3-pip python3-virtualenv

RUN sudo apt-get -y install librsvg2-bin texlive-latex-recommended texlive-pictures texlive-latex-extra pandoc curl crudini dnsutils

RUN python3 -m virtualenv ~/.venv -p python3
RUN sudo chmod 777 /usr/share/man/man1/
RUN . ~/.venv/bin/activate && \
    pip3 install splunk_add_on_ucc_framework && \
    pip3 install https://download.splunk.com/misc/packaging-toolkit/splunk-packaging-toolkit-1.0.1.tar.gz

RUN pip3 install docker-compose
RUN echo "Install docker compose v2" && \
    mkdir -p ~/.docker/cli-plugins/ && \
    curl -SL https://github.com/docker/compose-cli/releases/download/v2.0.0-beta.6/docker-compose-linux-amd64 -o ~/.docker/cli-plugins/docker-compose && \
    chmod +x ~/.docker/cli-plugins/docker-compose


#RUN git clone https://github.com/livehybrid/addonfactory-ucc-generator.git /tmp/ucc/
#RUN cp -R /tmp/ucc/splunk_add_on_ucc_framework ~/.venv/lib/python3.7/site-packages/
