//
//  FilterViewController.swift
//  Legends
//
//   on 15/04/21.
//

import UIKit

class FilterViewController: UIViewController {
    @IBOutlet weak var lblFooterDescription: UILabel!
    
    @IBOutlet weak var btnShow: UIButton!
    @IBOutlet weak var btnFilter: UIButton!
    @IBOutlet weak var tblFilterData: UITableView!
    var objFilterViewModel = FilterViewModel()
    var objSelectInterstViewModel = SelectInterstViewModel()
    var index:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureData()
    }
    
    @IBAction func btnCloseClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnShowClicked(_ sender: UIButton) {
        self.btnstopHeighlightResult()
    }
   
    @IBAction func btnFilterClicked(_ sender: UIButton) {
        self.btnstopHeighlightFilter()
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
