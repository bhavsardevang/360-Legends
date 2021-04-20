//
//  RecommandOnGooglleTableViewCell.swift
//  Legends
//
//   on 19/04/21.
//

import UIKit

class RecommandOnGooglleTableViewCell: UITableViewCell {
    @IBOutlet weak var imgLayer: UIImageView!
    @IBOutlet weak var imgMapView: UIImageView!
    
    @IBOutlet weak var viewForRecommanded: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var btnRecommandonGoogle: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.setUpAllView()
    }
    func setUpAllView() {
        btnRecommandonGoogle.layer.cornerRadius = 20.0
        btnRecommandonGoogle.layer.masksToBounds = true
        viewForRecommanded.addDashedBorder()
    }
    @IBAction func btnRecommandOnGoogleClicked(_ sender: Any) {
        
    }
    
}
