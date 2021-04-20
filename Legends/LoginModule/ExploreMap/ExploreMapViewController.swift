//
//  ExploreMapViewController.swift
//  Legends
//
//   on 12/04/21.
//

import UIKit

class ExploreMapViewController: UIViewController {

    @IBOutlet weak var btnXploreMap: UIButton!
    @IBOutlet weak var lblTitleThanks: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configData()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    @IBAction func btnXploreMapClicked(_ sender: Any) {
        let objMapView = UIStoryboard(name: MapStoryBoard, bundle: nil).instantiateViewController(identifier: "CustomTabBarController")
        
        self.navigationController?.pushViewController(objMapView, animated: true)
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
