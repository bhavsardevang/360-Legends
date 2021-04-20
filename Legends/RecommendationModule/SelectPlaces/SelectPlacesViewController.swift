//
//  SelectPlacesViewController.swift
//  Legends
//
//  Created by devang bhavsar on 20/04/21.
//

import UIKit

class SelectPlacesViewController: UIViewController {

    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var tblPlaceDisplay: UITableView!
    @IBOutlet weak var viewForName: UIView!
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblNameTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblPickCover: UILabel!
    @IBOutlet weak var lblRecommandation: UILabel!
    @IBOutlet weak var imgCover: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.ConfigData()
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
