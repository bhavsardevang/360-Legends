//
//  SepratorTableViewCell.swift
//  Legends
//
//   on 15/04/21.
//

import UIKit

class SepratorTableViewCell: UITableViewCell {
    @IBOutlet weak var viewUpper: UIView!
    @IBOutlet weak var viewLower: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        self.setCornerRedious()
    }
    
    func setCornerRedious() {
        viewUpper.roundCorners(corners: [.bottomLeft,.bottomRight], radius: 50.0)
        viewLower.roundCorners(corners: [.topLeft,.topRight], radius: 50.0)
        self.layoutIfNeeded()
    }

}
