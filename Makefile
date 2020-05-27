deploy-desktop:
	cd ansible && ansible-playbook -i hosts desktop.yml --ask-become-pass
deploy-server:
	cd ansible && ansible-playbook -i hosts server.yml --ask-become-pass
