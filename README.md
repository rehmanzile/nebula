# Nebula

A modern system requires access to multitude of development and production environments. Each environment has separate
credentials, requirements and providers. Nebula is a virtual machine that creates & manages your development and 
production environments.

Key features are:

* **Secure Secret Access**: Secure secrets are stored in [LastPass](https://lastpass.com/) and retrieved via [LastPass 
  CLI](https://github.com/lastpass/lastpass-cli).
* **Otto**: [Otto](https://ottoproject.io/) is used for creating your dev environment and deploying it in production.

![Nebula](https://pepper.atlassian.net/wiki/download/attachments/15630340/nebula_graphic.png?version=6&modificationDate=1451851890831&api=v2)

Provider Support
-----------------
* [VMWare Fusion](https://www.vmware.com/products/fusion/fusion-evaluation.html)


Dependencies
------------
* [Vagrant](https://www.vagrantup.com/downloads.html)
* [VMWare Fusion Pro](https://www.vmware.com/products/fusion/fusion-evaluation.html) 
* [Vagrant license for Fusion](https://www.vagrantup.com/vmware)
* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [LastPass](https://lastpass.com/) account for storing secrets 

Getting Started
----------------

Install vagrant plugins and fusion license:

```sh
$ vagrant plugin install vagrant-vmware-fusion
$ vagrant plugin license vagrant-vmware-fusion license.lic
```

Run the following commands to setup your virtual machine:

```sh
$ cd ~
$ git clone https://github.com/pepperstack/nebula.git
$ cd nebula
$ vagrant up --provider vmware_fusion
```

Your virtual machine will be created with the default name of "eskimo" Nebula. Alternatively, you can edit the 
nebula_name variable in Vagrantfile for creating more nebulae. 


Now ssh to your Nebula:

```sh
$ vagrant ssh <nebula-name>
```

You are ready to go through [Otto Getting Started](https://ottoproject.io/intro/getting-started/dev.html) for developing 
and deploying your applications. Refer to [What is Otto?](https://ottoproject.io/intro/index.html) for more information. 