//
//  ProfileCompleteViewController.swift
//  Legends
//
//   on 12/04/21.
//

import UIKit
import InstagramLogin
class ProfileCompleteViewController: UIViewController {
    var instagramLogin: InstagramLoginViewController!
    var objProfileCompeleteViewModel = ProfileCompeleteViewModel()
    @IBOutlet weak var btnFindPeople: UIButton!
    
    @IBOutlet weak var btnLoginWithInstagram: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureData()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    @IBAction func btnFindPeopleClicked(_ sender: Any) {
        self.alertMessageForAddPepole()
    }
    
    @IBAction func btnLoginWithInstagram(_ sender: Any) {
        self.instagramClicked()
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
