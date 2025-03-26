# 🧩 Camada `DI` (Dependency Injection) – Descrição Completa dos Arquivos

## 📁 Estrutura

```
DI/
└── AppDIContainer.swift
```

---

## 📄 `DI/AppDIContainer.swift`

### 📌 Função
Centralizar a **injeção de dependências** do projeto, criando e conectando todos os componentes do app.

> Essa camada tem como objetivo desacoplar o processo de criação de objetos e torná-lo mais organizado e testável.

### 🧱 Conteúdo

```swift
final class AppDIContainer {

    // MARK: - Data Layer
    private lazy var localDataSource = LocalTaskDataSource()
    private lazy var taskRepository = TaskRepositoryImpl(localDataSource: localDataSource)

    // MARK: - UseCases
    private lazy var getTasksUseCase = GetTasksUseCase(repository: taskRepository)
    private lazy var addTaskUseCase = AddTaskUseCase(repository: taskRepository)
    private lazy var updateTaskUseCase = UpdateTaskUseCase(repository: taskRepository)
    private lazy var deleteTaskUseCase = DeleteTaskUseCase(repository: taskRepository)

    // MARK: - ViewModel Factory
    func makeTaskListViewModel() -> TaskListViewModel {
        return TaskListViewModel(
            getTasksUseCase: getTasksUseCase,
            addTaskUseCase: addTaskUseCase,
            updateTaskUseCase: updateTaskUseCase,
            deleteTaskUseCase: deleteTaskUseCase
        )
    }

    // MARK: - View Factory
    func makeTaskListView() -> some View {
        let viewModel = makeTaskListViewModel()
        return TaskListView(viewModel: viewModel)
    }
}
```

### 🔗 Conexões

- Monta todos os componentes das camadas `Data`, `Domain` e `Presentation`
- Instancia o `ViewModel` e o injeta na `View`
- Pode ser facilmente estendido para criar outros módulos/viewModels/views

---

## 🧠 Por que é importante?

- Centraliza a criação de dependências
- Facilita testes e modularização
- Evita que a `View` conheça detalhes de baixo nível (ex: como instanciar um UseCase ou Repository)

---

## ✅ Resumo

| Arquivo                | Função                                                  | Conhece quem?                                  |
|------------------------|---------------------------------------------------------|------------------------------------------------|
| `AppDIContainer.swift` | Monta e conecta os componentes da arquitetura           | Todas as camadas: Domain, Data, Presentation   |
