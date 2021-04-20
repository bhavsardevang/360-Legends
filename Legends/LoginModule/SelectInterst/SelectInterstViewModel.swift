//
//  SelectInterstViewModel.swift
//  Legends
//
//   on 10/04/21.
//

import UIKit

class SelectInterstViewModel: NSObject {
 var arrSelectedValue = [String]()
    
    func  changeBackgroundTagView(tag:TagView) {
        tag.isBackgroundColorChange = true
        if tag.backgroundColor == hexStringToUIColor(hex: CustomColor().orangeType) {
            tag.backgroundColor = hexStringToUIColor(hex: "F3F4F6")
        } else {
            tag.backgroundColor = hexStringToUIColor(hex: CustomColor().orangeType)
        }
       
        var ismatch:Bool = false
        if arrSelectedValue.count > 0 {
            for i in 0...arrSelectedValue.count - 1 {
                let value = arrSelectedValue[i]
                if tag.text == value {
                    ismatch = true
                    arrSelectedValue.remove(at: i)
                    return
                }
            }
        }
        if !ismatch {
            arrSelectedValue.append(tag.text)
        }
    }
}
extension SelectInterstViewController {
    func configureData() {
        tagView.delegate = self
        self.index = 0
        self.btnSubmit.setCorenerRedious()
        self.addTag(strTagName: "Travel", image: UIImage(named:"travel")!)
        self.addTag(strTagName: "Music", image: UIImage(named:"music")!)
        self.addTag(strTagName: "Nature", image: UIImage(named:"nature")!)
        self.addTag(strTagName: "Food", image: UIImage(named:"food")!)
        self.addTag(strTagName: "Politics", image: UIImage(named:"politics")!)
        self.addTag(strTagName: "Literature", image: UIImage(named:"literature")!)
        self.addTag(strTagName: "Technology", image: UIImage(named:"technology")!)
        self.addTag(strTagName: "Space", image: UIImage(named:"space")!)
        self.addTag(strTagName: "Sports", image: UIImage(named:"sports")!)
        self.addTag(strTagName: "Wellness", image: UIImage(named:"wellness")!)
        self.addTag(strTagName: "Yoga", image: UIImage(named:"yoga")!)
        self.addTag(strTagName: "Philosophy", image: UIImage(named:"philosophy")!)
        self.addTag(strTagName: "Dance", image: UIImage(named:"dance")!)
        self.addTag(strTagName: "Photography", image: UIImage(named:"photography")!)
        self.addTag(strTagName: "Art", image: UIImage(named:"art")!)
        self.addTag(strTagName: "Burning Man", image: UIImage(named:"burningImage")!)
        self.addTag(strTagName: "Soho house", image: UIImage(named:"sohohouse")!)
    }
    func addTag(strTagName:String,image:UIImage) {
        let tagview = TagView(text: " " + strTagName + " ")
        tagview.iconImage = image
        tagview.tag = self.index
        self.index += 1
        tagView.tags.append(tagview)
        tagview.isBackgroundColorChange = false
        tagview.backgroundColor = hexStringToUIColor(hex: "F3F4F6")
        objIntendModule.arrSelectedValue = [String]()
    }
    
    func moveToNext() {
        let objProfileCompeleteViewController:ProfileCompleteViewController = UIStoryboard(name: MainStoryBoard, bundle: nil).instantiateViewController(identifier: "ProfileCompleteViewController") as! ProfileCompleteViewController
        self.navigationController?.pushViewController(objProfileCompeleteViewController, animated: true)
    }
}
extension SelectInterstViewController:TagViewDelegate {
    func tagTouched(_ tag: TagView) {
        print("tag index = \(tag.tag)")
        objIntendModule.changeBackgroundTagView(tag: tag)
    }
}
