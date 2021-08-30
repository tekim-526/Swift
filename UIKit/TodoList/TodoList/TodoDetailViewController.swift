//
//  TodoDetailViewController.swift
//  TodoList
//
//  Created by Kim TaeSoo on 2021/08/29.
//

import UIKit
import CoreData

protocol TodoDetailViewControllerDelegate: AnyObject {
    func didFinishSaveData()
}



class TodoDetailViewController: UIViewController {
    
    //NSFetchRequest를 통해 데이터를 가져오는 컨텍스트를 자주 써서 전역으로 뺌
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    weak var delegate:TodoDetailViewControllerDelegate?
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var highButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    var selectedTodoList: TodoList?
    
    var priority: PrioriotyLevel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let hasData =  selectedTodoList {
            titleTextField.text = hasData.title
            
            priority = PrioriotyLevel(rawValue: hasData.priorityLevel)
            makePriorityButtonDesign()
            
            deleteButton.isHidden = false
            saveButton.setTitle("update", for: .normal)
        }else{
            deleteButton.isHidden = true
            saveButton.setTitle("save", for: .normal)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lowButton.layer.cornerRadius = lowButton.bounds.height / 2
        normalButton.layer.cornerRadius = normalButton.bounds.height / 2
        highButton.layer.cornerRadius = highButton.bounds.height / 2

    }
    @IBAction func setPriority(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            priority = .level1
        case 2:
            priority = .level2
        case 3:
            priority = .level3
        default:
            break
        }
        makePriorityButtonDesign()
        
    }
    
    func makePriorityButtonDesign() {
        lowButton.backgroundColor = .clear
        normalButton.backgroundColor = .clear
        highButton.backgroundColor = .clear
        
        switch self.priority {
        case .level1:
            lowButton.backgroundColor = priority?.color
        case .level2:
            normalButton.backgroundColor = priority?.color
        case .level3:
            highButton.backgroundColor = priority?.color
        default:
            break
        }
    }
    
    @IBAction func saveTodo(_ sender: Any) {
        
        if selectedTodoList != nil {
            updateTodo()
        }
        else {
            saveTodo()
        }
        
        delegate?.didFinishSaveData()
        self.dismiss(animated: true)
    }
    
    func saveTodo() {
        guard let entityDesciption = NSEntityDescription.entity(forEntityName: "TodoList", in: context) else { return }
        
        
        guard let object = NSManagedObject(entity: entityDesciption, insertInto: context) as? TodoList else{
            return
        }
        object.title = titleTextField.text
        object.date = Date()
        object.uuid = UUID()
        object.priorityLevel = priority?.rawValue ?? PrioriotyLevel.level1.rawValue
            //저장
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        appDelegate.saveContext()
    }
    
    func updateTodo() {
        
        guard let hasData = selectedTodoList else {
            return
        }
        guard let hasUUID = hasData.uuid else {
            return
        }
        let fetchRequest: NSFetchRequest<TodoList> = TodoList.fetchRequest()
        // predicate 조건을 잡는 것
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        
        do {
            let loadedData = try context.fetch(fetchRequest)
            loadedData.first?.title = titleTextField.text
            loadedData.first?.date = Date()
            loadedData.first?.priorityLevel = self.priority?.rawValue ?? PrioriotyLevel.level2.rawValue
            //저장
            let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
            appDelegate.saveContext()
        }
        catch {
            print(error)
        }
    }
    
    @IBAction func deleteTodo(_ sender: UIButton) {
        guard let hasData = selectedTodoList else {
            return
        }
        guard let hasUUID = hasData.uuid else {
            return
        }
        let fetchRequest: NSFetchRequest<TodoList> = TodoList.fetchRequest()
        // predicate 조건을 잡는 것
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        
        do {// 삭제
            let loadedData = try context.fetch(fetchRequest)
            if let loadFirstData = loadedData.first {
                context.delete(loadFirstData)
                // 삭제 후 저장 해야함
                let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
                appDelegate.saveContext()
            }
        }
        catch {
            print(error)
        }
        delegate?.didFinishSaveData()
        self.dismiss(animated: true)
    }
 
}
