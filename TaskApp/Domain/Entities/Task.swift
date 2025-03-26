//
//  Task.swift
//  TaskApp
//
//  Created by Jean Camargo on 26/03/25.
//

import Foundation

struct Task: Identifiable, Equatable {
    let id: UUID
    let title: String
    var isCompleted: Bool
}
