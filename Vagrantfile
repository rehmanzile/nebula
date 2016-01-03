# -*- mode: ruby -*-
# vi: set ft=ruby :

$nebula_name = "eskimo"
# Some planetary nebulae names: eskimo, ring, medusa, helix, owl, dumbbell, twin_jet, footprint, lemon

Vagrant.configure(2) do |config|
  #TODO: Generate own image and store it in pepperstack/ubuntu/ directory
  config.vm.box = "box-cutter/ubuntu1404-desktop"

  config.vm.define $nebula_name do |nebula|
    nebula.vm.hostname = $nebula_name
    nebula.vm.synced_folder "~/workspace", "/home/vagrant/workspace"

    nebula.vm.provider "vmware_fusion" do |v|
      #TODO: Generate a unique UUID for each instance
      v.vmx["name"] = $nebula_name
      v.vmx["memsize"] = "2048"
      v.vmx["numvcpus"] = 2
      v.vmx["vhv.enable"] = "TRUE"
    end
  end

  # Provisioners
  config.ssh.insert_key = false

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "vvvv"
    ansible.playbook = "provisioners/ansible/site.yml"
  end
end
