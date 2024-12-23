# Cautious Umbrella

Definição do playbook ansible.

## Caracteristicas da arquitetura
- **OS**: Ubuntu Server 24.04 LTS
- **Hardware**: Raspberry PI 5 e Orange PI 5

## Configuração Ansible

### Grupos de servidores
- k3s-database
- server
- worker
- hybrid

### Definição dos grupos

- **k3s-database**
    - Responsável por executar serviços docker. Contem o banco de dados PostgreSQL do cluster.
    - Nós nesse grupo devem não devem executar workload server.
    - Nós desse grupo devem apresentar taint para execução de apenas workloads de monitoramento.
    - Devem ser monitorados:
        - Recursos do nó
        - Serviços em execução
         Serviço docker
        - Containers docker
        - Logs do servidor e dos containers
- **server**
    - Nós nesse grupo devem executar apenas workload do kubernetes. Deve ser aplicado taint a fim de garantir o comportamento descrito.
- **worker**
    - Nós nesse grupo devem executar apenas workloads não críticos. Deve ser aplicado taint a fim de garantir o comportamento descrito.
- **hybrid**
    - Nós nesse grupo podem executar workloads sem restrição de criticidade.

## Fluxos Monitoração

### Ferramentas

- Prometheus
    - Agregação de métricas
- Grafana
    - Visualização de métricas e disparo de alarmes
- Opensearch
    - Agregação de logs
- cAdvisor
    - Coleta de métricas de conteiners
- Fluent Bit

### Recomendações
- Recomendado utilizar repositórios Helm sempre que possível.

### Peculiaridades do grupo k3s-database
- Deve ser aplicada taint para que pods cAdvisor sejam executados apenas nos nós do grupo **k3s-database**.
- Para nós desse grupo devem ser monitorados recursos do sistema, serviços do sistema, o serviço docker, conteiner docker e logs gerados pelo sistema e conteiners.

## Passos esperados
- Instalação de Docker em grupo ansible **k3s-database**
- Criação de Servidor PostgreSQL docker para máquinas do grupo **k3s-database**
- Instalação de nós K3s Server para grupos ansible **server** e **hybrid**
- Instalação de nós K3s Agent para grupos ansible **k3s-database** e **worker**
- Aplicação de taints de acordo com especificações de grupo ansible
- LoadBalancer externo Kube-VIP
- Aplicação de configuração de firewall entre os servidores
- Aplicação do **Fluxo de Monitoração**
- Configuração de Ingress Controler
- Realizar deploy de Pihole para filtro de DNS e Local DNS
- Configuração do Cert Manager
- Implantação de backup em cloud Amazon S3 Glacier

### Validações
- Validar se todos os servidores tem ip estático
- Validar se docker existe e está corretamente configurado no servidor do banco de dados

## Objetivo final

Configurar automaticamente cluster K3s que apresenta as seguintes características.
- Alta Disponibilidade (HA)
- PostgreSQL como banco de dados do cluster
- LoadBalancer externo Kube-VIP
- Segregação de função de nós
- Compliance com normas de segurança para ambientes de produção
- Backup periódico cloud
- Stack monitoring
- Filtro de DNS e DNS Local
- Certificados válidos e automaticos

## Embasamento do Playbook

O playbook deve ser embasado nos links descritos abaixo.

- https://kube-vip.io/docs/usage/k3s/
- https://ranchermanager.docs.rancher.com/how-to-guides/new-user-guides/kubernetes-cluster-setup/k3s-for-rancher
