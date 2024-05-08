setup:
	ansible-galaxy collection install kewlfft.aur

all01:
	ansible-playbook -i ./hosts/site01 -i conf ./services/all.yaml --vault-password-file ~/ansible/.vault_pass

dns01:
	ansible-playbook -i ./hosts/site01 -i conf ./services/dns.yaml --vault-password-file ~/ansible/.vault_pass

grafana01:
	ansible-playbook -i ./hosts/site01 -i conf ./services/grafana.yaml --vault-password-file ~/ansible/.vault_pass

bastion01:
	ansible-playbook -i ./hosts/site01 -i conf ./services/bastion.yaml --vault-password-file ~/ansible/.vault_pass

deployer01:
	ansible-playbook -i ./hosts/site01 -i conf ./services/deployer.yaml --vault-password-file ~/ansible/.vault_pass

kubernetes01:
	ansible-playbook -i ./hosts/site01 -i conf ./services/kubernetes.yaml --vault-password-file ~/ansible/.vault_pass

redmine01:
	ansible-playbook -i ./hosts/site01 -i conf ./services/redmine.yaml --vault-password-file ~/ansible/.vault_pass

all02:
	ansible-playbook -i ./hosts/site02 -i conf ./services/all.yaml --vault-password-file ~/ansible/.vault_pass

bastion02:
	ansible-playbook -i ./hosts/site02 -i conf ./services/bastion.yaml --vault-password-file ~/ansible/.vault_pass

docker02:
	ansible-playbook -i ./hosts/site02 -i conf ./services/docker.yaml --vault-password-file ~/ansible/.vault_pass
