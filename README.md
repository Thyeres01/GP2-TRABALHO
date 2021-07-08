# Projeto GP2

## Para rodar o projeto

### Para fazer clone.

`git clone https://github.com/INTEGRANTE01/GP2-TRABALHO.git`

### Para executar a aplicação via console (necessario Maven instalado)

`mvn tomcat7:run`

### Para executar a aplicação no Eclipse

`Importa aplicação como projeto maven e inserir parametro tomcat7:run no MavenBuild...`

## Para acessar a aplicação

`http://localhost:9090/endemias` em qualquer navegador.

## Banco de Dados

A aplicação exige instalação prévia no MySQL e o arquivo de conexão com o banco de dados está em: `GP-TRABALHO\src\main\java\model\ConectaBanco.java`

*Atenção ao usuario root e sua senha

O script de banco de dados populado está em: `GP2-TRABALHO\src\main\webapp\bd\dbendemic.sql`
