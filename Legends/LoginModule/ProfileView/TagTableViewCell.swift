//
//  TagTableViewCell.swift
//  Legends
//
//   on 10/04/21.
//

import UIKit
typealias selectedAgeClosure = (String) -> Void
class TagTableViewCell: UITableViewCell {
    @IBOutlet weak var lbl25: UILabel!
    @IBOutlet weak var lblrange25_30: UILabel!
    @IBOutlet weak var lblRange35: UILabel!
    @IBOutlet weak var tagView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewforTag: UIView!
    var ageselected:selectedAgeClosure?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
        self.lbl25.layer.cornerRadius = 20
        self.lblrange25_30.layer.cornerRadius = 20
        self.lblRange35.layer.cornerRadius = 20
       // viewforTag.roundCorners(corners: [.bottomLeft,.bottomRight], radius: CGFloat(redious))
        self.setupGrayBackgroundColor()
    }
    
    
    func setupGrayBackgroundColor() {
        self.lbl25.backgroundColor = hexStringToUIColor(hex: CustomColor().grayColor)
        self.lbl25.layer.borderWidth = 0.0
        self.lbl25.layer.borderColor = UIColor.orange.cgColor
        self.lbl25.layer.masksToBounds = true
        self.lblrange25_30.backgroundColor = hexStringToUIColor(hex: CustomColor().grayColor)
        self.lblrange25_30.layer.borderWidth = 0.0
        self.lblrange25_30.layer.borderColor = UIColor.orange.cgColor
        self.lblrange25_30.layer.masksToBounds = true
        self.lblRange35.backgroundColor = hexStringToUIColor(hex: CustomColor().grayColor)
        self.lblRange35.layer.borderWidth = 0.0
        self.lblRange35.layer.borderColor = UIColor.orange.cgColor
        self.lblRange35.layer.masksToBounds = true
    }
    func selectedValue(label:UILabel) {
        label.backgroundColor = hexStringToUIColor(hex: CustomColor().orangeType)
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.orange.cgColor
        label.layer.masksToBounds = true
    }
    @IBAction func btn25Clicked(_ sender: Any) {
        self.setupGrayBackgroundColor()
        self.selectedValue(label: lbl25)
        ageselected!(lbl25.text!)
    }
    
    @IBAction func btn25_30Clicked(_ sender: Any) {
        self.setupGrayBackgroundColor()
        self.selectedValue(label: lblrange25_30)
        ageselected!(lblrange25_30.text!)
    }
    
    @IBAction func btn35Clicked(_ sender: Any) {
        self.setupGrayBackgroundColor()
        self.selectedValue(label: lblRange35)
        ageselected!(lblRange35.text!)
    }
}
