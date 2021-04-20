//
//  RegionViewModel.swift
//  Legends
//
//   on 19/04/21.
//

import UIKit

class RegionViewModel: NSObject {

}
extension RegionViewController {
    func  configureData() {
        self.img6.layer.cornerRadius = self.img6.frame.width / 2
        self.img6.layer.masksToBounds = true
        self.tblRegionDiplay.delegate = self
        self.tblRegionDiplay.dataSource = self
        self.tblRegionDiplay.tableFooterView = UIView()
    }
}
extension RegionViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 60
        } else if indexPath.row == 1 {
            return 234
        } else if indexPath.row == 2 {
            return 80
        } else if indexPath.row == 3 {
            return 40
        } else  {
            return 200 //(collectionViewHeight * numberofColoumns)
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tblRegionDiplay.dequeueReusableCell(withIdentifier: "TagRegionViewTableViewCell") as! TagRegionViewTableViewCell
           
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 1 {
            let cell = tblRegionDiplay.dequeueReusableCell(withIdentifier: "RecommandOnGooglleTableViewCell") as! RecommandOnGooglleTableViewCell
           
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 2 {
            let cell = tblRegionDiplay.dequeueReusableCell(withIdentifier: "HaveRecommandedTableViewCell") as! HaveRecommandedTableViewCell
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.row == 3 {
            let cell = tblRegionDiplay.dequeueReusableCell(withIdentifier: "RecommandedHeaderTableViewCell") as! RecommandedHeaderTableViewCell
            cell.sendClicked = { [weak self] value in
                self!.moveToGallary()
            }
            cell.selectionStyle = .none
            return cell
        }
        else {
            let cell = tblRegionDiplay.dequeueReusableCell(withIdentifier: "AllImageTableViewCell") as! AllImageTableViewCell
           
            cell.selectionStyle = .none
            return cell
        }
     }
   

}
