🧠 O que é Clean Architecture?

Clean Architecture é uma forma de organizar o seu código para que ele seja:

Desacoplado: uma parte não depende diretamente da outra.
Testável: mais fácil de testar regras de negócio.
Escalável: você consegue crescer o app sem virar uma bagunça.
Manutenível: fica claro onde mudar o quê.
Ela separa o app em camadas, cada uma com responsabilidade única.



Camadas da Clean Architecture


[ UI (SwiftUI) ] <--> [ ViewModel ] <--> [ UseCases ] <--> [ Repository Interface ] <--> [ Repository Implementation ]

