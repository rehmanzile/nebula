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

function print_banner() {
  msg=$1
  echo ""
  echo "##"
  echo "# $msg"
  echo "##"
}

##
# Setup Environment
##
cnc_banner

print_banner "Setting up LastPass"
echo -n "Enter Username [user@yahoo.com]: "
read ACCOUNT
lpass login ${ACCOUNT}


# Copy ssh public and private key from LastPass & logout
lpass show --field "Public Key" ssh-key > ~/.ssh/id_rsa.pub
PRIVATE_KEY=~/.ssh/id_rsa
lpass show --field "Private Key" ssh-key > ${PRIVATE_KEY}

# Workaround for LastPassword Bug: https://github.com/lastpass/lastpass-cli/issues/135
sed -i 's/-----BEGIN RSA PRIVATE KEY-----/BEGIN/g' ${PRIVATE_KEY}
sed -i 's/-----END RSA PRIVATE KEY-----/END/g' ${PRIVATE_KEY}
sed -i 's/ /\n/g' ${PRIVATE_KEY}
sed -i 's/BEGIN/-----BEGIN RSA PRIVATE KEY-----/g' ${PRIVATE_KEY}
sed -i 's/END/-----END RSA PRIVATE KEY-----/g' ${PRIVATE_KEY}


# Set AWS environment variables
export AWS_ACCESS_KEY_ID=`lpass show --notes aws_key_id`
export AWS_SECRET_ACCESS_KEY=`lpass show --notes  aws_secret_access_key`

lpass logout --force