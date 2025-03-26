//
//  LocalTaskDataSource.swift
//  TaskApp
//
//  Created by Jean Camargo on 26/03/25.
//

/// Essa classe simula um armazenamento em memória.
/// Em projetos reais, você pode trocar por CoreData, UserDefaults ou até API.


import Foundation

final class LocalTaskDataSource {
    private var tasks: [Task] = []
    
    func fetchTasks() -> [Task] {
        return tasks
    }
    
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    func updateTask(_ task: Task) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        tasks[index] = task
    }
    
    func deleteTask(_ task: Task) {
        tasks.removeAll { $0.id == task.id }
    }
}
