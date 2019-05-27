# Use following commands to build Xenial based Custom Python Image for Production Containers
docker run -it --rm -v ${PWD}:/host --privileged ubuntu:16.04 /bin/sh /host/install-xenial-buildd.sh
docker build -t mypython3.7:dev-xenial -f Dockerfile.basescratch .

# Use following command to build Bionic based Custom Python Image for Production Containers
docker run -it --rm -v ${PWD}:/host --privileged ubuntu:18.04 /bin/sh /host/install-bionic-buildd.sh
docker build -t mypython3.7:dev-bionic -f Dockerfile.basescratch .
