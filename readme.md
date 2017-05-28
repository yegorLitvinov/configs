# Quick instalation of all necessary packages:
```bash
bash ./install_ansible.sh
ansible-playbook deploy.yml --ask-become-pass
```
ansible ansible-test -m ping -i hosts
ansible-playbook -i hosts test.yml --ask-become-pass --tags zsh
