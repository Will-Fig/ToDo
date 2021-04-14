//
//  ToDoCell.swift
//  List
//
//  Created by William Figueroa on 4/13/21.
//

import UIKit

class ToDoCell: UITableViewCell

    guard let cell = tableView.dequeueReusableCell(withIdentifier "ToDoCellIdentifier") as? ToDoCell
    
    else
        {
        fatalError("Could not dequeue a cell")
        }

