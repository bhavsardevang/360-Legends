//
//  RefferalViewModel.swift
//  Legends
//
//   on 10/04/21.
//

import UIKit
import SkyFloatingLabelTextField
enum NameError:Error {
    case firstNameEmpty,lastNameEmpty
    func description() -> String {
        switch self {
        case .firstNameEmpty:
            return "plaese provide first name"
        case .lastNameEmpty:
            return "plaese provide second name"
        default:
            return ""
        }
    }
}
class RefferalViewModel: NSObject {
    var fName:String?
    var lName:String?
    
    func setvalidation() throws -> Bool {
        if fName == nil {
            throw NameError.firstNameEmpty
        }
        if fName == "" {
            throw NameError.firstNameEmpty
        }
        if lName == nil {
            throw NameError.lastNameEmpty
        }
        if lName == "" {
            throw NameError.lastNameEmpty
        }
        return true
    }

}
extension RefferalViewController {
    func configureData() {
      
        self.txtFirstName.delegate = self
        self.txtLastName.delegate = self
        self.iconBlack.isHidden = true
        self.btnSubmit.setCorenerRedious()
        txtFirstName.tintColor = hexStringToUIColor(hex: CustomColor().orangeType)
        txtFirstName.selectedTitleColor = hexStringToUIColor(hex: CustomColor().orangeType)
        txtFirstName.selectedLineColor = hexStringToUIColor(hex: CustomColor().orangeType)
        txtLastName.tintColor = hexStringToUIColor(hex: CustomColor().orangeType)
        txtLastName.selectedTitleColor = hexStringToUIColor(hex: CustomColor().orangeType)
        txtLastName.selectedLineColor = hexStringToUIColor(hex: CustomColor().orangeType)
        lblTitle.font = UIFont(name: CustomFontName().sans_bold, size: (20*fontMultiplier))
    }
    func moveToNext() {
        let objProfileViewController:ProfileViewController = UIStoryboard(name: MainStoryBoard, bundle: nil).instantiateViewController(identifier: "ProfileViewController") as! ProfileViewController
        self.navigationController?.pushViewController(objProfileViewController, animated: true)
    }
}
extension RefferalViewController:UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.iconBlack.isHidden = false
        self.userIcon.isHidden = true
        self.lblGreat.isHidden = true
        self.lblDescription.isHidden = true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.iconBlack.isHidden = true
        self.userIcon.isHidden = false
        self.lblGreat.isHidden = false
        self.lblDescription.isHidden = false
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if txtFirstName == textField {
            txtLastName.becomeFirstResponder()
        }
        else {
            txtLastName.resignFirstResponder()
            self.iconBlack.isHidden = true
            self.userIcon.isHidden = false
            self.lblGreat.isHidden = false
            self.lblDescription.isHidden = false
        }
        return true
    }
}
