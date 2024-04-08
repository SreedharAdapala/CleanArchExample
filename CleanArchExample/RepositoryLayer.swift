//
//  RepositoryLayer.swift
//  CleanArchExample
//
//  Created by Perennials on 05/04/24.
//

import Foundation

protocol TodoRepository {
    func fetchTodos(completion: @escaping ([Todo]) -> Void)
}

class RemoteTodoRepository: TodoRepository {
    func fetchTodos(completion: @escaping ([Todo]) -> Void) {
        //simulated fetching from a remote server
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            let todos = [
                Todo(id: 1, title: "Buy groceries", completed: false),
                Todo(id: 2, title: "finish homework", completed: false),
                Todo(id: 3, title: "read a book", completed: true),
            ]
            DispatchQueue.main.async {
                completion(todos)
            }
        }
    }
    
    
}
