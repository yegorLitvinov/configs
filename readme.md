## Quick instalation of all necessary packages in Ubuntu 20.04
```bash
sudo apt install python3-pip
pip3 install --user ansible
export PATH=$PATH:~/.local/bin/
ansible localhost -m ping -i ansible/hosts
make deploy-desktop
```
