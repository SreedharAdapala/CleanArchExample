//
//  TodoListViewController.swift
//  CleanArchExample
//
//  Created by Perennials on 08/04/24.
//

import UIKit

class TodoListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var todos: [Todo] = []
    private var interactor: TodoListUseCase!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRepositoryCode()
        setupUI()
        fetchData()
    }
    
    func setRepositoryCode () {
        let repository = RemoteTodoRepository()
        let interactor = TodoListInteractor(todoRepository: repository)
        self.interactor = interactor
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "TodoListViewController") as! TodoListViewController
//        viewController.interactor = interactor

        // Present or push viewController to display the todo list


    }
    
    private func setupUI() {
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    private func fetchData() {
        interactor.fetchTodos { [weak self] todos in
            self?.todos = todos
            self?.tableView.reloadData()
        }
    }
}

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let todo = todos[indexPath.row]
        cell.textLabel?.text = todo.title
        cell.accessoryType = todo.completed ? .checkmark : .none
        return cell
    }
}
