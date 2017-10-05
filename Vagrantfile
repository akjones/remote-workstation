# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |vm|
    vm.memory = 3096
  end

  config.vm.provision "shell",
                      path: "go.sh",
                      args: "/vagrant"
end
