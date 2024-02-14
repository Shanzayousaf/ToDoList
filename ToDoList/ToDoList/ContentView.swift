//
//  ContentView.swift
//  ToDoList
//
//  Created by Macbook on 30/01/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newToDo: String = ""
    
    var searchBar: some View{
        HStack{
            TextField("Enter Your Task Here", text: self.$newToDo)
            Button(action: addNewToDo, label: {
                Text("Add New")
            })
        }// end of hstack
        
        
    }// end of searchbar
    func addNewToDo() {
        taskStore.tasks.append(Task(id: String(taskStore.tasks.count + 1 ),
            todoItem: newToDo
            ))
        self.newToDo = ""
        
    }
    
    var body: some View {
        NavigationView{
            VStack{
                searchBar
                    .padding()
                List{
                    ForEach(self.taskStore.tasks){ Task in
                        Text(Task.todoItem)
                    }// end of movinng tasks
                    .onMove(perform: self.move)
                    .onDelete(perform: self.delete)
                    
                }
                
                .navigationTitle("Tasks")
                .navigationBarItems(trailing: EditButton())
                
            }// end of vstack
            
            .background(Color(.systemGray4))
            
        }// ennd of navigationview
    }
    
    func move(from source: IndexSet, to destination: Int){
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
        
    }// end of func to move lists
    
    func delete(at offsets: IndexSet){
        taskStore.tasks.remove(atOffsets: offsets)
        
    }// end of delete
}

#Preview {
    ContentView()
}
