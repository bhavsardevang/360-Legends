//
//  AddContactModel.swift
//  Legends
//
//   on 09/04/21.
//

import UIKit
import CountryPickerView
import SwiftPhoneNumberFormatter
typealias SuccessClosure = (String) -> Void
class AddContactViewModel: NSObject {
    var strCountryCode:String?
    var strcountryPhoneCode:String?
    var apiSuccess:SuccessClosure?
    func makeAPICall(dic:[String:Any],viewcontroller:UIViewController)  {
        DispatchQueue.global(qos: .userInitiated).async {
            let serviceName = baseURL + verificationPhoneNumber
            APIRequest.shared.postAPIRequestWithoutAuth(serviceName: serviceName, httpMethod: kPost, andParams: dic) { (ca:ContactAdd) in
                print("code = \(ca.code ?? "")")
                self.apiSuccess!(ksuccess)
            } failure: { (value) in
                Alert().showAlert(message: value, viewController: viewcontroller)
            }
            
        }
    }
}
extension ViewController {
    func configureData() {
        self.countryPickerView.delegate = self
        self.countryPickerView.dataSource = self
        btnContinue.setCorenerRedious()
        btnContinue.isHighlighted = false
        txtPhoneNumber.config.defaultConfiguration = PhoneFormat(defaultPhoneFormat: "(###) ###-####")
        btnContinue.setTitleColor(hexStringToUIColor(hex: CustomColor().orangeType), for: .selected)
        
        txtPhoneNumber.textDidChangeBlock = { field in
          if let text = field?.text, text != "" {
            self.btnContinue.setOrangeColor()
          } else {
            self.btnContinue.setCorenerRedious()
          }
        }
    }
    func setupAPICall() {
        var dicData = [String:Any]()
        dicData["phone"] = "+919045654560"
        objAddContactViewModel.makeAPICall(dic: dicData, viewcontroller: self)
    }
   
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            print("keyboardHeight = \(keyboardHeight)")
            layoutConstraintBtnBottom.constant = 20.0 + keyboardHeight
        }
    }

    @objc func keyboardWillDisappear() {
        //Do something here
        layoutConstraintBtnBottom.constant = 20.0
    }
     func moveToNextViewController()  {
        let objVerification:VerificationViewController = UIStoryboard(name: MainStoryBoard, bundle: nil).instantiateViewController(identifier: "VerificationViewController") as! VerificationViewController
        objVerification.strnumber = txtPhoneNumber.text!
        self.navigationController?.pushViewController(objVerification, animated: true)
    }
}
extension ViewController: CountryPickerViewDelegate, CountryPickerViewDataSource {
    
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        self.imgflagView.image = country.flag
        objAddContactViewModel.strCountryCode = country.phoneCode
        objAddContactViewModel.strcountryPhoneCode = country.phoneCode
        print("phone code = \(country.code)")
    }
    
    
}
