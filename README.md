# Cautious Umbrella

## O que é

O nome é aleatório e foi gerado pelo próprio GitHub, eu gostei porque esse projeto vai ser um guarda-chuva para outras aplicações que vou hostear e projetos que quero tirar do papel. ~~Também é algo cuidadoso, porque se vou criar um cluster quero que ele siga os mesmos padrões de um ambiente de produção.~~

Bem, a implementação em cluster é algo do passado. Estou migrando minha infra de arm64 para amd64. Estou com uma única máquina mais parruda, agora é um "cluster" single node.

## Por quê fazer

São simples 3 motivos:
1. Por educação. Acredito que só aprendemos fazendo e errando;
2. Porque eu moro no Brasil e cloud não é tão barata quanto na gringa;
3. Porque é divertido.

## Para que serve

Meus objetivos também são 3:
- Migrar meu self-hosted de docker para o mais robusto **kubernetes** (k3s);
- Ter uma plataforma para realizar o deploy do meu outro projeto [wisdom-core](https://github.com/santanaMd/wisdom-core), uma aplicação dos conceitos de **Data Engineer**;
- ~~Ter menos dor de cabeça com **SPOF** ([Single Point of Failure](https://en.wikipedia.org/wiki/Single_point_of_failure)) no meu homelab.~~

# Definições do projeto

### Caracteristicas da Infraestrutura
- **OS**: Ubuntu Server 24.04 LTS (via ProxMox)
- **CPU**: 12 x AMD Ryzen 5 7600X 6-Core Processor
- **RAM**: 56.00 GiB DDR5
- **GPU**: ZOTAC RTX 3060 Twin Edge


## O que já foi implementado

- Infra Proxmox para virtualização
- Criação e configuração de server singlenode]
- Implantação de docker swarm
- Implantação de k3s
- Implantação kube-vip (pensando em expansão futura)
- Implementação Ingress Traefik 3 (pelo suporte à Kubernetes Gateway)
- Implantação Cert Manager
- Implantação Kube Prometheus Stack

## O que falta implementar

- Pterodactyl
- Syncthing
- Bancos de dados SQL e NoSQL
- Apache Airflow
- Apache Superset

## Embasamento do Projeto

O projeto será embasado nas documentações descritas nos links abaixo.

- https://kube-vip.io/docs/usage/k3s/
- https://ranchermanager.docs.rancher.com/how-to-guides/new-user-guides/kubernetes-cluster-setup/k3s-for-rancher
- https://docs.ansible.com/ansible/latest/index.html
- https://longhorn.io/docs/
