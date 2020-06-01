//
//  CompleteToDoViewController.swift
//  ToDoListApp
//
//  Created by Lydia Tan on 5/31/20.
//  Copyright © 2020 Lydia Tan. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    var previousVC = ToDoTableViewController()
    var selectedToDo : ToDoCD?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = selectedToDo?.name
    }
    

    @IBAction func completeTapped(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
             return
         }

         let context = appDelegate.persistentContainer.viewContext

         if let theToDo = selectedToDo {
             context.delete(theToDo)
             navigationController?.popViewController(animated: true)
         }
    }
    

}
	
