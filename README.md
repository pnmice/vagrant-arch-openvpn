#install python
pacman -Syy --noconfirm python2
ln -s /usr/bin/python2.7 /usr/bin/python

#update cert and keys
cd /usr/share/easy-rsa/

#execute only ansible
vagrant provision --provision-with ansible

# source ansible/roles/openvpn/files/server1.conf
equal - copy: src=server1.conf dest=/etc/openvpn/server1.conf owner=root group=root mode=0755

change ip in server1.conf
