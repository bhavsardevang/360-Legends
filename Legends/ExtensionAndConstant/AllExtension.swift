//
//  AllExtension.swift
//  Legends
//
//   on 09/04/21.
//

import Foundation
import  UIKit
import Photos
extension UIButton {
    func setCorenerRedious() {
        self.titleLabel?.font = UIFont(name: CustomFontName().sans_bold, size: (14 * fontMultiplier))
        self.layer.cornerRadius = (20.0 * fontMultiplier)
        self.layer.borderWidth = 1.0
        self.layer.borderColor = hexStringToUIColor(hex:"5E5E7F").cgColor
        self.setTitleColor(hexStringToUIColor(hex:"5E5E7F"), for: .normal)
        self.layer.masksToBounds = true
    }
    func setOrangeColor() {
        self.layer.borderColor = hexStringToUIColor(hex: CustomColor().orangeType).cgColor
        self.setTitleColor(hexStringToUIColor(hex: CustomColor().orangeType), for: .normal)
    }
}
extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    func addDashedBorder() {
        let color = UIColor.gray.cgColor

        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [6,3]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath

        self.layer.addSublayer(shapeLayer)
        }
}
extension UILabel {
    func setCustomLabel() {
       // self.font = self.font.withSize(CustomFontSize().labelFontSize)
        self.font = UIFont(name: CustomFontName().sans_regular, size: self.font.pointSize * (fontMultiplier))
        //self.textColor = UIColor.lightGray
    }
}
extension UIImage {
    func isEqualToImage(image: UIImage) -> Bool {
        let data1: NSData = self.pngData()! as NSData
        let data2: NSData = image.pngData()! as NSData
        return data1.isEqual(data2)
    }
}
