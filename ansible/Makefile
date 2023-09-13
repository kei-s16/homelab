setup:
	ansible-galaxy collection install kewlfft.aur

all:
	ansible-playbook -i hosts -i conf ./services/all.yaml --vault-password-file ~/ansible/.vault_pass

dns:
	ansible-playbook -i hosts -i conf ./services/dns.yaml --vault-password-file ~/ansible/.vault_pass

grafana:
	ansible-playbook -i hosts -i conf ./services/grafana.yaml --vault-password-file ~/ansible/.vault_pass

bastion:
	ansible-playbook -i hosts -i conf ./services/bastion.yaml --vault-password-file ~/ansible/.vault_pass

deployer:
	ansible-playbook -i hosts -i conf ./services/deployer.yaml --vault-password-file ~/ansible/.vault_pass

kubernetes:
	ansible-playbook -i hosts -i conf ./services/kubernetes.yaml --vault-password-file ~/ansible/.vault_pass

redmine:
	ansible-playbook -i hosts -i conf ./services/redmine.yaml --vault-password-file ~/ansible/.vault_pass
