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

echo -n "Enter Cloudgenix Username: "
read USERNAME
CGNX_ACCOUNT="${USERNAME}\@cloudgenix.com"
lpass login ${CGNX_ACCOUNT}

echo "Copying ssh keys"
if [ ! -f "~/.ssh/id_rsa" ]; then
    ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
fi

# Copy ssh public and private key from LastPass & logout
lpass show --field "Public Key" ssh-key > ~/.ssh/id_rsa.pub
PRIVATE_KEY=~/.ssh/id_rsa
lpass show --field "Private Key" ssh-key > ${PRIVATE_KEY}
lpass logout --force

## Workaround for LastPassword Bug: https://github.com/lastpass/lastpass-cli/issues/135
#sed -i 's/-----BEGIN RSA PRIVATE KEY-----/BEGIN/g' ${PRIVATE_KEY}
#sed -i 's/-----END RSA PRIVATE KEY-----/END/g' ${PRIVATE_KEY}
#sed -i 's/ /\n/g' ${PRIVATE_KEY}
#sed -i 's/BEGIN/-----BEGIN RSA PRIVATE KEY-----/g' ${PRIVATE_KEY}
#sed -i 's/END/-----END RSA PRIVATE KEY-----/g' ${PRIVATE_KEY}


echo "Setting up development environment"
echo -e "Host stash.internal.cloudgenix.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
MY_PROJECT=~/myproject
if [ ! -d "${MY_PROJECT}/lineups" ]; then
    pushd ${MY_PROJECT}
    git clone -b feature/AUTO-1046 ssh://git@stash.internal.cloudgenix.com:7999/maserati/lineups.git
    lineups/bin/lineup init
    popd
fi

echo "Adding environment variables to ~/.bashrc file..."
grep -q -F 'export CGNX_ACCOUNT' ~/.bashrc || echo "export CGNX_ACCOUNT=${CGNX_ACCOUNT}" >> ~/.bashrc
grep -q -F '~/myproject/lineups/bin' ~/.bashrc || echo 'PATH=$PATH:~/myproject/lineups/bin' >> ~/.bashrc
echo ""
echo "source ~/.bashrc     <--- Use this command to apply changes to your environment"
echo ""