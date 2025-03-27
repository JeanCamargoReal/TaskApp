//
//  Task.swift
//  TaskApp
//
//  Created by Jean Camargo on 26/03/25.
//

/// Entidade central da aplicação

import Foundation

struct Task: Identifiable, Equatable {
    let id: UUID
    let title: String
    var isCompleted: Bool
}
