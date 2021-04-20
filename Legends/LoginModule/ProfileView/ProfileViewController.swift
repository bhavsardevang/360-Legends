//
//  ProfileViewController.swift
//  Legends
//
//   on 10/04/21.
//

import UIKit
import SkyFloatingLabelTextField
class ProfileViewController: UIViewController {
    
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var btnProfile: UIButton!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var tblProfileData: UITableView!
    @IBOutlet weak var progressViewOfprofile: UIProgressView!
    @IBOutlet weak var txtEmail: SkyFloatingLabelTextField!
    var objprofileViewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configueData()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    @IBAction func btnProfileClicked(_ sender: Any) {
        self.setupActionSheet()
     
    }
    
    @IBAction func btnSubmitClicked(_ sender: Any) {
        self.btnSubmit.setCorenerRedious()
        objprofileViewModel.email = txtEmail.text
        objprofileViewModel.image = imgProfile.image
        
        do {
            let valied = try objprofileViewModel.validation()
            if valied {
                self.moveToNextViewController()
            }
        }
        catch ProfileError.profile {
            Alert().showAlert(message: ProfileError.profile.descriptionMessage(), viewController: self)
        }
        catch ProfileError.emailEmpty {
            Alert().showAlert(message: ProfileError.emailEmpty.descriptionMessage(), viewController: self)
        }
        catch ProfileError.invaliedEmail {
            Alert().showAlert(message: ProfileError.invaliedEmail.descriptionMessage(), viewController: self)
        }
        catch ProfileError.age {
            Alert().showAlert(message: ProfileError.age.descriptionMessage(), viewController: self)
        }
        catch ProfileError.faviouritePlace {
            Alert().showAlert(message: ProfileError.faviouritePlace.descriptionMessage(), viewController: self)
        }
        catch ProfileError.mostPlaces {
            Alert().showAlert(message: ProfileError.mostPlaces.descriptionMessage(), viewController: self)
        }
        catch {
            
        }
    }
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnNextClicked(_ sender: Any) {
        btnSubmit.setOrangeColor()
        self.moveToNextViewController()
        
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
