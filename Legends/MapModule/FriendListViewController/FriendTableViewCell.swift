//
//  FriendTableViewCell.swift
//  Legends
//
//   on 19/04/21.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var viewForContact: UIView!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var imgSquare: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
       // self.setUpSimpleView()
    }

    func setUpSimpleView() {
        viewForContact.layer.cornerRadius = 20.0
        viewForContact.layer.borderWidth = 1.0
        viewForContact.layer.borderColor = UIColor.gray.cgColor
        viewForContact.backgroundColor = UIColor.white
        self.layoutIfNeeded()
    }
    func setUpSelectedView() {
        viewForContact.layer.cornerRadius = 20.0
        viewForContact.layer.borderWidth = 1.0
        viewForContact.backgroundColor = hexStringToUIColor(hex: CustomColor().contactBackGroundColor)
        viewForContact.layer.borderColor = hexStringToUIColor(hex: CustomColor().contactborderColor).cgColor
        self.layoutIfNeeded()
    }
}
