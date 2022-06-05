//
//  TableViewCellGeoInfo.swift
//  BeSpotAssignment
//
//  Created by Angelos Staboulis on 5/6/22.
//

import UIKit

class TableViewCellGeoInfo: UITableViewCell {

    @IBOutlet var lblType: UILabel!
    @IBOutlet var txtTags: UITextView!
    @IBOutlet var lblReward: UILabel!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblLongitutde: UILabel!
    @IBOutlet var lblLatitude: UILabel!
    @IBOutlet var lblCode: UILabel!
    @IBOutlet var lblAddress: UILabel!
    @IBOutlet var lblUUID: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
