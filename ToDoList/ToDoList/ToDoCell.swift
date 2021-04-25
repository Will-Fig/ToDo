//
//  ToDoCell.swift
//  ToDoList
//
//  Created by William Figueroa on 4/19/21.
//

import UIKit

protocol ToDoCellDelegate: class
    {
        func checkmarkTapped(sender: ToDoCell)
    }

class ToDoCell: UITableViewCell
{

    weak var delegate: ToDoCellDelegate?
    
    @IBOutlet weak var isCompleteButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func completeButtonTapped()
    {
        delegate?.checkmarkTapped(sender: self)
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
