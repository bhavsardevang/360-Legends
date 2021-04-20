//
//  ContactListViewModel.swift
//  Legends
//
//   on 12/04/21.
//

import UIKit

class ContactListViewModel: NSObject {
    var arrHeaderTitle = ["Friends on Legends","Invite to Legends"]
    func setUpCornerRadiousOfView(view:UIView) {
        view.layer.cornerRadius = CGFloat(10.0)
        view.layer.borderWidth = 1.0
        view.layer.borderColor = hexStringToUIColor(hex: "BBC3CA").cgColor
        view.layoutIfNeeded()
    }
    func setImageAsFollow(imageView:UIImageView,label:UILabel)  {
        imageView.image = UIImage(named: "follow")!
        label.text = "Follow"
    }
    func setImageAsFollowed(imageView:UIImageView,label:UILabel) {
        imageView.image = UIImage(named: "Invited")!
        label.text = "Following"
    }
    func setImageAsInvite(imageView:UIImageView,label:UILabel)  {
        imageView.image = UIImage(named: "invite")!
        label.text = "Invite"
    }
    func setImageAsInvited(imageView:UIImageView,label:UILabel)  {
        imageView.image = UIImage(named: "Invited")!
        label.text = "Invited"
    }
}
extension ContactListViewController {
 
    func configureData() {
       
        txtSearch.delegate = self
        tblContactDisplay.delegate = self
        tblContactDisplay.dataSource = self
        tblContactDisplay.separatorStyle = .none
        tblContactDisplay.isHidden = false
        objContactListViewModel.setUpCornerRadiousOfView(view: viewSearch)
        
    }
    func moveToNext() {
        let objExploreMapViewController:ExploreMapViewController = UIStoryboard(name: MainStoryBoard, bundle: nil).instantiateViewController(identifier: "ExploreMapViewController") as! ExploreMapViewController
        self.navigationController?.pushViewController(objExploreMapViewController, animated: true)
     }
}
extension ContactListViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader:UIView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 40.0))
        let label = UILabel(frame: CGRect(x: 20.0, y: 10.0, width: screenWidth - 40.0, height: 20.0))
        label.font = UIFont(name: CustomFontName().sans_bold, size: 11.0)
        label.textColor = hexStringToUIColor(hex: "112343")
        label.text = objContactListViewModel.arrHeaderTitle[section]
        viewHeader.addSubview(label)
        return viewHeader
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tblContactDisplay.dequeueReusableCell(withIdentifier: "FriendsonLegendsTableViewCell") as! FriendsonLegendsTableViewCell
            cell.btnFollow.tag = indexPath.row
            if indexPath.row == 0 {
                cell.btnFollow.isHidden = true
                cell.trillingWhenFollowed()
                objContactListViewModel.setImageAsFollowed(imageView: cell.imgFollow, label: cell.lblFollowTitle)
            } else {
                cell.btnFollow.isHidden = false
                cell.trillingNormalForFollow()
                objContactListViewModel.setImageAsFollow(imageView: cell.imgFollow, label: cell.lblFollowTitle)
            }
            cell.selectedIndex = {[weak self] result in
                print("Selected index = \(result)")
            }
            cell.selectionStyle = .none
            return cell
         } else {
            let cell = tblContactDisplay.dequeueReusableCell(withIdentifier: "InvitetoLegendsTableViewCell") as! InvitetoLegendsTableViewCell
            cell.btnInvite.tag = indexPath.row
            
            if indexPath.row == 0 {
                cell.btnInvite.isHidden = true
                objContactListViewModel.setImageAsInvited(imageView: cell.imgInvite, label: cell.lblInvite)
                cell.trillingInvited()
            } else {
                cell.btnInvite.isHidden = false
                objContactListViewModel.setImageAsInvite(imageView: cell.imgInvite, label: cell.lblInvite)
                cell.trillingInvite()
            }
            cell.selectedIndex = {[weak self] result in
                print("Selected index = \(result)")
            }
            cell.selectionStyle = .none
            return cell
        }
    }
    
    
}
extension ContactListViewController:UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        txtSearch.resignFirstResponder()
        if txtSearch.text == "Legends".lowercased() {
            Alert().showAlert(message: "Data Found", viewController: self)
            tblContactDisplay.isHidden = false
        }else if txtSearch.text == "" {
            tblContactDisplay.isHidden = false
        }else {
            Alert().showAlert(message: "No Data Found", viewController: self)
            tblContactDisplay.isHidden = true
        }
       
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.count > 3 {
            
        }
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtSearch {
            txtSearch.resignFirstResponder()
        }
        return true
    }
}
