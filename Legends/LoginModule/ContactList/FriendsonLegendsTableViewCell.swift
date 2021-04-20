//
//  FriendsonLegendsTableViewCell.swift
//  Legends
//
//   on 12/04/21.
//

import UIKit

class FriendsonLegendsTableViewCell: UITableViewCell {
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var imgFollow: UIImageView!
    @IBOutlet weak var layoutConstraintlblFollow: NSLayoutConstraint!
    @IBOutlet weak var lblFollowTitle: UILabel!
    @IBOutlet weak var btnFollow: UIButton!
    var selectedIndex:selectedIndexclosure?
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.cornerRadiousOfButton()
    }
    func trillingNormalForFollow() {
        self.layoutConstraintlblFollow.constant = 20.0
    }
    func trillingWhenFollowed() {
        self.layoutConstraintlblFollow.constant = 10.0
    }
    func cornerRadiousOfButton() {
        btnFollow.setCorenerRedious()
        btnFollow.setOrangeColor()
        btnFollow.layer.cornerRadius = 15.0
    }
    @IBAction func btnFollowClicked(_ sender: UIButton) {
        selectedIndex!(sender.tag)
    }
}
