<h1 align="center"> Acerto de Vendas </h1>

<div align="center">
:dollar: Aplicativo para cálculo e acerto de vendas, com finalidade de facilitar o trabalho em meus negócios pessoais. :dollar:
</div>
<br>
<div align="center">
 <img src="https://user-images.githubusercontent.com/58576452/168679100-c8f551a8-9dbe-4224-9162-bc67456a1997.png" alt="vendas" width="250"/>
</div>

---

* [Tecnologias](#computer-tecnologias)
* [Motivação](#muscle-motivação)
* [Arquitetura](#triangular_ruler-arquitetura)
  * [Gestão de Estado](#clapper-gestão-de-estado)
  * [Injeção de Dependências](#syringe-injeção-de-dependências)
* [Funcionalidades](#pencil-funcionalidades)

# :computer: Tecnologias
O projeto foi desenvolvido com **Flutter**, incluindo packages como **shared_preferences**, **flutter_bloc** e **get_it**.

# :muscle: Motivação
Possuo uma empresa de prestação de serviços na qual promovo a distribuição e venda de produtos. Nesse contexto, semanalmente há a prestação de contas do material distribuído, envolvendo cálculos que incluem comissão da minha empresa, comissão dos meus colaboradores e impostos, além de variáveis como o preço do produto, que varia semanalmente, material vendido, devolvido e extraviado/danificado.
Para facilitar, criei esse aplicativo, oferecendo considerável agilidade, conforto e precisão aos cálculos.

# :triangular_ruler: Arquitetura
Em sua arquitetura, foi implementado o [**Clean Dart**](https://github.com/Flutterando/Clean-Dart) proposto pela **Flutterando** como implementação da **Clean Architecture** no Flutter. Esse modelo pode ser dividido do seguinte modo:
* Entities como regras de negócio da empresa ou organização.
* Usecases como regras de negócio da aplicação.
* Repositories e Datasources para comunicação com serviços e demais tratamentos.

Além disso, o Clean Architecture propõe o conjunto de princípios conhecido como **SOLID**.

## :clapper: Gestão de Estado
Para gestão de estado foi adotado o **Cubit** do package **flutter_bloc**. A escolha se deu devido à sua simplicidade e agilidade na implementação, evitando o boilerplate gerado pelo BLoC tradicional com a criação de classes para gerenciar eventos, atendendo bem às necessidades do projeto.

## :syringe: Injeção de Dependências
A injeção de dependências foi implementada com o package **get_it**. Escolhido por ser um package simples que atende bem as demandas do aplicativo, contribuindo na implementação do princípio SOLID da inversão de dependências.

# :pencil: Funcionalidades
1. Informe os campos referentes ao material (total em posse, venda, devolução e faltas).
2. Informe os campos referentes ao financeiro.
3. Informe o preço de venda do material.
* O cálculo é automático assim que todos os campos obrigatórios são informados.
* Há tratamento de erros, sendo eles mostrados ao usuário com um SnackBar na parte inferior.

Veja o vídeo exemplo a seguir:
[Video from YouTube](https://youtube.com/shorts/_f7lDF6bzig?feature=share)

* Os campos "Total de Cartelas", "Imposto" e "Ajuda de Custo" são comuns a todas as semanas, sendo então salvos no aparelho. O processo de salvamento é mostrado ao usuário por um indicador de progresso, como demonstrado em vídeo.

Observações:
* Valores meramente ilustrativos para o exemplo.
