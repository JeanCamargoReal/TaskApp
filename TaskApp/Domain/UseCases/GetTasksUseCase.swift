//
//  GetTasksUseCase.swift
//  TaskApp
//
//  Created by Jean Camargo on 26/03/25.
//

import Foundation

struct GetTasksUseCase {
    let repository: TaskRepository
    
    func execute() -> [Task] {
        return repository.fetchTasks()
    }
}
