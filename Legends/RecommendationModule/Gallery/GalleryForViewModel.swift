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
}
extension GalleryForPlaceViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 70
        } else {
            let numberofItems = objGalleryForViewModel.arrnumberOfItems[indexPath.row]
            if numberofItems > 3 {
                return CGFloat((100 * (numberofItems/4)))
            } else {
                return 100
            }
            //(height * numberofRows (numberofitems/4))
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tblDisplayImages.dequeueReusableCell(withIdentifier: "GalleryTableViewCell") as! GalleryTableViewCell
        
            return cell
        } else {
            let cell = tblDisplayImages.dequeueReusableCell(withIdentifier: "AllImageTableViewCell") as! AllImageTableViewCell
            cell.numberofItems = objGalleryForViewModel.arrnumberOfItems[indexPath.row]
            cell.numberOfSections = Int(floor(Double(cell.numberofItems / 4)))
            cell.collectionViewImages.reloadData()
            return cell
        }
       
       
    }
    
    
}
