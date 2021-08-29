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

    weak var delegate:TodoDetailViewControllerDelegate?
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var highButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func setPriority(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            break
        case 2:
            break
        case 3:
            break
        default:
            break
        }
    }
    
    @IBAction func saveTodo(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        guard let entityDesciption = NSEntityDescription.entity(forEntityName: "TodoList", in: context) else { return }
        
        
        guard let object = NSManagedObject(entity: entityDesciption, insertInto: context) as? TodoList else{
            return
        }
        object.title = titleTextField.text
        object.date = Date()
        object.uuid = UUID()
        
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        appDelegate.saveContext()
        
        delegate?.didFinishSaveData()
        self.dismiss(animated: true)
    }
    

 
}
