#!/usr/bin/bash

sudo yum update -y

# Install packages needed for development and for installing Python
sudo yum groupinstall -y "development tools"
sudo yum install -y \
  lsof \
  wget \
  vim-enhanced \
  words \
  which \
  libffi-devel \
  zlib-devel \
  bzip2-devel \
  openssl-devel \
  ncurses-devel \
  sqlite-devel \
  readline-devel \
  tk-devel \
  gdbm-devel \
  db4-devel \
  libpcap-devel \
  xz-devel \
  expat-devel

#  Install Python 3.6
cd /usr/src
sudo wget http://python.org/ftp/python/3.6.4/Python-3.6.4.tar.xz
sudo tar xf Python-3.6.4.tar.xz
cd Python-3.6.4
sudo ./configure --enable-optimizations
# Note: 'make altinstall' will not replace the CentOS built-in python executable (which is required by the OS)
sudo make altinstall

# Make sure the default secure_path in /etc/sudoers file includes :/usr/local/bin, otherwise cannot run 'sudo pip3.6' command
sudo sed -i "/secure_path/s/$/:\/usr\/local\/bin/" /etc/sudoers
# Upgrade pip
sudo pip3.6 install --upgrade pip

cd /home/centos

# Configure git
git config --global user.name "Randy King"
git config --global user.email "randy.king@intimetec.com"

# Customize bash and vim
curl https://raw.githubusercontent.com/brandallk/content-python3-sysadmin/master/helpers/bashrc -o ~/.bashrc
exec $SHELL
curl https://raw.githubusercontent.com/brandallk/content-python3-sysadmin/master/helpers/vimrc -o ~/.vimrc

# Make a /home/centos/src folder, clone the "python_scripts" repo from Github, and checkout its "wip" branch
# Note: The following lines tend NOT to run when you run the setup.sh script. May have to do this manually.
mkdir -p /home/centos/python/bin
export PATH=$PATH:/home/centos/python/bin
exec $SHELL
mkdir -p /home/centos/python/src
cd /home/centos/python/src
git clone https://github.com/brandallk/python_scripts.git
cd python_scripts
git checkout wip || git checkout -b wip
