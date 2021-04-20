//
//  FriendListViewModel.swift
//  Legends
//
//   on 19/04/21.
//

import UIKit

class FriendListViewModel: NSObject {
 var arrFriendList = [FriendList]()
    func setUpFriendList() {
        arrFriendList.removeAll()
        let list = FriendList(strUserImage: "userIcon", strname: "Essie Schneider", isSelected: false)
        let list1 = FriendList(strUserImage: "userIcon", strname: "Tony Hopkins", isSelected: false)
        let list2 = FriendList(strUserImage: "userIcon", strname: "Lify cross", isSelected: false)
        let list3 = FriendList(strUserImage: "userIcon", strname: "Neli flower", isSelected: false)
        arrFriendList.append(list)
        arrFriendList.append(list1)
        arrFriendList.append(list2)
        arrFriendList.append(list3)
    }
}
extension FriendListViewController {
    func configureData() {
        
        self.lblTitleMessage.font = UIFont(name: CustomFontName().sans_regular, size: (14.0 * fontMultiplier))
        self.lblfriends.font = UIFont(name: CustomFontName().sans_bold, size: (18.0 * fontMultiplier))
        self.tblFriendList.dataSource = self
        self.tblFriendList.delegate = self
        self.tblFriendList.tableFooterView = UIView()
        objFriendListViewModel.setUpFriendList()
    }
}
extension FriendListViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objFriendListViewModel.arrFriendList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFriendList.dequeueReusableCell(withIdentifier: "FriendTableViewCell") as! FriendTableViewCell
        let objData = objFriendListViewModel.arrFriendList[indexPath.row]
        if let name = objData.strname {
            cell.lblName.text = name
        }
        if let strImageName = objData.strUserImage {
            cell.imgUser.image = UIImage(named: strImageName)
        }
        let selected = objData.isSelected
        if selected {
            cell.setUpSelectedView()
            cell.imgSquare.image = UIImage(named: "squareChecked")
            
        } else {
            cell.setUpSimpleView()
            cell.imgSquare.image = UIImage(named: "square")
        }
        cell.selectionStyle = .none
        return cell
     }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var data = objFriendListViewModel.arrFriendList[indexPath.row]
        if data.isSelected == true {
            data.isSelected = false
        } else {
            data.isSelected = true
        }
        objFriendListViewModel.arrFriendList[indexPath.row] = data
        self.tblFriendList.reloadData()
    }
    
}
