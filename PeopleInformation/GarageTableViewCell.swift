//
//  GarageTableViewCell.swift
//  PeopleInformation
//
//  Created by Manav Verma on 06/03/2025.
//

import UIKit

class GarageTableViewCell: UITableViewCell {
    @IBOutlet weak var carNameLabel: UILabel!
    @IBOutlet weak var carBrandLabel: UILabel!
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var toggleSwitch: UISwitch!

    var switchAction: ((Bool) -> Void)?

    @IBAction func switchValueChanged(_ sender: UISwitch) {
        switchAction?(sender.isOn)  // ✅ Call action when switch toggles
    }

    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
