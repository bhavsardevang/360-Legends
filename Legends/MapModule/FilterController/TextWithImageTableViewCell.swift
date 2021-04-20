//
//  TextWithImageTableViewCell.swift
//  Legends
//
//   on 16/04/21.
//

import UIKit

class TextWithImageTableViewCell: UITableViewCell {
    @IBOutlet weak var imgSelect: UIImageView!
    @IBOutlet weak var imgicon: UIImageView!
    
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnSelect: UIButton!
    @IBOutlet weak var lblseprator: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func btnSelectedClicked(_ sender: Any) {
        
    }
}
