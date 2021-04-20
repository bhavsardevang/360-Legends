//
//  FilterViewModel.swift
//  Legends
//
//   on 15/04/21.
//

import UIKit

class FilterViewModel: NSObject {

    func setUpSimpleButton(button:UIButton) {
        button.setCorenerRedious()
        button.layer.cornerRadius = (30.0 * fontMultiplier)
        button.titleLabel?.font = UIFont(name: CustomFontName().sans_regular, size: (14.0 * fontMultiplier))
        button.setTitleColor(hexStringToUIColor(hex: "112343"), for: .normal)
        button.layer.borderColor = hexStringToUIColor(hex: "112343").cgColor
        button.backgroundColor = .white
        button.setTitleColor(UIColor.white, for: .selected)
        
    }
    func setUpSelectedButton(button:UIButton) {
        button.setCorenerRedious()
        button.layer.cornerRadius = (30.0 * fontMultiplier)
        button.titleLabel?.font = UIFont(name: CustomFontName().sans_bold, size: (14.0 * fontMultiplier))
       
        button.backgroundColor = hexStringToUIColor(hex: CustomColor().orangeType)
        button.layer.borderColor = hexStringToUIColor(hex: CustomColor().orangeType).cgColor
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.white, for: .selected)
    }
}
extension FilterViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 11
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 || section == 1 ||  section == 3 || section == 4 {
            if section == 3 || section == 4  {
                return 0
            }
            return 44
        } else if section == 2 || section == 6 || section == 8  || section == 10 {
            if  section == 6  {
                return 0
            }
            return 60
        } else if section == 5 {
            return 0//100
        }
        else if section == 7 || section == 9 {
            return 184
        }
        else {
            return 0
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
         if section == 0 || section == 1 ||  section == 3 || section == 4 {
            let view = tblFilterData.dequeueReusableCell(withIdentifier: "TextWithImageTableViewCell") as! TextWithImageTableViewCell
            if section == 4 {
                view.lblseprator.isHidden = false
            } else {
                view.lblseprator.isHidden = true
            }
            return view
        }
        else if section == 2 || section == 6 || section == 8  || section == 10 {
            let view = tblFilterData.dequeueReusableCell(withIdentifier: "SepratorTableViewCell") as! SepratorTableViewCell
            return view
        }
        else if section == 5 {
            let view = tblFilterData.dequeueReusableCell(withIdentifier: "SpecificFriendsTableViewCell") as! SpecificFriendsTableViewCell
            
            return view
        }
       
        else if section == 7 || section == 9 {
            let view = tblFilterData.dequeueReusableCell(withIdentifier: "TagViewTableViewCell") as! TagViewTableViewCell
            view.tagView.delegate = self
            if section == 7 {
                view.lblPlaceType.text = "Place Types"
                self.configureTag(tagView: view.tagView, isNoImage: false)
            } else {
                view.lblPlaceType.text = "Vibes"
                self.configureTag(tagView: view.tagView, isNoImage: true)
            }
           
            return view
        }
        else {
            let view = UIView()
            return view
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else if section == 3 {
            return 2
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 || indexPath.section == 3 {
           if indexPath.section == 3  {
                return 0
            }
            return 44
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 || indexPath.section == 3 {
            let cell = tblFilterData.dequeueReusableCell(withIdentifier: "TextWithSelectionTableViewCell") as! TextWithSelectionTableViewCell
            if indexPath.row == 1 {
                cell.lblSeprator.isHidden = false
            } else {
                cell.lblSeprator.isHidden = true
            }
            return cell
        } else {
            let cell = UIView()
            return cell as! UITableViewCell
        }
      
    }
    
    
}
extension FilterViewController {
    
    func configureData() {
        tblFilterData.delegate = self
        tblFilterData.dataSource = self
        tblFilterData.separatorStyle = .none
        objFilterViewModel.setUpSimpleButton(button: btnShow)
        objFilterViewModel.setUpSimpleButton(button: btnFilter)
        btnFilter.addTarget(self, action: #selector(btnHeighlightFilter), for: .touchDown)
        btnFilter.addTarget(self, action: #selector(btnstopHeighlightFilter), for: .touchDragOutside)
        btnShow.addTarget(self, action: #selector(btnHeighlightResult), for: .touchDown)
        btnShow.addTarget(self, action: #selector(btnstopHeighlightResult), for: .touchDragOutside)
    }
    func configureTag(tagView:CloudTagView,isNoImage:Bool) {
        
        self.index = 0
        self.addTag(strTagName: "Food & Drink", image: UIImage(named:"travel")!,mainTagView: tagView, isnoImage: isNoImage)
        self.addTag(strTagName: "Activity", image: UIImage(named:"music")!, mainTagView: tagView, isnoImage: isNoImage)
        self.addTag(strTagName: "Lodging", image: UIImage(named:"nature")!, mainTagView: tagView, isnoImage: isNoImage)
        self.addTag(strTagName: "Local Contact", image: UIImage(named:"food")!, mainTagView: tagView, isnoImage: isNoImage)
        
    }
    func addTag(strTagName:String,image:UIImage,mainTagView:CloudTagView,isnoImage:Bool) {
        let tagview = TagView(text: " " + strTagName + " ")
        tagview.iconImage = image
        tagview.tag = self.index
        self.index += 1
        tagview.isNoImage = isnoImage
        tagview.font = UIFont(name: CustomFontName().sans_regular, size: (16.0 * fontMultiplier))!
        mainTagView.tags.append(tagview)
        tagview.isBackgroundColorChange = false
        tagview.backgroundColor = hexStringToUIColor(hex: "F3F4F6")
        objSelectInterstViewModel.arrSelectedValue = [String]()
    }
    
    @objc func btnHeighlightFilter()  {
        self.objFilterViewModel.setUpSelectedButton(button: btnFilter)
    }
    @objc func btnstopHeighlightFilter()  {
        self.objFilterViewModel.setUpSimpleButton(button: btnFilter)
    }
    @objc func btnHeighlightResult()  {
        self.objFilterViewModel.setUpSelectedButton(button: btnShow)
    }
    @objc func btnstopHeighlightResult()  {
        self.objFilterViewModel.setUpSimpleButton(button: btnShow)
    }
}
extension FilterViewController:TagViewDelegate {
    func tagTouched(_ tag: TagView) {
        print("tag index = \(tag.tag)")
        objSelectInterstViewModel.changeBackgroundTagView(tag: tag)
    }
}
