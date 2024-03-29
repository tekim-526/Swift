//
//  ViewController.swift
//  TodoList
//
//  Created by Kim TaeSoo on 2021/08/29.
//

import UIKit
import CoreData

enum PrioriotyLevel: Int64 {
    case level1
    case level2
    case level3
}

extension PrioriotyLevel {
    var color: UIColor {
        switch self {
        case .level1:
            return .green
        case .level2:
            return .orange
        case .level3:
            return .red
        
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    // AppDelegate에 접근하는 방법
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var todoList = [TodoList]()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "To Do List"
        self.makeNavigationBar()
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        fetchData()
        todoTableView.reloadData()
    }
    func fetchData() {
        let fetchRequest: NSFetchRequest<TodoList> = TodoList.fetchRequest()
        let context = appdelegate.persistentContainer.viewContext
        do {
            self.todoList = try context.fetch(fetchRequest)
        } catch{
            print(error)
        }
    }
    
    func makeNavigationBar() {
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTodo))
        item.tintColor = .systemBlue
        navigationItem.rightBarButtonItem = item
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = UIColor(white: 243/255, alpha: 1)
        
        self.navigationController?.navigationBar.standardAppearance = barAppearance
    }
    
    @objc func addNewTodo() {
        let detailVC = TodoDetailViewController(nibName: "TodoDetailViewController", bundle: nil)
        detailVC.delegate = self
        self.present(detailVC, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        
        cell.topTitleLabel.text = todoList[indexPath.row].title
        // 날짜 포맷 지정
        if let hasDate = todoList[indexPath.row].date {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd hh:mm:ss"
            let dateString = formatter.string(from: hasDate)
            cell.dateLabel.text = dateString
        }else {
            cell.dateLabel.text = ""
        }
        
        let priority = todoList[indexPath.row].priorityLevel
        let priorityColor = PrioriotyLevel(rawValue: priority)?.color
        cell.priorityView.backgroundColor = priorityColor
        cell.priorityView.layer.cornerRadius = cell.priorityView.bounds.height / 2
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = TodoDetailViewController(nibName: "TodoDetailViewController", bundle: nil)
        detailVC.delegate = self
        detailVC.selectedTodoList = todoList[indexPath.row]
        self.present(detailVC, animated: true, completion: nil)
    }
    
    
}
extension ViewController: TodoDetailViewControllerDelegate {
    func didFinishSaveData() {
        self.fetchData()
        self.todoTableView.reloadData()
    }
    
    
}
