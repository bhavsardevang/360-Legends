//
//  SpecificFriendsTableViewCell.swift
//  Legends
//
//   on 16/04/21.
//

import UIKit

class SpecificFriendsTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var imgSelected: UIImageView!
    
    @IBOutlet weak var btnSeeAll: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        self.setupCornerRadious()
    }
    func setupCornerRadious()  {
        userIcon.layer.cornerRadius = userIcon.frame.width
        userIcon.layer.masksToBounds = true
        imgSelected.layer.cornerRadius = imgSelected.frame.width
        imgSelected.layer.masksToBounds = true
    }

    @IBAction func btnSeeAllClicked(_ sender: Any) {
    }
}
