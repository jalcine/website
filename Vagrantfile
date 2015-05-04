# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'chef/ubuntu-14.04'
  config.vm.box_check_update = true
  config.ssh.forward_agent = true

  config.vm.provider 'virtualbox' do |vb|
    vb.gui = false
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end

  # TODO: Provision using Ansible.
end
