//
//  InvitetoLegendsTableViewCell.swift
//  Legends
//
//   on 12/04/21.
//

import UIKit

class InvitetoLegendsTableViewCell: UITableViewCell {
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var imgInvite: UIImageView!
    @IBOutlet weak var layoutConstraintTrilingInvitelabel: NSLayoutConstraint!
    @IBOutlet weak var lblInvite: UILabel!
    var selectedIndex:selectedIndexclosure?
    @IBOutlet weak var btnInvite: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        self.cornerRadiousOfButton()
    }
    func cornerRadiousOfButton() {
       btnInvite.setCorenerRedious()
        btnInvite.setOrangeColor()
        btnInvite.layer.cornerRadius = 15.0
    }
    func trillingInvited() {
        layoutConstraintTrilingInvitelabel.constant = 10.0
    }
    func trillingInvite() {
        layoutConstraintTrilingInvitelabel.constant = 20.0
    }

    @IBAction func btnInviteClicked(_ sender: UIButton) {
        selectedIndex!(sender.tag)
    }
}
