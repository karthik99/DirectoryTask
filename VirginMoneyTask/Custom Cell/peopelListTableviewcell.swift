//
//  peopelListTableviewcell.swift
//  VirginMoneyTask
//
//  Created by Karthik on 23/04/21.
//  Copyright © 2021 Karthik. All rights reserved.
//

import UIKit

class peopelListTableviewcell: UITableViewCell {
    
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var peopleImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
