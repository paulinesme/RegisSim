//
//  RegistedSimTableViewCell.swift
//  RegisSim
//
//  Created by Pauline Sihawong on 7/3/16.
//  Copyright © 2016 Pauline Sihawong. All rights reserved.
//

import UIKit

class RegistedSimTableViewCell: UITableViewCell {

    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var citizenIdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
