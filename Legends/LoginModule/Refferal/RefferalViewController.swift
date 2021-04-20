//
//  RefferalViewController.swift
//  Legends
//
//   on 10/04/21.
//

import UIKit
import SkyFloatingLabelTextField
class RefferalViewController: UIViewController {

    @IBOutlet weak var viewCorner: UIView!
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var lblGreat: UILabel!
    @IBOutlet weak var iconBlack: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var txtFirstName: SkyFloatingLabelTextField!
    @IBOutlet weak var txtLastName: SkyFloatingLabelTextField!
    @IBOutlet weak var lblTitle: UILabel!
    var objRefferalViewModel = RefferalViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureData()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidAppear(_ animated: Bool) {
        viewCorner.roundCorners(corners: [.topLeft,.topRight], radius:CGFloat(redious))
    }
    @IBAction func btnSubmitClicked(_ sender: Any) {
      //  self.moveToNext()
        self.btnSubmit.setCorenerRedious()
        objRefferalViewModel.fName = txtFirstName.text
        objRefferalViewModel.lName = txtLastName.text
        do {
            let value = try objRefferalViewModel.setvalidation()
            if value {
                self.moveToNext()
            }
        }
        catch NameError.firstNameEmpty {
            Alert().showAlert(message: NameError.firstNameEmpty.description(), viewController: self)
        }
        catch NameError.lastNameEmpty {
            Alert().showAlert(message: NameError.lastNameEmpty.description(), viewController: self)
        }
        catch {
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
