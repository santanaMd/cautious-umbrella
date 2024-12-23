# Cautious Umbrella

## O que é

O nome é aleatório e foi gerado pelo próprio GitHub, eu gostei porque esse projeto vai ser um guarda-chuva para outras aplicações que vou hostear e projetos que quero tirar do papel. Também é algo cuidadoso, porque se vou criar um cluster quero que ele siga os mesmos padrões de um ambiente de produção.

## Por quê fazer

São simples 3 motivos:
1. Por educação. Acredito que só aprendemos fazendo e errando;
2. Porque eu moro no brasil e cloud não é tão barata quanto na gringa;
3. Porque é divertido.

## Para que serve

Meus objetivos também são 3:
- Migrar meu self-hosted de docker para o mais robusto **kubernetes** (k3s);
- Ter uma plataforma para realizar o deploy do meu outro projeto [wisdom-core](https://github.com/santanaMd/wisdom-core), uma aplicação dos conceitos de **Data Engineer**;
- Ter menos dor de cabeça com **SPOF** ([Single Point of Failure](https://en.wikipedia.org/wiki/Single_point_of_failure)) no meu homelab.

# Definições do projeto

### Caracteristicas da Infraestrutura
- **OS**: Ubuntu Server 24.04 LTS
- **Hardware**: Raspberry PI 5 e Orange PI 5
- **Número de nós**: 4

## Passos esperados
- Instalação de Docker em grupo **docker-node**
- Criação de Servidor MySQL docker para máquinas do grupo **k3s-database**
- Instalação de nós K3s Server para grupos **server** e **hybrid**
- Instalação de nós K3s Agent para grupos **docker-node** e **worker**
- Aplicação de taints de acordo com especificações de grupo
- LoadBalancer externo Kube-VIP
- Aplicação de configuração de firewall entre os servidores
- Configuração de Armazanamento Distribuído **Long Horn**
- Aplicação do **Fluxo de Monitoração**
- Configuração de Ingress Controler
- Realizar deploy de **PiHole** para filtro de DNS e Local DNS
- Configuração do **Cert Manager** para certificados automatizados
- Implantação de backup em cloud **Amazon S3 Glacier**

## Objetivo final

Configurar automaticamente cluster K3s que apresenta as seguintes características.
- Alta Disponibilidade (HA)
- MySQL como banco de dados do cluster
- LoadBalancer externo Kube-VIP
- Segregação de função de nós
- Compliance com normas de segurança para ambientes de produção
- Backup periódico cloud
- Stack monitoring
- Filtro de DNS e DNS Local
- Certificados válidos e automaticos

## Configuração Ansible

### Grupos de servidores
- docker-node
- server
- worker
- hybrid

### Definição dos grupos

- **docker-node**
    - Responsável por executar serviços docker. Em um deles está o banco de dados MySQL do cluster.
    - Nós nesse grupo não devem executar workload server.
    - Nós desse grupo devem apresentar taint para execução de apenas workloads de monitoramento.

- **server**
    - Nós nesse grupo devem executar apenas workload crítico do kubernetes. Deve ser aplicado taint a fim de garantir o comportamento descrito.
- **worker**
    - Nós nesse grupo devem executar apenas workloads não críticos. Deve ser aplicado taint a fim de garantir o comportamento descrito.
- **hybrid**
    - Nós nesse grupo podem executar workloads sem restrição de criticidade.

## Fluxo Monitoração

### Ferramentas

- **Prometheus**
    - Agregação de métricas
- **cAdvisor**
    - Coleta de métricas de conteiners docker
- **Fluent Bit**
    - Coleta de logs
- **Opensearch**
    - Agregação de logs do Fluent Bit
- **Grafana**
    - Visualização de dados do Prometheus e OpenSearch

## Embasamento do Projeto

O projeto será embasado nas documentações descritas nos links abaixo.

- https://kube-vip.io/docs/usage/k3s/
- https://ranchermanager.docs.rancher.com/how-to-guides/new-user-guides/kubernetes-cluster-setup/k3s-for-rancher
- https://docs.ansible.com/ansible/latest/index.html
- https://longhorn.io/docs/
