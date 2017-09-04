//
//  StudentTableViewCell.swift
//  CoreDataDemo
//
//  Created by Shrinidhi K on 04/09/17.
//  Copyright © 2017 Shrinidhi K. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var studentCell: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
