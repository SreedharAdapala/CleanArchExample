//
//  TodoListUsecaseLayer.swift
//  CleanArchExample
//
//  Created by Perennials on 08/04/24.
//

import Foundation

protocol TodoListUseCase {
    func fetchTodos(completion: @escaping ([Todo]) -> Void)
}

class TodoListInteractor: TodoListUseCase {
    private let todoRepository: TodoRepository
    
    init(todoRepository: TodoRepository) {
        self.todoRepository = todoRepository
    }
    
    func fetchTodos(completion: @escaping ([Todo]) -> Void) {
        todoRepository.fetchTodos(completion: completion)
    }
}
