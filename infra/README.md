# Infraestrutura como Código – Pedidos Veloz

Este diretório contém um esqueleto de Infraestrutura como Código (IaC)
utilizando Terraform.

## Objetivo
Demonstrar como a infraestrutura Kubernetes da aplicação poderia ser
provisionada de forma automatizada e reproduzível em ambientes cloud-native.

## Escopo
- Definição de providers
- Versionamento de dependências
- Criação de namespace Kubernetes

A aplicação completa (Deployments, Services, ConfigMaps, Secrets e HPA)
é aplicada via manifests YAML, mantendo separação clara entre infraestrutura
e aplicação.
