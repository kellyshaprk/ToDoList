//
//  JDI_TableViewCell.swift
//  JustDoIt
//
//  Created by Sehee Park on 2019-11-28.
//  Copyright © 2019 Group5. All rights reserved.
//

import UIKit

class JDI_TableViewCell: UITableViewCell {
    //MARK:- Outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var todoLabel: UILabel!

    //MARK:- Class Variables
    var todoData: TodoData?
    var taskNumber: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
