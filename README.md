# auth

## Ambientes

### Produção

[![CI Production][action-ci-prod-src]][action-ci-prod-href]

### Desenvolvimento

[![CI Development][action-ci-dev-src]][action-ci-dev-href]

## Configuração Local

### Obter o código fonte do projeto

```sh
git clone https://github.com/ladesa-ro/auth.git
cd auth
```

### Serviços do [.devops/development/docker-compose.yml](./.devops/development/docker-compose.yml)

| Host                | Endereço            | Descrição               | Plataforma Base                   |
| ------------------- | ------------------- | ----------------------- | --------------------------------- |
| `ladesa-ro-auth`    | `127.128.5.10:8080` | Aplicação KeyCloak      | `quay.io/keycloak/keycloak:23.0`  |
| `ladesa-ro-auth-db` | `127.128.5.11:5432` | Banco de dados postgres | `docker.io/bitnami/postgresql:15` |

### Scripts Make

O projeto conta com um [arquivo make](./Makefile) que comporta scrips destinados ao desenvolvimento da aplicação.

```Makefile
dev-setup:
  # Configura o ambiente de deselvolvimento, como a criação da rede sisgea-net e os arquivos .env
dev-up:
  # Inicia os containers docker
dev-shell:
  # Inicia os containers docker e abre o bash na aplicação keycloak
dev-down:
  # Para todos os containers
dev-logs:
  # Mostra os registros dos containers
```

## Aplicação KeyCloak

<!-- Badges -->

<!-- Badges / Actions / Production  -->

[action-ci-prod-src]: https://img.shields.io/github/actions/workflow/status/ladesa-ro/auth/ci.yml?style=flat&logo=github&logoColor=white&label=CI@production&branch=production&labelColor=18181B
[action-ci-prod-href]: https://github.com/ladesa-ro/auth/actions/workflows/ci.yml?query=branch%3Aproduction

<!-- Badges / Actions / Development  -->

[action-ci-dev-src]: https://img.shields.io/github/actions/workflow/status/ladesa-ro/auth/ci.yml?style=flat&logo=github&logoColor=white&label=CI@development&branch=main&labelColor=18181B
[action-ci-dev-href]: https://github.com/ladesa-ro/auth/actions/workflows/ci.yml?query=branch%3Amain
