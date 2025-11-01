//
//  TaskListView.swift
//  ToDo
//
//  Created by Alumno on 31/10/25.
//

import SwiftUI

struct TaskListView: View {
    
    @StateObject var viewModel = TaskListViewModel()
    @State var showNewTask = false
    @State var selectedTask: Task?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.tasks) { task in
                    Text(task.name)
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                viewModel.deleteTask(task: task)
                            } label: {
                                Label("Remove", systemImage: "trash")
                            }

                        }
                        .onTapGesture {
                            selectedTask = task
                        }
                }
            }
            .navigationTitle("TO DO")
            .toolbar {

                ToolbarItem {
                    Button {
                        showNewTask.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .padding(8)
                            .background(.ultraThinMaterial)
                            .clipShape(Circle())
                            .shadow(radius: 2)
                    }

                }
            }
            .sheet(isPresented: $showNewTask) {
                TaskDetailView(cancel:  {
                    showNewTask.toggle()
                }) { task in
                    showNewTask.toggle()
                    viewModel.addTask(task: task)
                }
            }
            .sheet(item: $selectedTask) { task in
                TaskDetailView(
                    task: task,
                    cancel:  {
                    selectedTask = nil
                }) { task in
                    selectedTask = nil
                    viewModel.updateTask(task: task)
                }
            }
        }
    }
}

#Preview {
    TaskListView()
}
