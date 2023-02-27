all:
	ansible-playbook -i hosts ./services/all.yaml --vault-password-file ./vault_pass

dns:
	ansible-playbook -i hosts ./services/dns.yaml --vault-password-file ./vault_pass
