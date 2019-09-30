FROM ubuntu

RUN apt-get update
RUN apt-get install -y git python python-pip libglib2.0-dev libyaml-dev libpython2.7-dev usbutils
RUN pip install setuptools

# This argument can be modified by building with --build-arg CACHEBUST=$(date +%s)
# By doing so the image will be rebuilt from this point onwards
ARG CACHEBUST=1

# Copy the root directory into the docker image
ADD . /arribada_python_tools
WORKDIR /arribada_python_tools
RUN python setup.py install