archlinux:
	ansible-playbook -i hosts ./services/archlinux.yaml --vault-password-file ~/ansible/.vault_pass

dns:
	ansible-playbook -i hosts ./services/dns.yaml --vault-password-file ~/ansible/.vault_pass

bastion:
	ansible-playbook -i hosts ./services/bastion.yaml --vault-password-file ~/ansible/.vault_pass

kubernetes:
	ansible-playbook -i hosts ./services/kubernetes.yaml --vault-password-file ~/ansible/.vault_pass
