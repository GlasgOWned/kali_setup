#!/usr/bin/env bash

apt-get clean
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y

apt install -y \
    docker.io \
    exiftool \
    filezilla filezilla-common \
    gdb \
    gobuster \
    golang \
    ipython3 \
    default-jdk \
    jd-gui \
    jq \
    libreoffice \
    lolcat \
    ltrace \
    lynx \
    mcrypt \
    npm \
    oletools \
    pandoc \
    poppler-utils \
    python-pip \
    python3-pip \
    plank \
    responder \
    rlwrap \
    ropper \
    seclists \
    steghide \
    strace \
    tree \
    virtualenv

usermod -a -G docker glasgow

#### Regenerate Default ssh keys (move default to new folder)
mkdir /etc/ssh/default_kali_keys
mv /etc/ssh/ssh_host_* /etc/ssh/default_kali_keys/
dpkg-reconfigure openssh-server


#### Python packages
python3 -m pip install awscli factordb-pycli jupyter jupyterlab pwntools pymysql pyftpdlib termcolor yq

#### Ruby Gems
gem install mdless

# Download Atom
atom_deb="/tmp/atom-amd64.deb"
wget -O $atom_deb https://atom.io/download/deb
apt install $atom_deb -y
rm $atom_deb

# update python to point to python3
apt install python-is-python3

#### Install Google Chrome
chrome_deb="/tmp/google-chrome-stable_current_amd64.deb"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O $chrome_deb
apt install $chrome_deb -y
rm $chrome_deb


echo -e '\n\n# HTB machines' >> /etc/hosts

echo "consider rebooting now..."
