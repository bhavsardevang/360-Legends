//
//  ViewController.swift
//  Legends
//
//   on 09/04/21.
//

import Foundation
import UIKit


//MARK:- Screen Resolution
let screenSize = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height
let userDefualt = UserDefaults.standard
let MainStoryBoard = "Main"
let LandingStoryBoard = "Landing"
let MapStoryBoard = "Map"
let RecommendationStoryBoard = "Recommendation"
let redious = 30.0
let ksuccess = "Success"
let kPost = "POST"
let kPut = "PUT"
let kGet = "GET"
let kLong = "long"
let kprofileImage = "profileImage"
let kToken = "token"
let kAppName = "Legends"
let kEmailId = "email"
let kPassword = "password"
let usernameapi = "mylegends20"
let passwordapi = "MyLegends2020"
let fontMultiplier = (screenHeight/896.0)
//MARK:- Constant API URL
let baseURL = "https://legends-sandbox-api.herokuapp.com/api/v1/"
let verificationPhoneNumber = "auth/verification/phone"
//MARK:- Typealise for pass value
typealias selectedIndexclosure = (Int) -> Void

//MARK:- Constant Struct
struct AppMessage {
    var internetIssue:String = "Please check the internet connection"
}
struct CustomFontName {
    var serif_italic:String = "DMSerifDisplay-Italic"
    var serif_regular:String = "DMSerifDisplay-Regular"
    var sans_bold:String = "DMSans-Bold"
    var sans_bold_italic:String = "DMSans-BoldItalic"
    var sans_italic:String = "DMSans-Italic"
    var sans_medium:String = "DMSans-Medium"
    var sans_medium_italic:String = "DMSans-MediumItalic"
    var sans_regular:String = "DMSans-Regular"
    var helvatica_regular:String = "Helvetica"
}
struct CustomFontSize {
    var textfieldFontSize:CGFloat = 28.0 * (screenWidth/320.0)
    var buttonFontSize:CGFloat = 15.0 * (screenWidth/320.0)
    var splaceScreenFontSize:CGFloat = 12.0 * (screenWidth/320.0)
    var labelFontSize:CGFloat = 15.0 * (screenWidth/320)
    var titleFontSize:CGFloat = 16.0 * (screenWidth/320.0)
    var pickerTitleLableSize:CGFloat = 23.0 * (screenWidth/320.0)
    var pickertextFieldSize:CGFloat = 20.0 * (screenWidth/320.0)
}
struct CustomColor {
    //HeaderColor
    var gradeintTopBackGround = "#0074E8"//"#00A9C3"
    var orangeType = "#EE956F"
    var lightOrange = "#F9E8CF"
    var darkblackType = "#062340"
    var grayColor = "#D8D8D8"
    var splashBackgroundColor = "#062340"
    var fontColor = "#112343"
    var contactborderColor = "#EE956F"
    var contactBackGroundColor = "#FFEEE7"

}
struct AppAlertMessage {
    var oldPassword = "Please provide old password"
    var newPassword = "Please provide new password"
    var confirmPassword = "Please provide confirm password"
    var passwordNotMatch = "password does not match"
    var passwordChageSuccess = "password change successfully"
    var accountMessage = "Your account has been deactivated.please contact to app admin"
}
struct Alert {
    func showAlert(message:String,viewController:UIViewController) {
        let alert = UIAlertController(title:kAppName, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}
//MARK:- Remove Space before and after line
func removeWhiteSpace(strData:String) -> String {
    let trimmed:String = strData.trimmingCharacters(in: .whitespacesAndNewlines)
    return trimmed.lowercased()
}
