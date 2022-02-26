# README

# Descrição do Teste
Create a web crawler to search for a phrase at http://quotes.toscrape.com/.
The information coming from the crawler must be made available by an API. This API should receive as
parameter a tag and search for phrases that match this tag.
The information extracted from the site must be saved in MongoDB, which will simulate a cache, where if the tag is already
has been searched, it should return the data previously persisted in the database.
Things you may want to cover:

# Bibliotecas Utilizadas
## Framework de Desenvolvimento
[RubyOnRails](https://rubyonrails.org/)

# Banco de dados Relacional
[MongoDB](https://www.mongodb.com/)

# Instalação de dependências
after cloning the project, in your terminal run:
```bash
bundle install
```
then run:
