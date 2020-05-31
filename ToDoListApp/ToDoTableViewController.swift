//
//  ToDoTableViewController.swift
//  ToDoListApp
//
//  Created by Lydia Tan on 5/31/20.
//  Copyright © 2020 Lydia Tan. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var toDos: [ToDo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        toDos = createToDo()
       
    }

    func createToDo() -> [ToDo] {
        let health = ToDo()
        health.name = "go for a run"
        health.important = true
        
        let friend = ToDo()
        friend.name = "call Cara"
    
        return[health, friend]
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let toDo = toDos[indexPath.row]
        
        if toDo.important{
            cell.textLabel?.text = "!!" + toDo.name
        }
        else{
            cell.textLabel?.text = toDo.name
        }

        return cell
    }
    

}
