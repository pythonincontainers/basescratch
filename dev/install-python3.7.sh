apt-get update
# Install 'software-properties-common' to get add-apt-repository
apt-get install -y software-properties-common build-essential
# Install latest Python repository for Ubuntu
add-apt-repository ppa:deadsnakes/ppa -y
apt-get update
# Install Python 3.7 and its Libraries plus 'curl' to pull PIP installation script
apt-get install -y python3.7 python3.7-dev curl
# Add 'python' name to 'python3.7' binary
ln /usr/bin/python3.7 /usr/bin/python
# Pull PIP installation script
curl "https://bootstrap.pypa.io/get-pip.py" -o "/tmp/get-pip.py"
# Install PIP, download specific versions of modules
python /tmp/get-pip.py pip==19.1.1 setuptools==41.0.1 wheel==0.33.4
rm /tmp/get-pip.py
# Purge and remove Ubuntu Packages not needed in Python Development Image, 'curl' for example
apt-get remove --auto-remove --purge -y --allow-remove-essential $(cat /tmp/packages_to_purge.txt)
# Clean APT caches
apt-get clean
rm -rf /tmp/*
# Create a full system Tar ball
tar -cpzf rootfs.tar.gz --exclude=/rootfs.tar.gz --one-file-system /
