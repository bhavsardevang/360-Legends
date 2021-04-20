//
//  RecommandedHeaderTableViewCell.swift
//  Legends
//
//   on 19/04/21.
//

import UIKit

class RecommandedHeaderTableViewCell: UITableViewCell {
    var sendClicked:selectedIndexclosure?
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var btnSeeAll: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnSeeAllClicked(_ sender: Any) {
        sendClicked!(1)
    }
    
}
