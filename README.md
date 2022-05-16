<h1 align="center"> Acerto de Vendas </h1>

:dollar: Aplicativo pessoal para cálculo e acerto de vendas, com finalidade de facilitar o trabalho em minha empresa pessoal.

* [Tecnologias](#tecnologias)
* [Motivação](#motivação)
* [Arquitetura](#arquitetura)
  * [Gestão de Estado](#gestão-de-estado)
  * [Injeção de Dependências](#injeção-de-dependências)
* [Funcionalidades](#funcionalidades)

# :computer: Tecnologias
O projeto foi desenvolvido com **Flutter**, incluindo packages como **shared_preferences**, **flutter_bloc** e **get_it**.

# :muscle: Motivação
Possuo uma empresa de prestação de serviços na qual promovo a distribuição e venda de produtos. Nesse contexto, semanalmente há a prestação de contas do material distribuído, envolvendo cálculos que incluem comissão da minha empresa, comissão dos meus colaboradores e impostos, além de variáveis como o preço do produto, que varia semanalmente, material vendido, devolvido e extraviado/danificado.
Para facilitar, criei esse aplicativo, oferecendo considerável agilidade, conforto e precisão aos cálculos.

# :triangular_ruler: Arquitetura
Em sua arquitetura, foi implementado o [**Clean Dart**](https://github.com/Flutterando/Clean-Dart) proposto pela **Flutterando** como implementação da **Clean Architechture** no Flutter. Esse modelo pode ser divido do seguinte modo:
* Entities como regras de negócio da empresa ou organização.
* Usecases como regras de negócio da aplicação.
* Repositories e Datasources para comunicação com serviços.

Além disso, o Clean Architecture propõe o conjunto de princípios conhecido como **SOLID**.

## :clapper: Gestão de Estado
Para gestão de estado foi adotado o padrão **Cubit**, do package **flutter_bloc**, devido à sua simplicidade e por atender bem as necessidades do projeto, evitando o boilerplate gerado pelo BLoC tradicional com a criação de classes para gerenciar eventos.

## :syringe: Injeção de Dependências
A injeção de dependências foi implementada com o package **get_it**.

# :pencil: Funcionalidades
 Primeiro, são informados os campos referentes ao material, como o total em posse, quanto foi vendido, devolvido e extraviado.
 Valores meramente ilustrativos para o exemplo.
<div>
 <img src="https://user-images.githubusercontent.com/58576452/168648741-9d6383f5-5c83-4289-8ed6-b5c9e79842cb.gif" alt="vendas" width="180"/>
</div>

Em seguida, são informados os campos referentes ao financeiro.

<div>
 <img src="https://user-images.githubusercontent.com/58576452/168650440-a0c3503d-728b-4f71-851c-b9cecd0b95a1.gif" alt="vendas" width="180"/>
</div>

Por último é informado o preço de venda do material.

<div>
 <img src="https://user-images.githubusercontent.com/58576452/168650835-1b9f2399-1f14-4ed1-b359-f99716a71a76.gif" alt="vendas" width="180"/>
</div>

É possível fazer alterações, o cálculo é automático.

<div>
 <img src="https://user-images.githubusercontent.com/58576452/168651320-f893739e-1661-4d04-bad9-82c49ef7c454.gif" alt="vendas" width="180"/>
</div>
