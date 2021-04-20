//
//  CustomButtonWithHighlight.swift
//  Legends
//
//   on 16/04/21.
//

import Foundation
import UIKit
@IBDesignable
class CustonButton: UIButton {
   
    override func draw(_ rect: CGRect) {
        self.setUpMethod()
    }
    func setUpMethod() {
        self.setCorenerRedious()
        self.addTarget(self, action: #selector(startHighlight), for: .touchDown)
        self.addTarget(self, action: #selector(stopHighlight), for: .touchUpOutside)
    }
    @objc func startHighlight() {
        self.setOrangeColor()
    }
    @objc func stopHighlight() {
        self.setCorenerRedious()
    }

}
