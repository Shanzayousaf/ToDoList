//
//  DataStore.swift
//  ToDoList
//
//  Created by Macbook on 30/01/2024.
//

import Foundation
import SwiftUI
import Combine

struct Task: Identifiable{
    var id = String()
    var todoItem = String()
    
    // kuch or acha sa lekin mushkil sa code 😂
}

class TaskStore: ObservableObject{
    @Published var tasks = [Task]()
}
