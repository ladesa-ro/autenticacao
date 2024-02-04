# sisgea-servc-idp

## Desenvolvimento

```
git clone https://github.com/sisgha/sisgea-servc-idp.git;
cd sisgea-servc-idp;
```

### Serviços do [devops/development/docker-compose.yml](./devops/development/docker-compose.yml)

| Host                  | Endereço            | Descrição               | Plataforma Base                    |
| --------------------- | ------------------- | ----------------------- | ---------------------------------- |
| `sisgea-servc-idp`    | `127.128.5.10:8080` | Aplicação KeyCloak      | `quay.io/keycloak/keycloak:21.1.2` |
| `sisgea-servc-idp-db` | `127.128.5.11:5432` | Banco de dados postgres | `docker.io/bitnami/postgresql:15`  |

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
