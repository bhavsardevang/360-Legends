//
//  VerificationViewController.swift
//  Legends
//
//   on 09/04/21.
//

import UIKit

class VerificationViewController: UIViewController {
    @IBOutlet weak var btnBack: UIBarButtonItem!
    var timer = Timer()
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var lblEnterCode: UILabel!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var txt3: UITextField!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var txt4: UITextField!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var lblRecive: UILabel!
    var  objVerificationViewModel = VerificationCodeViewModel()
    var strnumber:String = ""
    @IBOutlet weak var btnResend: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureData()
    }
    
    @IBAction func backClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnResendclicked(_ sender: Any) {
        self.btnResend.setCorenerRedious()
        if txt1.text != "" && txt2.text != "" && txt3.text != "" && txt4.text != "" {
            self.moveToNextViewController()
        } else {
            Alert().showAlert(message: "please check your message box", viewController: self)
            timer.invalidate()
            self.setUpTimer()
            objVerificationViewModel.count = 20
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
