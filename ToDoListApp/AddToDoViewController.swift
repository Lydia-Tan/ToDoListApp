//
//  AddToDoViewController.swift
//  ToDoListApp
//
//  Created by Lydia Tan on 5/31/20.
//  Copyright © 2020 Lydia Tan. All rights reserved.
//

import UIKit
import CoreData


class AddToDoViewController: UIViewController {

    var previousVC = ToDoTableViewController()

    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var titleTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          return
        }
        let context = appDelegate.persistentContainer.viewContext

        let toDo = ToDoCD(context: context)

        toDo.name = titleField.text
        toDo.important = importantSwitch.isOn

        appDelegate.saveContext()

        navigationController?.popViewController(animated: true)
    }
}
