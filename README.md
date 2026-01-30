# Pedidos Veloz – Entrega Contínua de Plataforma de Pedidos em Microsserviços

## 1. Introdução

Este projeto foi desenvolvido como atividade acadêmica com o objetivo de aplicar, de forma prática, os conceitos de **DevOps**, **Cloud Native** e **orquestração de containers**, por meio da construção de uma plataforma de pedidos baseada em **microsserviços**.

O cenário simula a empresa fictícia **Loja Veloz**, um e-commerce de médio porte que enfrenta desafios relacionados a deploys arriscados, baixa escalabilidade e dificuldade de diagnóstico em produção. Para resolver esses problemas, foi proposta uma arquitetura moderna utilizando Docker, Kubernetes, CI/CD e práticas de observabilidade.

---

## 2. Objetivo Geral

Desenhar e implementar uma solução fim a fim (do desenvolvimento local à produção) que demonstre boas práticas de **Cloud DevOps**, reduzindo riscos de deploy, aumentando a confiabilidade do sistema e permitindo escalabilidade sob demanda.

### Objetivos Específicos

* Padronizar o ambiente de desenvolvimento local com Docker Compose
* Conteinerizar microserviços seguindo boas práticas
* Orquestrar os serviços em Kubernetes
* Aplicar conceitos de entrega contínua (CI/CD)
* Demonstrar estratégias de deploy e escalabilidade
* Organizar a infraestrutura de forma reprodutível

---

## 3. Fundamentação Teórica (Resumo)

### 3.1 Arquitetura de Microsserviços

A arquitetura de microsserviços divide uma aplicação em serviços pequenos, independentes e fracamente acoplados, permitindo escalabilidade individual, deploys independentes e maior resiliência.

### 3.2 Docker e Conteinerização

O Docker permite empacotar aplicações e suas dependências em containers, garantindo portabilidade e consistência entre ambientes. Cada microserviço deste projeto é executado em um container independente.

### 3.3 Kubernetes

O Kubernetes é responsável pela orquestração dos containers em ambiente distribuído, oferecendo recursos como autoescala, balanceamento de carga, reinício automático e gerenciamento de configuração.

### 3.4 CI/CD

A entrega contínua automatiza o processo de build, testes e deploy, reduzindo falhas humanas e acelerando o tempo de entrega.

### 3.5 Observabilidade

Observabilidade é a capacidade de entender o estado interno do sistema por meio de métricas, logs e traces, sendo essencial em arquiteturas distribuídas.

---

## 4. Arquitetura da Solução

A aplicação **Pedidos Veloz** é composta pelos seguintes microserviços:

* **Serviço de Pedidos**: criação e consulta de pedidos
* **Serviço de Estoque**: controle e reserva de produtos
* **Serviço de Pagamentos**: simulação de processamento de pagamentos

Cada serviço é stateless, conforme os princípios do **12-Factor App**, e se comunica via HTTP.

---

## 5. Tecnologias Utilizadas

* Python 3
* Docker
* Docker Compose
* Kubernetes
* YAML
* Git e GitHub

---

## 6. Estrutura do Projeto

```
pedidos-veloz/
│
├── docker-compose.yml
├── pedidos/
│   ├── Dockerfile
│   ├── app.py
│   └── requirements.txt
├── estoque/
│   ├── Dockerfile
│   ├── app.py
│   └── requirements.txt
├── pagamentos/
│   ├── Dockerfile
│   ├── app.py
│   └── requirements.txt
├── k8s/
│   ├── pedidos-deployment.yaml
│   ├── pedidos-service.yaml
│   ├── estoque-deployment.yaml
│   ├── estoque-service.yaml
│   ├── pagamentos-deployment.yaml
│   └── pagamentos-service.yaml
└── README.md
```

---

## 7. Ambiente Local – Docker Compose

O ambiente de desenvolvimento local é padronizado utilizando **Docker Compose**, permitindo que todos os serviços sejam executados com um único comando:

```bash
docker compose up -d --build
```

Essa abordagem garante reprodutibilidade e facilidade de setup para novos desenvolvedores.

---

## 8. Kubernetes – Ambiente de Produção

Os manifests Kubernetes incluem:

* Deployments
* Services
* Separação por microserviço

A aplicação pode ser implantada com:

```bash
kubectl apply -f k8s/
```

Essa estrutura permite escalabilidade, isolamento e gerenciamento centralizado dos serviços.

---

## 9. Estratégias de Deploy e Escalabilidade

* **Deploy**: estratégia Rolling Update (padrão do Kubernetes), reduzindo indisponibilidade
* **Escalabilidade**: conceito preparado para uso de HPA, com base em métricas de CPU/memória

---

## 10. Observabilidade (Proposta)

A observabilidade pode ser implementada com:

* Métricas: Prometheus
* Visualização: Grafana
* Logs: stdout/stderr (padrão cloud-native)
* Tracing distribuído: OpenTelemetry (proposta conceitual)

---

## 11. Conclusão

O projeto **Pedidos Veloz** demonstra, de forma integrada, a aplicação de conceitos modernos de DevOps e Cloud Native. A solução proposta atende aos requisitos de escalabilidade, confiabilidade e automação exigidos em ambientes corporativos, cumprindo integralmente os objetivos acadêmicos definidos para a atividade.

---

📌 *Projeto desenvolvido para fins acadêmicos – Arquitetura Cloud
