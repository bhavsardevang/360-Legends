//
//  VerificationCodeViewModel.swift
//  Legends
//
//   on 09/04/21.
//

import UIKit

class VerificationCodeViewModel: NSObject {
    var count = 20
    var strTitleText = "Enter the code we just texted you at:"
    var strReciveText = "If you didn’t receive the code, tap to resend at the end of this countdown: "
   
    func setUpGrayColor(lbl:UILabel)  {
        lbl.backgroundColor = .gray
    }
    func setUpOrangeColor(lbl:UILabel)  {
        lbl.backgroundColor = hexStringToUIColor(hex: CustomColor().orangeType)
    }
    func addOrangeColorToAttributedString(value:String) -> NSMutableAttributedString {
        let myAttribute = [ NSAttributedString.Key.font: UIFont(name: CustomFontName().sans_bold, size: 18.0)! ]
        let myString = NSMutableAttributedString(string: value, attributes: myAttribute )
        let myRange = NSRange(location: 0, length:myString.length) // range starting at location 17 with a lenth of 7: "Strings"
        myString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: myRange)
        return myString
    }
    func addDarkBlackColorToAttributedString(value:String) -> NSMutableAttributedString {
        let myAttribute = [ NSAttributedString.Key.font: UIFont(name: CustomFontName().sans_bold, size: 18.0)! ]
        let myString = NSMutableAttributedString(string: value, attributes: myAttribute )
        let myRange = NSRange(location: 0, length:myString.length) // range starting at location 17 with a lenth of 7: "Strings"
        myString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: myRange)
        
        return myString
    }

}
extension VerificationViewController {
    func configureData() {
        self.txt1.delegate = self
        self.txt1.font = UIFont(name: CustomFontName().sans_regular, size: (20 * fontMultiplier))
        self.txt2.delegate = self
        self.txt2.font = UIFont(name: CustomFontName().sans_regular, size: (20 * fontMultiplier))
        self.txt3.delegate = self
        self.txt3.font = UIFont(name: CustomFontName().sans_regular, size: (20 * fontMultiplier))
        self.txt4.delegate = self
        self.txt4.font = UIFont(name: CustomFontName().sans_regular, size: (20 * fontMultiplier))
//        self.lblEnterCode.font = UIFont(name: self.lblEnterCode.font.fontName, size: (self.lblEnterCode.font.pointSize * fontMultiplier))
//        self.lblRecive.font = UIFont(name: self.lblRecive.font.fontName, size: (self.lblRecive.font.pointSize * fontMultiplier))
        self.setupAllGrayColor()
        btnResend.setCorenerRedious()
        var attrubutedString:NSMutableAttributedString = NSMutableAttributedString(string: objVerificationViewModel.strTitleText)
        attrubutedString.append(objVerificationViewModel.addDarkBlackColorToAttributedString(value: strnumber))
        self.lblEnterCode.attributedText =  attrubutedString
        self.setUpTimer()
    }
    func setUpTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.4, target:self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    func setupAllGrayColor() {
        objVerificationViewModel.setUpGrayColor(lbl: lbl1)
        objVerificationViewModel.setUpGrayColor(lbl: lbl2)
        objVerificationViewModel.setUpGrayColor(lbl: lbl3)
        objVerificationViewModel.setUpGrayColor(lbl: lbl4)
    }
    @objc func update() {
        if(objVerificationViewModel.count > 0) {
            DispatchQueue.main.async {
                self.objVerificationViewModel.count -=  1
                var attrubutedString:NSMutableAttributedString = NSMutableAttributedString(string: self.objVerificationViewModel.strReciveText)
                attrubutedString.append(self.objVerificationViewModel.addOrangeColorToAttributedString(value: "\(self.objVerificationViewModel.count)"))
                self.lblRecive.attributedText = attrubutedString
               // self.lblCount.text = String(self.objVerificationViewModel.count)
            }
            
        } else {
            timer.invalidate()
            self.navigationController?.popViewController(animated: true)
        }
    }
    func moveToNextViewController() {
        timer.invalidate()
        let objRefferalViewController:RefferalViewController = UIStoryboard(name: MainStoryBoard, bundle: nil).instantiateViewController(identifier: "RefferalViewController") as! RefferalViewController
        self.navigationController?.pushViewController(objRefferalViewController, animated: true)
    }
}
extension VerificationViewController:UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.setupAllGrayColor()
        if txt1 == textField {
            objVerificationViewModel.setUpOrangeColor(lbl: lbl1)
        }
        if txt2 == textField {
            objVerificationViewModel.setUpOrangeColor(lbl: lbl2)
        }
        if txt3 == textField {
            objVerificationViewModel.setUpOrangeColor(lbl: lbl3)
        }
        if txt4 == textField {
            objVerificationViewModel.setUpOrangeColor(lbl: lbl4)
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         if !(string == "") {
             textField.text = string
             if textField == txt1 {
                 txt2.becomeFirstResponder()
             }
             else if textField == txt2 {
                 txt3.becomeFirstResponder()
             }
             else if textField == txt3 {
                 txt4.becomeFirstResponder()
             }
             else {
                 textField.resignFirstResponder()
                self.moveToNextViewController()
             }
             return false
         }
         return true
     }
}
