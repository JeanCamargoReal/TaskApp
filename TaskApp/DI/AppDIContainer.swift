//
//  AppDIContainer.swift
//  TaskApp
//
//  Created by Jean Camargo on 26/03/25.
//

/// 🧩 Explicação
///
/// AppDIContainer monta tudo:
/// DataSource
/// Repository
/// UseCases
/// ViewModel
/// View
///
/// A @main App só chama um único método makeTaskListView()
/// Isso mantém tudo organizado, injetado corretamente e sem acoplamento direto

import Foundation
import SwiftUI

final class AppDIContainer {
    
    // MARK: Data Layer
    private lazy var localDataSource = LocalTaskDataSource()
    private lazy var taskRepository = TaskRepositoryImpl(localDataSource: localDataSource)
    
    // MARK: UseCases
    private lazy var getTasksUseCase = GetTasksUseCase(repository: taskRepository)
    private lazy var addTaskUseCase = AddTaskUseCase(repository: taskRepository)
    private lazy var updateTaskUseCase = UpdateTaskUseCase(repository: taskRepository)
    private lazy var deleteTaskUseCase = DeleteTaskUseCase(repository: taskRepository)
    
    // MARK: ViewModel Factory
    func makeTaskListViewModel() -> TaskListViewModel {
        TaskListViewModel(
            getTasksUseCase: getTasksUseCase,
            addTaskUseCase: addTaskUseCase,
            updateTaskUseCase: updateTaskUseCase,
            deleteTaskUseCase: deleteTaskUseCase
        )
    }
    
    // MARK: View Factory
    func makeTaskListView() -> some View {
        let viewModel = makeTaskListViewModel()
        return TaskListView(viewModel: viewModel)
    }
}
