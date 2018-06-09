deploy:
	cd ansible && ANSIBLE_NOCOWS=1 ansible-playbook -i hosts deploy.yml --ask-become-pass
