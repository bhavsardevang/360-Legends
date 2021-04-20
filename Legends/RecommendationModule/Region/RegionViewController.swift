//
//  RegionViewController.swift
//  Legends
//
//   on 19/04/21.
//

import UIKit

class RegionViewController: UIViewController {

    @IBOutlet weak var imgPin: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgFlag: UIImageView!
    @IBOutlet weak var viewImages: UIView!
    @IBOutlet weak var lblFriendWithoutBenifit: UILabel!
    @IBOutlet weak var tblRegionDiplay: UITableView!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    @IBOutlet weak var lbltotalFriend: UILabel!
    
    var objRegionViewModel = RegionViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // self.tblRegionDiplay.
        self.configureData()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    @IBAction func btnCloseClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnRecommandation(_ sender: Any) {
        
    }
    @IBAction func btnZeroClicked(_ sender: Any) {
        
    }
    func moveToGallary() {
        let objGallery:GalleryForPlaceViewController = UIStoryboard(name: RecommendationStoryBoard, bundle: nil).instantiateViewController(identifier: "GalleryForPlaceViewController") as! GalleryForPlaceViewController
        self.navigationController?.pushViewController(objGallery, animated: true)
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
