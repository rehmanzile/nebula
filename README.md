# Nebula

Nebula is a virtual machine that creates & manages your development and production environment.

A modern system requires access to multitude of development and production environments. Each environment has separate
credentials, requirements and providers. Key features are:

* **Secure Secret Access**: Secure secrets are stored in [LastPass](https://lastpass.com/) and retrieved via [LastPass 
  CLI](https://github.com/lastpass/lastpass-cli). 


Getting Started
----------------

In order to create a Nebula, you will first need to install [Vagrant](https://www.vagrantup.com/downloads.html) and 
[Virtual Box](https://www.virtualbox.org/wiki/Downloads). 

Then setup a [LastPass](https://lastpass.com/) account and store all your secrets and credentials.

For your environment, make sure virtualbox is in your path.

```sh
$ which vagrant
...
```
Install all the dependencies.

```sh
$ vagrant plugin install vagrant-vbguest
...
```

 

## Provider Support

Virtual Box

## Dependencies

* [Vagrant](https://www.vagrantup.com/downloads.html)

## Installation

* Install Virtual Box plugin for Vagrant

```
vagrant plugin install vagrant-vbguest
```

* Spin up the virtual machine

```
vagrant up --provider virtualbox
```
