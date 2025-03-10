
ansible-playbook -i inventory.ini playbooks/cluster_k3s/wipe_n_install.yaml

ansible-playbook -i inventory.ini playbooks/deployment/nginx_ingress_deploy.yaml

ansible-playbook -i inventory.ini playbooks/deployment/cert-manager_deploy.yaml

ansible-playbook -i inventory.ini playbooks/deployment/longhorn_deploy.yaml

ansible-playbook -i inventory.ini playbooks/deployment/kube-prometheus_deploy.yaml