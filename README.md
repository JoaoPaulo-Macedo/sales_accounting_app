<h1 align="center"> Acerto de Vendas </h1>

# Motivação
Possuo uma empresa de prestação de serviços na qual promovo a distribuição e venda de produtos. Nesse contexto, semanalmente há a prestação de contas do material distribuído, envolvendo cálculos que incluem comissão da minha empresa, comissão dos meus colaboradores e impostos, além de variáveis como o preço do produto, que varia semanalmente, material vendido, devolvido e extraviado/danificado.
Para facilitar, criei esse aplicativo, oferecendo considerável agilidade, conforto e precisão aos cálculos.

# Tecnologias
O projeto foi desenvolvido com Flutter, incluindo packages como shared_preferences, flutter_bloc e get_it.

# Arquitetura
Em sua arquitetura, foi implementado o Clean Dart, proposto pela Flutterando, na qual, resumidamente, temos entities e usecases para a regra de negócio, repositories e datasources para comunicação com serviços. 
## Gestão de Estado
Para gestão de estado foi adotado o padrão Cubit, do package flutter_bloc, devido à sua simplicidade e por atender bem as necessidades do projeto, evitando o boilerplate gerado pelo BLoC tradicional com a criação de classes para gerenciar eventos.
