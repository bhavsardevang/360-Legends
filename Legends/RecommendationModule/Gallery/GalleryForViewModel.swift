//
//  GalleryForViewModel.swift
//  Legends
//
//   on 20/04/21.
//

import UIKit

class GalleryForViewModel: NSObject {
 var arrTitle = ["Old Havan","MaleCon","Castillo de los Tres Reyes del Morro"]
 var arrDateAndTime = ["06/05/2020 • 4 photos","06/05/2020 • 3 photo","05/05/2020 • 6 photo"]
 var arrnumberOfItems = [4,3,6]
}
extension GalleryForPlaceViewController {
    func configData() {
        self.tblDisplayImages.delegate = self
        self.tblDisplayImages.dataSource = self
        self.tblDisplayImages.tableFooterView = UIView()
    }
    
    func moveToNext() {
        let objSelectPlaceViewController:SelectPlacesViewController = UIStoryboard(name: RecommendationStoryBoard, bundle: nil).instantiateViewController(identifier: "SelectPlacesViewController") as! SelectPlacesViewController
        self.navigationController?.pushViewController(objSelectPlaceViewController, animated: true)
    }
}
extension GalleryForPlaceViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 70
        } else {
           let numberofItems = objGalleryForViewModel.arrnumberOfItems[indexPath.section]
            if numberofItems > 4 {
                return CGFloat((95 * (numberofItems % 4)))
            } else {
                return 95
            }
            //(height * numberofRows (numberofitems/4))
        }
    }
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tblDisplayImages.dequeueReusableCell(withIdentifier: "GalleryTableViewCell") as! GalleryTableViewCell
            cell.lblTitle.text = objGalleryForViewModel.arrTitle[indexPath.section]
            cell.lblDate.text = objGalleryForViewModel.arrDateAndTime[indexPath.section]
            return cell
        } else {
            let cell = tblDisplayImages.dequeueReusableCell(withIdentifier: "AllImageTableViewCell") as! AllImageTableViewCell
            cell.numberofItems = objGalleryForViewModel.arrnumberOfItems[indexPath.section]
            if cell.numberofItems > 4 {
                cell.numberOfSections = (cell.numberofItems % 4)
            }
            else {
                cell.numberOfSections = 1
            }
            print("number of section = \(cell.numberOfSections)")
            cell.collectionViewImages.reloadData()
           // cell.backgroundColor = .green
            return cell
        }
       
       
    }
    
    
}
