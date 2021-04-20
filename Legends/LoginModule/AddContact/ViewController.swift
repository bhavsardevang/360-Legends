//
//  ViewController.swift
//  Legends
//
//   on 09/04/21.
//

import UIKit
import SwiftPhoneNumberFormatter
import CountryPickerView

class ViewController: UIViewController {
    @IBOutlet weak var lblTitle: UINavigationItem!
    @IBOutlet weak var lblNumberSetUp: UILabel!
    @IBOutlet weak var lblPhoneTitle: UILabel!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var txtPhoneNumber: PhoneFormattedTextField!
    @IBOutlet weak var btnFlag: UIButton!
    @IBOutlet weak var imgflagView: UIImageView!
    @IBOutlet weak var viewBorder: UIView!
    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBOutlet weak var layoutConstraintBtnBottom: NSLayoutConstraint!
    var countryPickerView = CountryPickerView()
    var objAddContactViewModel = AddContactViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
    }

  

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    @IBAction func btnFlagClicked(_ sender: Any) {
        self.countryPickerView.showCountriesList(from: self)
    }
    
    @IBAction func backClicked(_ sender: Any) {
        let objViewController = UIStoryboard(name: LandingStoryBoard, bundle: nil).instantiateViewController(identifier: "JournyViewController")
        self.view.window?.rootViewController = objViewController
        //self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnContinueClicked(_ sender: UIButton) {
        self.btnContinue.setCorenerRedious()
        if txtPhoneNumber.text!.count < 10{
            Alert().showAlert(message: "please provide 10 digit number", viewController: self)
        } else {
            self.moveToNextViewController()
        }
        
//        objAddContactViewModel.apiSuccess = { [weak self] value in
//            if value == ksuccess {
//                self?.moveToNextViewController()
//                //self!.perform(#selector(moveToNextViewController), with: nil, afterDelay: 0.1)
//            }
//        }
//       // self.setupAPICall()
//        sender.setTitleColor(hexStringToUIColor(hex: CustomColor().orangeType), for: .normal)
//        sender.layer.borderColor =  hexStringToUIColor(hex: CustomColor().orangeType).cgColor
        
       }
    }
    

