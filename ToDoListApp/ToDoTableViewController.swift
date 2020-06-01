//
//  ToDoTableViewController.swift
//  ToDoListApp
//
//  Created by Lydia Tan on 5/31/20.
//  Copyright © 2020 Lydia Tan. All rights reserved.
//

import UIKit
import CoreData


class ToDoTableViewController: UITableViewController {

    var toDos: [ToDoCD] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        toDos = createToDo()
    }
//
//    func createToDo() -> [ToDo] {
//        let health = ToDo()
//        health.name = "go for a run"
//        health.important = true
//
//        let friend = ToDo()
//        friend.name = "call Cara"
//
//        return[health, friend]
//    }

    func getToDos(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataToDos = try? context.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
                    toDos = coreDataToDos
                    tableView.reloadData()
            }

        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
      getToDos()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let toDo = toDos[indexPath.row]
        
        if let name = toDo.name {
          if toDo.important {
              cell.textLabel?.text = "!" + name
          } else {
              cell.textLabel?.text = toDo.name
          }
        }

        return cell
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let addVC = segue.destination as? AddToDoViewController {
           addVC.previousVC = self
         }
         if let completeVC = segue.destination as? CompleteToDoViewController {
           if let toDo = sender as? ToDoCD {
                 completeVC.selectedToDo = toDo
                 completeVC.previousVC = self
               }
         
       }
    }
    
    
}
