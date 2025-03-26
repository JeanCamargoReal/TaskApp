//
//  UpdateTaskUseCase.swift
//  TaskApp
//
//  Created by Jean Camargo on 26/03/25.
//

import Foundation

struct UpdateTaskUseCase {
    let repository: TaskRepository
    
    func execute(task: Task) {
        repository.updateTask(task)
    }
}
