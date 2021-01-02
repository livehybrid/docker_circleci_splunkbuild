FROM circleci/buildpack-deps:stable
MAINTAINER Will Searle <will@livehybrid.com>

RUN sudo apt-get update && \
    sudo apt-get install -y python2 python-pip python-virtualenv python3 python3.7 python3-pip python3-virtualenv

RUN python3.7 -m virtualenv ~/.venv -p python3

RUN . ~/.venv/bin/activate && \
    pip install splunk_add_on_ucc_framework && \
    pip install https://download.splunk.com/misc/packaging-toolkit/splunk-packaging-toolkit-1.0.1.tar.gz

RUN git clone https://github.com/livehybrid/addonfactory-ucc-generator.git /tmp/ucc/
RUN cp -R /tmp/ucc/splunk_add_on_ucc_framework ~/.venv/lib/python3.7/site-packages/
