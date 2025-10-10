# fiap_farms

## Como Rodar o Projeto

Para rodar este projeto Flutter, siga os passos abaixo:

1.  **Pré-requisitos:** Certifique-se de ter o Flutter SDK instalado e configurado em sua máquina. Você pode encontrar instruções de instalação e configuração na [documentação oficial do Flutter](https://flutter.dev/docs/get-started/install).

2.  **Clonar o Repositório:** Se você ainda não o fez, clone este repositório para sua máquina local.

3.  **Instalar Dependências:** Navegue até o diretório raiz do projeto no terminal e execute o comando para instalar todas as dependências:
    ```bash
    flutter pub get
    ```

4.  **Gerar Código (se necessário):** Se houver arquivos `.g.dart` ou `.freezed.dart` faltando ou se você modificou arquivos que requerem geração de código (como `json_serializable` ou `mobx_codegen`), execute:
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

5.  **Rodar o Aplicativo:** Conecte um dispositivo (físico ou emulador) ou selecione um navegador e execute o aplicativo:
    ```bash
    flutter run
    ```
    Você também pode rodar o aplicativo a partir do seu IDE (VS Code, Android Studio) usando o botão "Run" ou "Debug".

## Arquitetura e Estrutura do Projeto

Este projeto segue os princípios da **Clean Architecture**, dividindo o código em camadas distintas para garantir separação de responsabilidades, testabilidade e escalabilidade.

### Camadas Principais:

1.  **Camada de Domínio (`lib/domain`):**
    *   **Entidades (`entities`):** Contém as classes de modelo de negócio puras, que representam os conceitos centrais da aplicação. Não possuem dependências de frameworks ou outras camadas.
    *   **Casos de Uso (`use_cases`):** Encapsulam a lógica de negócio específica da aplicação. Orquestram as operações entre as entidades e os repositórios.
    *   **Repositórios (Abstratos) (`repositories`):** Define contratos (interfaces) para operações de dados que serão implementadas pela camada de Dados.

2.  **Camada de Dados (`lib/data`):**
    *   **Modelos (`models`):** Classes que representam a estrutura dos dados conforme recebidos de fontes externas (APIs, bancos de dados). Frequentemente usadas com `json_serializable`.
    *   **Repositórios (Implementação) (`repositories`):** Implementam os contratos de repositório definidos na camada de Domínio. São responsáveis por buscar e persistir dados.
    *   **Fontes de Dados (`sources`):** Classes que interagem diretamente com APIs, bancos de dados ou outros serviços externos.

3.  **Camada de Apresentação (`lib/ui`):**
    *   **Telas/Widgets (`screens`, `widgets`):** Contém a interface do usuário (UI) do aplicativo, construída com widgets Flutter.
    *   **Stores (`stores`):** Utiliza **MobX** para gerenciar o estado reativo da UI. Atuam como ViewModels, expondo o estado e as ações para as telas/widgets.
    *   **Temas (`themes`):** Define o estilo visual da aplicação (cores, fontes, etc.).

### Outros Diretórios Importantes:

*   **`lib/dependencies`:** Contém a configuração de injeção de dependências, utilizando o `get_it` para registrar e resolver as dependências entre as camadas.
*   **`lib/routing`:** Gerencia a navegação do aplicativo, utilizando o `go_router` para rotas declarativas e deep linking.
*   **`lib/utils`:** Funções utilitárias e helpers que podem ser usados em várias camadas.
*   **`assets/images`:** Armazena os recursos de imagem utilizados no projeto.