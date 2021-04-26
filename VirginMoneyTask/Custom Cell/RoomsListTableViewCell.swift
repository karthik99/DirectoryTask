//
//  RoomsListTableViewCell.swift
//  VirginMoneyTask
//
//  Created by Karthik on 27/04/21.
//  Copyright © 2021 Karthik. All rights reserved.
//

import UIKit

class RoomsListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var occupiedLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var occupancyLbl: UILabel!
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
