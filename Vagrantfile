# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.define "nebula" do |nebula|
    #nebula.vm.provision "file", source: "nebula.sh", destination: "/tmp/nebula"
    #nebula.vm.provision :shell, path: "provision.sh"
    nebula.vm.synced_folder "~/nebula", "/nebula"

    nebula.vm.provider "virtualbox" do |v|
      v.name = "nebula"
      v.memory = 2048
      v.cpus = 8
    end
  end
end
