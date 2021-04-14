//
//  TableViewController.swift
//  List
//
//  Created by William Figueroa on 4/8/21.
//

import UIKit

class ToDoTableViewController: UITableViewController
    {
        var todos = [ToDo]()
    
        override func viewDidLoad()
            {
                super.viewDidLoad()
        
                if let savedToDos = ToDo.loadToDos()
                    {
                        todos = savedToDos
                    }
        
                else
                    {
                        todos = ToDo.loadSampleToDos()
                    }
            
                navigationItem.leftBarButtonItem = editButtonItem
            }
    
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
            {
                return todos.count
            }
    
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
            {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifer", for: indexPath)
        
                let todo = todos[indexPath.row]
        
                cell.textLabel?.text = todo.title
        
                return cell
            }
    
        override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
            {
                return true
            }
    
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
            {
                if editingStyle == .delete
                    {
                        todos.remove(at: indexPath.row)
                        tableView.deleteRows(at: [indexPath], with: .fade)
                    }
            }
    
        @IBAction func unwindToDoList(segue: UIStoryboardSegue)
            {
                guard segue.identifier == "saveUnwind" else {return}
        
                let sourceViewController = segue.source as! ToDoDetailTableViewController
        
                if let todo = sourceViewController.todo
                    {
                        if let selectedIndexPath = tableView.indexPathForSelectedRow
                            {
                            todos[selectedIndexPath.row] = todo
                            
                            tableView.reloadRows(at: [selectedIndexPath], with: .none)
                            }
                    
                        else
                            {
                                let newIndexPath = IndexPath(row: todos.count, section: 0)
                                todos.append(todo)
                                tableView.insertRows(at: [newIndexPath], with: .automatic)
                            }
                    }
            }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
        if segue.identifier == "EditToDo",
            let navController = segue.destination as? UINavigationController,
            let todoDetailTableViewController = navController.topViewController as? ToDoDetailTableViewController
                {
                    let indexPath = tableView.indexPathForSelectedRow!
                
                    let selectedToDo = todos[indexPath.row]
                
                    todoDetailTableViewController.todo = selectedToDo
                }
        }
    }
