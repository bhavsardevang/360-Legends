//
//  TextWithSelectionTableViewCell.swift
//  Legends
//
//   on 16/04/21.
//

import UIKit

class TextWithSelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var lblSeprator: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnSelection: UIButton!
    @IBOutlet weak var imgSelection: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func btnSelectionClicked(_ sender: Any) {
    }
}
