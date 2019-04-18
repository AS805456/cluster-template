sudo apt-get update
sudo apt-get install -y qemu-kvm libvirt-bin ubuntu-vm-builder
bridge-utils virt-manager libosinfo-bin libguestfs-tools virt-top
sudo adduser `id -un` libvirtd
wget http://releases.ubuntu.com/14.04/ubuntu-14.04.5-server-amd64.iso
qemu-img create -f qcow2 ubuntu.qcow2 20G
sudo virt-install --name test --connect qemu:///system --ram 10240 --disk path=ubuntu.qcow2,format=qcow2,bus=virtio,size=8 --vcpus 8 --os-type linux --network network=default --graphics none --console pty,target_type=serial --location=ubuntu-14.04.5-server-amd64.iso --extra-args 'console=ttyS0,115200n8 serial'
