//
//  TaskAppApp.swift
//  TaskApp
//
//  Created by Jean Camargo on 26/03/25.
//

import SwiftUI

@main
struct TaskAppApp: App {
    let diContainer = AppDIContainer()
    
    var body: some Scene {
        WindowGroup {
            diContainer.makeTaskListView()
        }
    }
}
