# Github Users App

GitHub Users App é um aplicativo mobile desenvolvido em Swift utilizando UIKit que permite a consulta de usuários do GitHub e seus repositórios. A aplicação faz requisições à API do GitHub para listar usuários, exibir detalhes de cada usuário e listar seus repositórios. O projeto foi construído com base na arquitetura MVVM-C e inclui testes unitários feitos com XCTest.

## Funcionalidades
- Listagem de Usuários: Exibe uma lista de usuários do GitHub obtidos via requisição à API pública do GitHub.
- Detalhes do Usuário: Com um toque em um usuário da lista, o app é direcionado para uma tela que exibe os detalhes deste usuário.
- Listagem de Repositórios: Na tela de detalhes do usuário, também é possível visualizar uma lista de seus repositórios.
- Ir para a página do perfil do usuário: Ao tocar no botão "Profile", o app é direcionado para a página do perfil deste usuário.

## Tecnologias Utilizadas
- Swift: Linguagem de programação.
- UIKit: Framework para construção da interface gráfica.
- Alamofire: Biblioteca utilizada para realizar as requisições HTTP.
- MVVM-C (Model-View-ViewModel-Coordinator): Padrão de arquitetura utilizado para separar responsabilidades e facilitar a manutenção do código.
- XCTest: Framework utilizado para a criação de testes unitários.
- View Code: Toda a interface foi construída programaticamente, sem o uso de Storyboards.
- Localizable.strings: Utilizado para a internacionalização de strings.

## Requisitos para rodar a aplicação

- XCode versão 14 ou superior
- Versão do iOS 16.0 ou superior
- Cocoapods configurado

## Como rodar

- Clonar este repositório
- Por meio do terminal, ir até a pasta onde o arquivo "Podfile" está presente e utilizar o comando "pod install".
- Abrir o arquivo xcworkspace pelo XCode
- Clicar em "Run"
- Fazer a navegação pelo simulador.
