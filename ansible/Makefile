setup:
	ansible-galaxy collection install kewlfft.aur

dns:
	ansible-playbook -i hosts ./services/dns.yaml --vault-password-file ~/ansible/.vault_pass

grafana:
	ansible-playbook -i hosts ./services/grafana.yaml --vault-password-file ~/ansible/.vault_pass

bastion:
	ansible-playbook -i hosts ./services/bastion.yaml --vault-password-file ~/ansible/.vault_pass

kubernetes:
	ansible-playbook -i hosts ./services/kubernetes.yaml --vault-password-file ~/ansible/.vault_pass

redmine:
	ansible-playbook -i hosts ./services/redmine.yaml --vault-password-file ~/ansible/.vault_pass
