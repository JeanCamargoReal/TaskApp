//
//  AddTaskUseCase.swift
//  TaskApp
//
//  Created by Jean Camargo on 26/03/25.
//

import Foundation

struct AddTaskUseCase {
    let repository: TaskRepository
    
    func execute(task: Task) {
        repository.addTask(task)
    }
}
