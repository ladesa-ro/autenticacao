
<h1 align="center">Autenticação do Ladesa</h1>

<p align="center">Fornece recursos de login, recuperação de acesso e checagem de identidade de uma forma muito doce 💝.</p>

<div align="center">
  <a href="https://github.com/ladesa-ro/auth/actions/workflows/ci.yml?query=branch%3Amain">
    <img alt="CI Development" src="https://img.shields.io/github/actions/workflow/status/ladesa-ro/auth/ci.yml?style=flat&logo=github&logoColor=white&label=development&branch=main&labelColor=18181B" />
  </a>
  
  <a href="https://github.com/ladesa-ro/auth/actions/workflows/ci.yml?query=branch%3Aproduction">
    <img alt="CI Development" src="https://img.shields.io/github/actions/workflow/status/ladesa-ro/auth/ci.yml?style=flat&logo=github&logoColor=white&label=production&branch=production&labelColor=18181B" />
  </a>
  
</div>

## Motivação

Os sistemas do Ladesa, assim como muitos aplicativos informáticos modernos, trabalham com a interação entre humanos e máquinas. 

Nesse sentido, surge a demanda de identificar e representar essas pessoas nessas plataformas para, dentre outras coisas, reconhecer a autoria de ações e delimitar quais operações cada um pode realizar em diferentes contextos. 

Dado a problemática de credenciamento de perfis apresentada, este serviço surge para gerenciar o credenciamento e checagem de identidade a qualquer sistema que queira integrar ao ecossistema do Ladesa.

<!--
(como adminstradores e usuários não privilegiados)
de modo a possibilitar o controle de níveis de acesso, tal como adminstradores, usuários não pivilegiados.
-->

## Desenvolvimento Local

### Obter o código fonte do projeto

O primeiro passo para trabalhar com o serviço de Autenticação do Ladesa é obter uma cópia dos arquivos deste repositório. 

Por meio dos comandos a seguir, você terá em sua máquina de desenvolvimento o acesso ao repositório deste projeto:

```sh
git clone https://github.com/ladesa-ro/auth.git
cd auth
```

### Serviços do [.devops/development/docker-compose.yml](./.devops/development/docker-compose.yml)

| Host                | Endereço                                                                       | Porta Alvo | Descrição               | Plataforma Base                   |
| ------------------- | ------------------------------------------------------------------------------ | ---------- | ----------------------- | --------------------------------- |
| `ladesa-ro-auth`    | `localhost:23032` (mapeamento direto); `sso.ladesa.localhost` (proxy reverso); | `8080`     | Aplicação KeyCloak      | `quay.io/keycloak/keycloak:25.0`  |
| `ladesa-ro-auth-db` | `127.128.5.11:5432`                                                            | `5432`     | Banco de dados postgres | `docker.io/bitnami/postgresql:15` |

### Scripts Make

O projeto conta com um [arquivo make](./Makefile) que comporta scrips destinados ao desenvolvimento da aplicação.

```Makefile
setup:
  # Configura o ambiente de deselvolvimento, como a criação da rede ladesa-net e os arquivos .env
up:
  # Inicia os containers docker
shell:
  # Inicia os containers docker e abre o bash na aplicação keycloak
down:
  # Para todos os containers
logs:
  # Mostra os registros dos containers
```
