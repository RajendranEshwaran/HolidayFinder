//
//  HolidayCell.swift
//  HolidayFinder
//
//  Created by gomathi saminathan on 12/19/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import UIKit

class HolidayCell: UITableViewCell {

    @IBOutlet weak var hdescLbl: UILabel!
    @IBOutlet weak var hnameLbl: UILabel!
    @IBOutlet weak var hdateLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
