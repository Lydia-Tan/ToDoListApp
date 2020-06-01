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
    var selectedToDo = ToDo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = selectedToDo.name
    }
    

    @IBAction func completeTapped(_ sender: Any) {
    }
    

}
	
