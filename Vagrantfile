Vagrant.configure(2) do |config|

  config.vm.box = "https://googledrive.com/host/0B_BLFE4aPn5zUVpyaHdLanVnMTg/vagrant-archlinux-2013-8.box"
  config.vm.box_check_update = false

  config.vm.network "public_network", bridge: 'en0: Wi-Fi (AirPort)' 
  config.vm.provider "virtualbox" do |vb|
     vb.memory = "512"
     vb.cpus = 2
  end
  config.vm.define "main" do |main|
     main.vm.network "forwarded_port", guest: 22, host: 2240
  end 

  config.vm.provision "shell",
      inline: "pacman -Syy --noconfirm python2"
    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/vagrant.yml"
      ansible.inventory_path = "ansible/inventories/production"
      ansible.limit = 'all'
      ansible.host_key_checking = false
#      ansible.verbose = "vvvv"
      ansible.extra_vars = {
        ansible_ssh_user: 'vagrant'
      }
      ansible.extra_vars = {
        ansible_python_interpreter: '/usr/bin/python2'
      }
  end
end
