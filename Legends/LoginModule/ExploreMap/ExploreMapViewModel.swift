//
//  ExploreMapViewModel.swift
//  Legends
//
//   on 12/04/21.
//

import UIKit

class ExploreMapViewModel: NSObject {

}
extension ExploreMapViewController {
    func configData() {
        btnXploreMap.layer.cornerRadius = (20.0 * fontMultiplier)
        btnXploreMap.layer.masksToBounds = true
        btnXploreMap.backgroundColor = hexStringToUIColor(hex: CustomColor().orangeType)
        btnXploreMap.titleLabel?.font = UIFont(name: CustomFontName().sans_bold, size: (12 * fontMultiplier))
        lblTitleThanks.font = UIFont(name: CustomFontName().serif_regular, size: (40 * fontMultiplier))
        
    }
}
