# Cautious-umbrella

![GitHub last commit](https://img.shields.io/github/last-commit/santanaMd/cautious-umbrella)
![GitHub issues](https://img.shields.io/github/issues/santanaMd/cautious-umbrella)
![License](https://img.shields.io/github/license/santanaMd/cautious-umbrella)

Automatização completa para criação e configuração de clusters **K3s ARM64** com Ansible, projetada para dispositivos como Raspberry Pi e Orange Pi. O projeto inclui scripts de provisionamento, suporte a **Longhorn** para armazenamento distribuído e otimizações de rede para cenários leves e escaláveis.

## 🚀 Visão Geral

O **Cautious-umbrella** é ideal para:
- Configuração rápida de clusters ARM64 para Kubernetes.
- Homelabs ou ambientes de teste e aprendizado.
- Ambientes distribuídos que necessitam de armazenamento eficiente e otimizado.

## 🛠️ Funcionalidades

- **Provisionamento automatizado**: Scripts Ansible para configurar nós com facilidade.
- **Suporte a Longhorn**: Armazenamento distribuído integrado para alta disponibilidade.
- **Cluster K3s ARM64 leve e otimizado**: K3s é uma distribuição de Kubernetes lightweight, projetada para rodar em dispositivos de menor capacidade, como Raspberry Pi e Orange Pi, proporcionando alto desempenho com um footprint reduzido.

## 🖥️ Requisitos

- A preencher
  
## 📦 Instalação

1. Clone este repositório:
    ```bash
    git clone https://github.com/santanaMd/cautious-umbrella.git
    cd cautious-umbrella
    ```

2. Instale as dependências no controlador:
    ```bash
    pip install -r requirements.txt
    ```

3. Edite o arquivo `inventory.ini` para configurar os dispositivos.

4. Execute o playbook:
    ```bash
    ansible-playbook -i inventory.ini setup_cluster.yml
    ```

## 📚 Documentação

- A preencher

## 🌐 Contribuições

Sinta-se à vontade para contribuir! Consulte o [CONTRIBUTING.md](./CONTRIBUTING.md) para mais informações.

## ⚖️ Licença

Este projeto é licenciado sob os termos da [Licença MIT](./LICENSE).
