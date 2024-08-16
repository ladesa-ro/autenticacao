
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

Nesse sentido, surge a demanda de identificar e representar essas pessoas nesses ambientes virtuais para, dentre outras coisas, reconhecer a autoria de ações e delimitar quais operações cada um pode realizar em diferentes contextos. 

Portanto, é necessário uma solução robusta e confiável que forneça os meios necessários para a correta identificação dos indivíduos, a qual todo o ecossistema possa confiar.

## Propósito

<!-- Dado a necessidade apresentada de gerenciar os perfis de acesso, --> 
Este serviço deve cuidar do credenciamento e checagem de identidade a qualquer outro sistema que queira integrar ao ecossistema do Ladesa.

### Objetivo Geral

### Objetivos Específicos

## Desenvolvimento Local

### Requisitos

Para o desenvolvimento local, é necessário preparar o seu ambiente de trabalho com alguns recursos necessários para mexer com este projeto. 

A seguir, estão listadas as tecnologias que você precisa ter em seu computador antes para prosseguir com sua jornada.

> [!TIP]
> Preparamos dicas e tutoriais para você acerca de cada tópico!
> Basta clicar nos links para saber mais.

- [Acesso à Linha de Comando](https://docs.ladesa.com.br/developers/tutorials/os/command-line/);
- [Git](https://docs.ladesa.com.br/developers/tutorials/source-code/git/);
- [Docker](https://docs.ladesa.com.br/developers/tutorials/platforms/containers/docker/);
- GNU Make;

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
