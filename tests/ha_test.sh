#! /bin/bash

ansible-playbook -i inventory.ini playbooks/cluster_k3s/wipe_n_install.yaml

ping 192.168.99.199 -c 32

ansible-playbook -i inventory.ini playbooks/maintenance/reboot_nodes.yaml

ping 192.168.99.199 -c 32