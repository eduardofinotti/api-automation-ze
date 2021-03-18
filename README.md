# Testes autoamtizafos para a API openweathermap

Projeto de exemplo para implementação de testes para API's Rest utilizando o HTTParty + Rspec + Rake

## Ferramentas utilizadas:
- [VSCode](https://code.visualstudio.com/ "VSCode")
- [HTTParty](https://github.com/jnunemaker/httparty "HTTParty")
- [Rspec](https://github.com/rspec/rspec "Rspec")
- [Rake](https://github.com/ruby/rake "Rake")

## Recursos utilizados no projeto
- **Rspec**
	- describe
	- it
	- expect
- **Httparty**
	- get
- **Rake**
    - Task

## Tutorial, Instalação e execução

#### **Ter previamente o ruby instalado em sua máquina**
**Windows:** [Ruby Installer](https://rubyinstaller.org/  "Ruby Installer")
**Unix Based:** ["Ruby for Unix Based"](https://www.ruby-lang.org/pt/documentation/installation/ "Ruby for Unix Based")

#### Instalar o bundler
`gem install bundler`

`bundle install`

####  Para executar os testes: 
`rake spec CITY=<cidade>,<country>` 

Exemplo: `rake spec CITY=London,uk` 

Observação: Para esta API é necessário enviar uma key de usuário. Uma key ja está setada no arquivo de testes. Caso aconteça erro 401 em todas as chamadas,será necessário cadastrar um novo usuario em https://home.openweathermap.org/users/sign_in e pegar o user key.
