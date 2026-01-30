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

A estrutura abaixo representa **exatamente** a organização atual do repositório, incluindo pipeline CI/CD, infraestrutura como código (Terraform), Kubernetes e microserviços.

```
pedidos-veloz/
│
├── .github/
│   └── workflows/
│       └── ci-cd.yml            # Pipeline de CI/CD (GitHub Actions)
│
├── infra/                       # Infraestrutura como Código (Terraform)
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── README.md
│
├── k8s/                         # Manifests Kubernetes
│   ├── namespace.yaml
│   ├── configmap.yaml
│   ├── secrets.yaml
│   ├── hpa/
│   │   └── pedidos-hpa.yaml
│   ├── pedidos/
│   │   ├── deployment.yaml
│   │   └── service.yaml
│   └── postgres/
│       ├── deployment.yaml
│       └── service.yaml
│
├── services/                    # Microserviços da aplicação
│   ├── pedidos/
│   │   ├── app.py
│   │   ├── Dockerfile
│   │   └── requirements.txt
│   ├── estoque/
│   │   ├── app.py
│   │   ├── Dockerfile
│   │   └── requirements.txt
│   └── pagamentos/
│       ├── app.py
│       ├── Dockerfile
│       └── requirements.txt
│
├── docker-compose.yml            # Ambiente local padronizado
└── README.md                    # Documentação principal
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

* **Deploy**: estratégia Rolling Update (padrão do Kubernetes), reduzindo indisponibilidade durante atualizações
* **Escalabilidade**: conceito preparado para uso de HPA (Horizontal Pod Autoscaler), com base em métricas de CPU/memória

---

## 10. Segurança da Aplicação e da Infraestrutura

A segurança foi considerada desde o desenvolvimento até a execução em produção, seguindo boas práticas de ambientes cloud-native.

### 10.1 Segurança em Containers

* Uso de imagens base oficiais e enxutas
* Containers executados como **usuário não-root** (boa prática recomendada pelo Docker)
* Cada microserviço isolado em seu próprio container
* Redução da superfície de ataque ao conter apenas dependências necessárias

### 10.2 Segurança no Kubernetes

* Isolamento de serviços por meio de **Pods** e **Services**
* Possibilidade de aplicação de **Pod Security Admission** (baseline), restringindo privilégios elevados
* Uso de **readiness e liveness probes** para evitar que containers defeituosos recebam tráfego

### 10.3 Configurações e Segredos

* Variáveis de ambiente separadas do código-fonte
* Conceito preparado para uso de **ConfigMaps** (configurações não sensíveis)
* Conceito preparado para uso de **Secrets** (credenciais e dados sensíveis)

Essa abordagem reduz riscos de vazamento de informações sensíveis e melhora a governança do ambiente.

---

## 11. Observabilidade (Proposta)

A observabilidade pode ser implementada com:

* Métricas: Prometheus
* Visualização: Grafana
* Logs: stdout/stderr (padrão cloud-native)
* Tracing distribuído: OpenTelemetry (proposta conceitual)

---

## 12. Conclusão

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

📌 *Projeto desenvolvido para fins acadêmicos – Arquitetura Cloud DevOps.*
