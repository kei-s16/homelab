setup:
	ansible-galaxy collection install kewlfft.aur
	ansible-galaxy collection install community.docker

all01:
	ansible-playbook -i ./hosts/site01.yaml -i conf ./services/all.yaml --vault-password-file ~/ansible/.vault_pass

dns01:
	ansible-playbook -i ./hosts/site01.yaml -i conf ./services/dns.yaml --vault-password-file ~/ansible/.vault_pass

cache01:
	ansible-playbook -i ./hosts/site01.yaml -i conf ./services/cache.yaml --vault-password-file ~/ansible/.vault_pass

llm01:
	ansible-playbook -i ./hosts/site01.yaml -i conf ./services/llm.yaml --vault-password-file ~/ansible/.vault_pass

worker01:
	ansible-playbook -i ./hosts/site01.yaml -i conf ./services/worker.yaml --vault-password-file ~/ansible/.vault_pass

grafana01:
	ansible-playbook -i ./hosts/site01.yaml -i conf ./services/grafana.yaml --vault-password-file ~/ansible/.vault_pass

jenkins01:
	ansible-playbook -i ./hosts/site01.yaml -i conf ./services/jenkins.yaml --vault-password-file ~/ansible/.vault_pass

bastion01:
	ansible-playbook -i ./hosts/site01.yaml -i conf ./services/bastion.yaml --vault-password-file ~/ansible/.vault_pass

deployer01:
	ansible-playbook -i ./hosts/site01.yaml -i conf ./services/deployer.yaml --vault-password-file ~/ansible/.vault_pass

kubernetes01:
	ansible-playbook -i ./hosts/site01.yaml -i conf ./services/kubernetes.yaml --vault-password-file ~/ansible/.vault_pass

redmine01:
	ansible-playbook -i ./hosts/site01.yaml -i conf ./services/redmine.yaml --vault-password-file ~/ansible/.vault_pass

all02:
	ansible-playbook -i ./hosts/site02.yaml -i conf ./services/all.yaml --vault-password-file ~/ansible/.vault_pass

bastion02:
	ansible-playbook -i ./hosts/site02.yaml -i conf ./services/bastion.yaml --vault-password-file ~/ansible/.vault_pass

dns02:
	ansible-playbook -i ./hosts/site02.yaml -i conf ./services/dns.yaml --vault-password-file ~/ansible/.vault_pass

grafana02:
	ansible-playbook -i ./hosts/site02.yaml -i conf ./services/grafana.yaml --vault-password-file ~/ansible/.vault_pass

