# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  #TODO: Generate own image and store it in pepperstack/ubuntu/ directory
  config.vm.box = "box-cutter/ubuntu1404-desktop"

  config.vm.define "nebula" do |nebula|
    nebula.vm.hostname = "nebula"

    #nebula.vm.provision "file", source: "nebula.sh", destination: "/tmp/nebula"
    #nebula.vm.provision :shell, path: "provision.sh"
    nebula.vm.synced_folder "~/nebula", "/nebula"

    nebula.vm.provider "virtualbox" do |v|
      #TODO: Generate a unique UUID for each instance
      v.name = "eskimo"
      v.memory = 4096
      v.cpus = 2
    end
  end

  # Provisioners
  config.ssh.insert_key = false

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "vvvv"
    ansible.playbook = "provisioners/ansible/site.yml"
  end
end
