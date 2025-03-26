//
//  TaskListViewModel.swift
//  TaskApp
//
//  Created by Jean Camargo on 26/03/25.
//

import Foundation

final class TaskListViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    private let getTasksUseCase: GetTasksUseCase
    private let addTaskUseCase: AddTaskUseCase
    private let updateTaskUseCase: UpdateTaskUseCase
    private let deleteTaskUseCase: DeleteTaskUseCase
    
    init(
        getTasksUseCase: GetTasksUseCase,
        addTaskUseCase: AddTaskUseCase,
        updateTaskUseCase: UpdateTaskUseCase,
        deleteTaskUseCase: DeleteTaskUseCase
    ) {
        self.getTasksUseCase = getTasksUseCase
        self.addTaskUseCase = addTaskUseCase
        self.updateTaskUseCase = updateTaskUseCase
        self.deleteTaskUseCase = deleteTaskUseCase
        
        loadTasks()
    }
    
    func loadTasks() {
        tasks = getTasksUseCase.execute()
    }
    
    func addTask(title: String) {
        let newTask = Task(id: UUID(), title: title, isCompleted: false)
        addTaskUseCase.execute(task: newTask)
        loadTasks()
    }
    
    func toggleTask(_ task: Task) {
        var updated = task
        
        updated.isCompleted.toggle()
        updateTaskUseCase.execute(task: updated)
        loadTasks()
    }
    
    func deleteTask(_ task: Task) {
        deleteTaskUseCase.execute(task: task)
        loadTasks()
    }

}
