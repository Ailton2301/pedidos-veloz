terraform {
  required_version = ">= 1.5.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25"
    }
  }
}

provider "kubernetes" {
  # Configuração seria feita via kubeconfig
}

resource "kubernetes_namespace" "pedidos_veloz" {
  metadata {
    name = "pedidos-veloz"
  }
}
