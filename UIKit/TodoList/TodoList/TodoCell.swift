//
//  TodoCell.swift
//  TodoList
//
//  Created by Kim TaeSoo on 2021/08/29.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priorityView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
