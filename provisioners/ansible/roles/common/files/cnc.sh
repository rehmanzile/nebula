#!/bin/bash -e

function cnc_banner() {
    cat << "EOF"


 ██████╗███╗   ██╗ ██████╗
██╔════╝████╗  ██║██╔════╝
██║     ██╔██╗ ██║██║
██║     ██║╚██╗██║██║
╚██████╗██║ ╚████║╚██████╗
 ╚═════╝╚═╝  ╚═══╝ ╚═════╝
Command & Control Console


EOF

}

cnc_banner

echo -n "Enter LastPass username: "
read USERNAME
LPASS_ACCOUNT="${USERNAME}"
lpass login ${LPASS_ACCOUNT}

echo "Copying ssh keys"
if [ ! -f "~/.ssh/id_rsa" ]; then
    ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
fi

# Copy ssh public and private key from LastPass & logout
lpass show --field "Public Key" ssh-key > ~/.ssh/id_rsa.pub
PRIVATE_KEY=~/.ssh/id_rsa
lpass show --field "Private Key" ssh-key > ${PRIVATE_KEY}
lpass logout --force