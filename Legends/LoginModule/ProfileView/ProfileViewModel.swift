//
//  ProfileViewModel.swift
//  Legends
//
//   on 10/04/21.
//

import UIKit
enum ProfileError:Error {
    case profile,emailEmpty,invaliedEmail,age,faviouritePlace,mostPlaces
    func descriptionMessage() -> String {
        switch self {
        case .profile:
            return "please select Image"
        case .emailEmpty:
            return "please provide email id"
        case .invaliedEmail:
            return "please provide valied email id"
        case .age:
            return "please select the age"
        case .faviouritePlace:
            return "please provide faviourite place"
        case .mostPlaces:
            return "please provide most place"
        default:
            return ""
        }
    }
}
class ProfileViewModel: NSObject {
    var strSelectedAge:String?
    var strfaviourute:String?
    var strMostPlace:String?
    var email:String?
    var image:UIImage?
    func validation() throws -> Bool {
        if image == nil {
            throw ProfileError.profile
        }
        if email == nil {
            throw ProfileError.emailEmpty
        }
        if email == "" {
            throw ProfileError.emailEmpty
        }
        let valied = isValidEmail(email!)
        if !valied {
            throw ProfileError.invaliedEmail
        }
        if strSelectedAge == nil {
            throw ProfileError.age
        }
        if strfaviourute == nil {
            throw ProfileError.faviouritePlace
        }
        if strMostPlace == nil {
            throw ProfileError.mostPlaces
        }
        return true
    }
}
extension ProfileViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return 2
        }
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        } else if indexPath.section == 1 {
            return 60
        }
        else {
            return 160
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tblProfileData.dequeueReusableCell(withIdentifier: "TagTableViewCell") as! TagTableViewCell
            cell.ageselected = {[weak self] result in
                self!.objprofileViewModel.strSelectedAge = result
                self!.setUpProgressView()
            }
            cell.viewforTag.roundCorners(corners: [.bottomLeft,.bottomRight], radius: CGFloat(redious))
            return cell
        } else if indexPath.section == 1 {
            let cell = tblProfileData.dequeueReusableCell(withIdentifier: "SepratorTableViewCell") as! SepratorTableViewCell
            cell.viewUpper.roundCorners(corners: [.bottomRight,.bottomLeft], radius: 50.0)
            cell.viewLower.roundCorners(corners: [.topRight,.topRight], radius: 50.0)
            cell.layoutIfNeeded()
            cell.selectionStyle = .none
            return cell
        }
        
        else {
            let cell = tblProfileData.dequeueReusableCell(withIdentifier: "TextViewTableViewCell") as! TextViewTableViewCell
            cell.txtView.tag = indexPath.row
            if indexPath.row == 0 {
               // cell.viewTextView.roundCorners(corners: [.topLeft,.topRight], radius: CGFloat(redious))
            }
            cell.txtvalue = { [weak self] (value,index) in
                if index == 0 {
                    self!.objprofileViewModel.strfaviourute = value
                    self!.setUpProgressView()
                }
                else {
                    self!.objprofileViewModel.strMostPlace = value
                    self!.setUpProgressView()
                }
                print("value = \(value) and index = \(index)")
            }
            return cell
        }
    }
}
extension ProfileViewController {
    func configueData() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        btnSubmit.setCorenerRedious()
        btnSubmit.setOrangeColor()
        self.imgProfile.layer.cornerRadius = self.imgProfile.frame.width/2
        self.imgProfile.layer.masksToBounds = true
        self.tblProfileData.delegate = self
        self.tblProfileData.dataSource = self
        self.tblProfileData.separatorStyle = .none
        txtEmail.delegate = self
        txtEmail.tintColor = hexStringToUIColor(hex: CustomColor().orangeType)
        txtEmail.selectedTitleColor = hexStringToUIColor(hex: CustomColor().orangeType)
        txtEmail.selectedLineColor = hexStringToUIColor(hex: CustomColor().orangeType)
    }
    func setupActionSheet()  {
        let actionSheetController: UIAlertController = UIAlertController(title: "Profile Picture", message: nil, preferredStyle: .actionSheet)
        let firstAction: UIAlertAction = UIAlertAction(title: "Take a selfie", style: .default) { action -> Void in
             ImagePicker.sharedObject.selectedImage = { [weak self] image in
                self!.imgProfile.image = image
                self!.setUpProgressView()
            }
            ImagePicker.sharedObject.openCamera(viewController: self)
            
        }

        let secondAction: UIAlertAction = UIAlertAction(title: "Import from gallery", style: .default) { action -> Void in

            ImagePicker.sharedObject.selectedImage = { [weak self] image in
               self!.imgProfile.image = image
                self!.setUpProgressView()
           }
            ImagePicker.sharedObject.openGallery(viewController: self)
        }

        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in }
        actionSheetController.addAction(firstAction)
        actionSheetController.addAction(secondAction)
        actionSheetController.addAction(cancelAction)

        present(actionSheetController, animated: true) {
        }
    }
    func moveToNextViewController() {
        let objSelectIntedViewController:SelectInterstViewController = UIStoryboard(name: MainStoryBoard, bundle: nil).instantiateViewController(identifier: "SelectInterstViewController") as! SelectInterstViewController
        self.navigationController?.pushViewController(objSelectIntedViewController, animated: true)
    }
    
    func setUpProgressView() {
        var value:Double = 0.1
        if objprofileViewModel.image != nil {
            value += 0.1
        }
        if objprofileViewModel.email != nil && objprofileViewModel.email != "" {
            value += 0.1
        }
        if objprofileViewModel.strSelectedAge != nil {
            value += 0.2
        }
        if objprofileViewModel.strfaviourute != nil  && objprofileViewModel.strfaviourute != ""{
            value += 0.2
        }
        if objprofileViewModel.strMostPlace != nil &&  objprofileViewModel.strMostPlace != "" {
            value += 0.2
        }
        progressViewOfprofile.progress = Float(value)
    }
    
}
extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtEmail {
            txtEmail.resignFirstResponder()
            self.setUpProgressView()
        }
        return true
    }
}
