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

In order to create a Nebula, you will first need to install [Vagrant](https://www.vagrantup.com/downloads.html), 
[Virtual Box](https://www.virtualbox.org/wiki/Downloads) and [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

Then setup a [LastPass](https://lastpass.com/) account and store all your secrets (username/passwords. ssh keys etc.). 

For your environment, make sure Vagrant and Git is in your path.

```sh
$ which vagrant
...
$ which git
...
```
Install all the dependencies.

```sh
$ vagrant plugin install vagrant-vbguest
...
```

Clone Nebula in your home directory

```sh
$ cd ~
$ git clone https://github.com/pepperstack/nebula.git
...
```