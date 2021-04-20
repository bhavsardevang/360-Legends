//
//  SelectInterstViewController.swift
//  Legends
//
//   on 10/04/21.
//

import UIKit

class SelectInterstViewController: UIViewController {
    @IBOutlet weak var progressView: UIProgressView!
    var index:Int = 0
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var tagView: CloudTagView!
    @IBOutlet weak var lblTitle: UILabel!
    var objIntendModule = SelectInterstViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureData()
    }
    @IBAction func backClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnNextClicked(_ sender: Any) {
        self.moveToNext()
    }
    
    @IBAction func btnSubmitClicked(_ sender: Any) {
        self.btnSubmit.setCorenerRedious()
        if objIntendModule.arrSelectedValue.count > 0 {
            progressView.progress = 1.0
        } else {
            progressView.progress = 0.8
        }
        if objIntendModule.arrSelectedValue.count <= 0 {
            Alert().showAlert(message: "please select the Interest of your area", viewController: self)
        } else {
            self.moveToNext()
        }
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
