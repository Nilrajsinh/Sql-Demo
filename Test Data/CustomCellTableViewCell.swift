//
//  CustomCellTableViewCell.swift
//  Test Data
//
//  Created by Nilrajsinh Vaghela on 17/10/19.
//  Copyright © 2019 Nilrajsinh Vaghela. All rights reserved.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var Name: UILabel!
    
    @IBOutlet weak var Email: UILabel!
    
    @IBOutlet weak var Gender: UILabel!
    
    @IBOutlet weak var Country: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
