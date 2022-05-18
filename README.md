<h1 align="center"> Acerto de Vendas </h1>

<div align="center">
:dollar: Aplicativo para cálculo e acerto de vendas, com finalidade de facilitar o trabalho na empresa na qual trabalhei. :dollar:
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
O projeto foi desenvolvido com **Flutter**, e inclui packages como **shared_preferences**, **flutter_bloc** e **get_it**.

# :muscle: Motivação
Trabalhei em uma empresa de prestação de serviços a qual promovia distribuição e venda de produtos. Nesse contexto, semanalmente havia a prestação de contas do material distribuído, envolvendo cálculos que incluem comissão da empresa, comissão dos colaboradores e impostos, além de variáveis como o preço do produto, que varia semanalmente, material vendido, devolvido e extraviado/danificado.
Para facilitar, criei esse aplicativo, oferecendo considerável agilidade, conforto e precisão aos cálculos.

# :triangular_ruler: Arquitetura
Em sua arquitetura, foi implementado o [**Clean Dart**](https://github.com/Flutterando/Clean-Dart) proposto pela **Flutterando** como implementação da **Clean Architecture** no Flutter. Esse modelo pode ser dividido do seguinte modo:
* **Presentation** (UI, Flutter, Controllers, State Manager, etc).
* **Domain** (apenas regras de negócios).
  * Entities: regras de negócio da empresa.
  * Usecases: regras de negócio da aplicação.
  * Interfaces/contratos de Repositories.
* **Data**
  * Implementação de Repositories.
  * Tratamento dos dados externos.
  * Interfaces/contratos de DataSources.
* **External**
  * Implementação de DataSources.
  * Acessos externos que dependem de packages, drivers, APIs, etc.

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
* Há tratamento de erros, sendo eles mostrados ao usuário através de um SnackBar na parte inferior.

Veja o vídeo exemplo a seguir:
[Video from YouTube](https://youtu.be/RR8lL_BUnvY)

* Os campos "Total de Cartelas", "Imposto" e "Ajuda de Custo" são comuns a todas as semanas, sendo por isso salvos no aparelho. O processo de salvamento é mostrado ao usuário por um indicador de progresso, como demonstrado em vídeo.
