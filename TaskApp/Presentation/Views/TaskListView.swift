//
//  TaskListView.swift
//  TaskApp
//
//  Created by Jean Camargo on 26/03/25.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var viewModel: TaskListViewModel
    @State private var newTaskTitle: String = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Nova tarefa", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button("Adicionar") {
                        guard !newTaskTitle.isEmpty else { return }
                        viewModel.addTask(title: newTaskTitle)
                        newTaskTitle = ""
                    }
                }
                .padding()

                List {
                    ForEach(viewModel.tasks) { task in
                        HStack {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isCompleted ? .green : .gray)
                                .onTapGesture {
                                    viewModel.toggleTask(task)
                                }

                            Text(task.title)
                                .strikethrough(task.isCompleted, color: .gray)
                                .foregroundColor(task.isCompleted ? .gray : .primary)
                        }
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let task = viewModel.tasks[index]
                            viewModel.deleteTask(task)
                        }
                    }
                }
            }
            .navigationTitle("Minhas Tarefas")
        }
    }
}



#Preview {
    let mockTasks = [
        Task(id: UUID(), title: "Comprar leite", isCompleted: false),
        Task(id: UUID(), title: "Estudar SwiftUI", isCompleted: true),
        Task(id: UUID(), title: "Criar preview", isCompleted: false)
    ]
    
    struct MockRepository: TaskRepository {
        var tasks: [Task]
        
        func fetchTasks() -> [Task] { tasks }
        func addTask(_ task: Task) {}
        func updateTask(_ task: Task) {}
        func deleteTask(_ task: Task) {}
    }
    
    let repository = MockRepository(tasks: mockTasks)
    
    let viewModel = TaskListViewModel(
        getTasksUseCase: GetTasksUseCase(repository: repository),
        addTaskUseCase: AddTaskUseCase(repository: repository),
        updateTaskUseCase: UpdateTaskUseCase(repository: repository),
        deleteTaskUseCase: DeleteTaskUseCase(repository: repository)
    )
    
    return TaskListView(viewModel: viewModel)
}

