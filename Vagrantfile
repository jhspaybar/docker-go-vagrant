Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider "virtualbox" do |v|
    v.cpus = 2
    v.memory = 2048
  end
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.provision :shell, path: "user-bootstrap.sh", privileged: false
  config.vm.provision :shell, path: "docker-bootstrap.sh"
end
