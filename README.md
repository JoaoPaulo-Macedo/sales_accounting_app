<h1 align="center"> Acerto de Vendas </h1>

:dollar: Aplicativo pessoal para cálculo e acerto de vendas, com finalidade de facilitar o trabalho em minha empresa pessoal.

* [Tecnologias](#tecnologias)
* [Motivação](#motivação)
* [Funcionalidades](#funcionalidades)
* [Arquitetura](#arquitetura)
  * [Gestão de Estado](#gestão-de-estado)
  * [Injeção de Dependências](#injeção-de-dependências)

# Tecnologias
O projeto foi desenvolvido com **Flutter**, incluindo packages como **shared_preferences**, **flutter_bloc** e **get_it**.

# Motivação
Possuo uma empresa de prestação de serviços na qual promovo a distribuição e venda de produtos. Nesse contexto, semanalmente há a prestação de contas do material distribuído, envolvendo cálculos que incluem comissão da minha empresa, comissão dos meus colaboradores e impostos, além de variáveis como o preço do produto, que varia semanalmente, material vendido, devolvido e extraviado/danificado.
Para facilitar, criei esse aplicativo, oferecendo considerável agilidade, conforto e precisão aos cálculos.

# Funcionalidades
 Primeiro, são informados os campos referentes ao material, como o total em posse, quanto foi vendido, devolvido e extraviado.
 Valores meramente ilustrativos para o exemplo.
 
<div>
 <img src="https://user-images.githubusercontent.com/58576452/168648741-9d6383f5-5c83-4289-8ed6-b5c9e79842cb.gif" alt="vendas" width="150"/>
</div>

Em seguida, são informados os campos referentes ao financeiro.

<div>
 <img src="https://user-images.githubusercontent.com/58576452/168650440-a0c3503d-728b-4f71-851c-b9cecd0b95a1.gif" alt="vendas" width="150"/>
</div>

Por último, é informado o preço de venda do material. 
O cálculo é automático.

# Arquitetura
Em sua arquitetura, foi implementado o **Clean Dart**, proposto pela Flutterando, na qual, resumidamente, temos entities e usecases para a regra de negócio, repositories e datasources para comunicação com serviços.

## Gestão de Estado
Para gestão de estado foi adotado o padrão **Cubit**, do package **flutter_bloc**, devido à sua simplicidade e por atender bem as necessidades do projeto, evitando o boilerplate gerado pelo BLoC tradicional com a criação de classes para gerenciar eventos.

## Injeção de Dependências
A injeção de dependências foi implementada com o package **get_it**.
