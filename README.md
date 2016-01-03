# Nebula

A modern system requires access to multitude of development and production environments. Each environment has separate
credentials, requirements and providers. Nebula is a virtual machine that creates & manages your development and 
production environments.

Key features are:

* **Secure Secret Access**: Secure secrets are stored in [LastPass](https://lastpass.com/) and retrieved via [LastPass 
  CLI](https://github.com/lastpass/lastpass-cli).
* **Otto**: [Otto](https://ottoproject.io/) is used to create a dev environment and deploy it in production.


Getting Started
----------------

In order to create a Nebula, you will need to install
 
* [Vagrant](https://www.vagrantup.com/downloads.html) 
* [VMWare Fusion Pro](https://www.vmware.com/products/fusion/fusion-evaluation.html) along with the [Vagrant license for Fusion](https://www.vagrantup.com/vmware)
* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

Then setup your [LastPass](https://lastpass.com/) account and store your secrets (username/passwords. ssh keys etc.). 

Install all the dependencies:

```sh
$ vagrant plugin install vagrant-vmware-fusion
...
```

Run the following commands in your terminal:

```sh
$ cd ~
$ git clone https://github.com/pepperstack/nebula.git
$ cd nebula
$ vagrant up --provider vmware_fusion
```