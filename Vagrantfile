Vagrant.configure('2') do |config|

  os = "ubuntu/focal64"
  net_ip = "192.168.56"
  memory = "512"
  cpu = 1
  hosts = [
    ["cephmon", "#{net_ip}.10",  memory, cpu,  os],
    ["cephosd",    "#{net_ip}.11",    memory,    cpu,  os],
    ["elasticsearch",    "#{net_ip}.12",    memory,    cpu, os ],
    ["kafka",    "#{net_ip}.13",    memory,    cpu, os ],
    ["mongodb",    "#{net_ip}.14",    memory,    cpu, os ],
    ["mysql",    "#{net_ip}.15",    memory,    cpu, os ]

  ]
  hosts.each do |vmname,ip,mem,cpu,os|
    config.vm.define vmname do |host|
      host.vm.provider "virtualbox" do |vb|
            vb.memory = mem
            vb.cpus = cpu
            vb.name = vmname
      end
      host.vm.synced_folder ".", "/vagrant", disabled: true
      host.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/mykey.pub"
      host.vm.box = os
      host.vm.hostname = vmname
      host.vm.network "private_network", ip: ip
      host.vm.provision "shell", inline: <<-SHELL
        cat /home/vagrant/.ssh/mykey.pub >> /home/vagrant/.ssh/authorized_keys
        apt update
      SHELL
    end
  end
end