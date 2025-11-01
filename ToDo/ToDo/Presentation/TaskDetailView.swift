//
//  TaskDetailView.swift
//  ToDo
//
//  Created by Alumno on 31/10/25.
//

import SwiftUI

struct TaskDetailView: View {
    
    @State var name = ""
    var task: Task?

    let cancel: () -> Void
    let save: (Task) -> Void
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $name)
                }
            }
            .navigationTitle( task == nil ? "New task" : "Edit task")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                       cancel()
                    } label: {
                        Image(systemName: "xmark")
                            .padding(8)
                            .background(.ultraThinMaterial)
                            .clipShape(Circle())
                            .shadow(radius: 2)
                    }

                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                     
                        save(Task(id: task?.id ?? UUID() , name: name))
                    } label: {
                        Image(systemName: "checkmark")
                            .padding(8)
                            .background(.ultraThinMaterial)
                            .clipShape(Circle())
                            .shadow(radius: 4, y: 2)
                    }

                }
            }
            .onAppear {
                if let task {
                    name = task.name
                }
            }
        }
    }
}

#Preview {
    TaskDetailView(cancel: {}) {_ in}

}
