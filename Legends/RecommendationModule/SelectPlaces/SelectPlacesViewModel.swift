//
//  SelectPlacesViewModel.swift
//  Legends
//
//  Created by devang bhavsar on 20/04/21.
//

import UIKit

class SelectPlacesViewModel: NSObject {

}
extension SelectPlacesViewController {
    func ConfigData()  {
        self.tblPlaceDisplay.dataSource = self
        self.tblPlaceDisplay.delegate = self
        self.tblPlaceDisplay.tableFooterView = UIView()
    }
}
extension SelectPlacesViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 40
        } else {
            return 90
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tblPlaceDisplay.dequeueReusableCell(withIdentifier: "SelectPlaceTitleTableViewCell") as! SelectPlaceTitleTableViewCell
            return cell
        } else {
            let cell = tblPlaceDisplay.dequeueReusableCell(withIdentifier: "AllImageTableViewCell") as! AllImageTableViewCell
            
            return cell
         }
    }
    
    
}
