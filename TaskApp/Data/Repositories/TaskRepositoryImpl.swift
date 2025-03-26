//
//  TaskRepositoryImpl.swift
//  TaskApp
//
//  Created by Jean Camargo on 26/03/25.
//

/// 🔍 Explicação
/// Aqui implementamos o TaskRepository, que está na camada de domínio.
/// A TaskRepositoryImpl é a implementação concreta.
/// Ela pode mudar no futuro (ex: passar a usar banco de dados), mas o domínio não precisa saber disso.

import Foundation

final class TaskRepositoryImpl: TaskRepository {
    private let localDataSource: LocalTaskDataSource
    
    init(localDataSource: LocalTaskDataSource) {
        self.localDataSource = localDataSource
    }
    
    func fetchTasks() -> [Task] {
        localDataSource.fetchTasks()
    }
    
    func addTask(_ task: Task) {
        localDataSource.addTask(task)
    }
    
    func updateTask(_ task: Task) {
        localDataSource.updateTask(task)
    }
    
    func deleteTask(_ task: Task) {
        localDataSource.deleteTask(task)
    }
}


