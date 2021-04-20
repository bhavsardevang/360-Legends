//
//  GalleryForPlaceViewController.swift
//  Legends
//
//   on 20/04/21.
//

import UIKit

class GalleryForPlaceViewController: UIViewController {
    @IBOutlet weak var viewForText: UIView!
    @IBOutlet weak var imgInfo: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    var objGalleryForViewModel = GalleryForViewModel()
    @IBOutlet weak var tblDisplayImages: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.configData()
    }
    

    @IBAction func backClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextClicked(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
