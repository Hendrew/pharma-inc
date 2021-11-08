# Pharma Inc API - Challenge by Coodesh

## Sobre

Sistema reponsável por buscar os dados de usuários na [Random User](https://randomuser.me/documentation#format) uma vez ao dia. Nela é possível, após o registro no banco, fazer modificações nos mesmos.

## Tecnologias usadas

* Ruby 3.0.2
* Rails 6.1.4.1
* PostgreSQL
* Docker

## Como executar o projeto

Faça o clone do repositório e com Docker e Docker Compose instalados, execute no diretório raíz do projeto:

* `docker-compose build` para criar as imagens necessárias
* `docker-compose run web bash` para acessar o `shell` do container já com a aplicação instalada

Dentro desse `shell` você deve configurar o banco de dados antes de executar
outros comandos. Para isso execute:

`rails db:create db:migrate`

Agora você pode sair do container e executar o seguinte comando:

`docker-compose up`

O servidor estará rodando em [localhost:3000](http://localhost:3000)
