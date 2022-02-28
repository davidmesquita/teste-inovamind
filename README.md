# README

# Descrição do Teste
Crie um web crawler para efetuar uma busca de frases no site http://quotes.toscrape.com/.
As infomações vindas do crawler devem ser disponibilizadas por uma API. Esta API deve receber como
parâmetro uma tag e buscar por frases que estejam classificadas de acordo com esta tag.
As informações extraidas do site devem ser salvas no MongoDB que simulará um cache, onde caso a tag já
tenha sido pesquisada, deverá retornar os dados persistidos previamente no banco de dados


# Particularidades da solução

Para fazer o mapeamento da solução foi criado um serializer ```QuotesSerializer``` que ficou responsável por todo o mapeado da estrura fornecida descrita abaixo.
```
{
  "quotes": [
    {
    "quote": "frase",
    "author": "nome do autor",
    "author_about": "link para o perfil do autor",
    "tags": ["tag1", "tag2"]
    }
  ] 
}
```

O crawler foi implementado através de uma rake task, que faz o scraping dos dados fornecidos na página inicial do http://quotes.toscrape.com. Mais informações no tópico de [instalação das dependências]()

# Bibliotecas Utilizadas
Foi utilizado o [Ruby](https://www.ruby-lang.org/en/news/2019/12/25/ruby-2-7-0-released/) na versão 2.7.0

## Framework de Desenvolvimento
Foi utilizado o [RubyOnRails](https://rubyonrails.org/) na versão 6.0.4

## Banco de dados
Durante todo desenvolvimento da aplicação foi utilizado o [mongoatlas]() que é a solução online do [MongoDB](https://www.mongodb.com/).

## Instalação de dependências

after cloning the project, in your terminal run:
```bash
bundle install
```
agora execute:
```
rake crawler:quotes
```
e aguarde até aparecer a mensagem de sucesso "```Quotes was save with sucessfully ✅```"

agora inicie o servidor local com o comando:
```
rails s
```
## Para consumir a API foi utilizado o [Postman](https://www.postman.com/)

utilizando o metodo POST acesse a seguinte rota para gerar um token de acesso para a API:
```
http://localhost:3000/tokens
```
Agora com o token de acesso, acesse a rota: 
```
http://localhost:3000/quotes/
```
va em Headers e adicione a chave ``` Authorization``` e no valor da chave coloque o token gerado na rota ```http://localhost:3000/tokens``` caso contrario a API retornara ```Token not found```

agora em Params passe o parametro ```seach_tag``` e no valor passando a tag a ser pesquisada:

passando o valor ```change``` na ```search_tag``` é retornado o seguinte JSON:
```
{
        "_id": {
            "$oid": "621a6d3893fc6d82785d2e68"
        },
        "author": "Albert Einstein",
        "author_about": "/author/Albert-Einstein",
        "quote": "“The world as we have created it is a process of our thinking. It cannot be changed without changing our thinking.”",
        "tags": [
            "change",
            "deep-thoughts",
            "thinking",
            "world"
        ]
    },
```

