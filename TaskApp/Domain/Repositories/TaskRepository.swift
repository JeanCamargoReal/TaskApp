//
//  TaskRepository.swift
//  TaskApp
//
//  Created by Jean Camargo on 26/03/25.
//

import Foundation

protocol TaskRepository {
    func fetchTasks() -> [Task]
    func addTask(_ task: Task)
    func updateTask(_ task: Task)
    func deleteTask(_ task: Task)
}
