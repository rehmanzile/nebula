#!/bin/bash -e

##
# Setup Environment
##
apt-get update
apt-get -y install git-all python-pip
apt-get -y install openssl libcurl4-openssl-dev libxml2 libssl-dev libxml2-dev pinentry-curses xclip openssh-client tree

echo "Copying Command & Control Console (cnc) script"
mv /tmp/cnc /usr/bin/cnc
chmod +x /usr/bin/cnc

echo "Setting up tools directory"
TOOLS="/home/vagrant/tools/"
if [ ! -d "${TOOLS}" ]; then
    mkdir -p ${TOOLS}
fi

chown -R vagrant.vagrant ${TOOLS}
pushd ${TOOLS}

echo "Installing LastPass"
if [ ! -d "${TOOLS}/lastpass-cli" ]; then
    git clone https://github.com/lastpass/lastpass-cli.git
    LP_CLI="lastpass-cli"
    chown -R vagrant.vagrant ${LP_CLI}
    pushd ${LP_CLI}
    make
    sudo make install
    popd
fi
popd

