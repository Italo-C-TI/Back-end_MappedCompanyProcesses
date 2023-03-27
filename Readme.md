# Mapped Procedures App

Uma ferramenta que mapeia os processos e subprocessos de uma empresa dentro
de cada área, permitindo o cadastro de processos com as informações necessárias para trazer benefícios a organização.

## Autor

- [@Italo-C-TI](https://www.github.com/Italo-C-TI)

## Stack utilizada

**Back-End:** Node / Typescript / Docker /Prisma / fastify
**Database:** PostgresSql / Docker / Prisma

## Testar aplicação funcionado através do docker-compose

- Link para instalação do docker: https://docs.docker.com/get-docker/
- Entre na pasta rais do projeto e escreva o seguinte comando no terminal para startar a aplicação junto ao banco de dados:

```bash
docker-compose up
```

- O acesso se dá em http://localhost:3000/
- Ao finalizar utilize o seguinte comando para parar a aplicação:

```bash
docker-compose down
```

## Observação

- Vai ser disponibilizado na raiz do projeto um arquivo para ser importado no insomnia ( Insomnia_procedures_mapping.json ) para facilitar testar a aplicação
- Link para download do Insomnia : https://insomnia.rest/download

## RFs (Requisitos funcionais)

- [x] Deve ser possível cadastrar e atualizar a área especifica
- [x] Deve ser possível cadastrar e atualizar procedimentos em uma área especifica
- [x] Deve ser possível cadastrar procedimentos em procedimentos sem limitação
- [x] Deve ser possível visualizar e obter detalhes das aréas e dos prodimentos

## RNs (Regras de negócio)

## RNFs (Regras não funcionais)

- [x] Os dados da aplicação devem estar persistidos em um banco de dados
- [x] O projeto deve ser dockerizado
