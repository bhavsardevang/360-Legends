//
//  SelectPlaceTitleTableViewCell.swift
//  Legends
//
//  Created by devang bhavsar on 20/04/21.
//

import UIKit

class SelectPlaceTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var btnSeeAll: UIButton!
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnSeeAllClicked(_ sender: Any) {
        
    }
    
}
