//
//  ProfileCompeleteModel.swift
//  Legends
//
//   on 12/04/21.
//

import UIKit
import InstagramLogin
import Contacts

struct InstagramCredential {
    static let clientId = "<YOUR CLIENT ID GOES HERE>"
    static let redirectUri = "<YOUR REDIRECT URI GOES HERE>"
}

class ProfileCompeleteViewModel: NSObject {
    
}
extension ProfileCompleteViewController {
    func configureData() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.btnFindPeople.setCorenerRedious()
        self.btnFindPeople.setOrangeColor()
        btnLoginWithInstagram.setCorenerRedious()
        btnLoginWithInstagram.layer.borderColor = hexStringToUIColor(hex: "FCEAE2").cgColor
    }
    //MARK:- Instagram Login
    func instagramClicked() {
        instagramLogin = InstagramLoginViewController(clientId: InstagramCredential.clientId, redirectUri: InstagramCredential.redirectUri)
        instagramLogin.delegate = self
        instagramLogin.scopes = [.all]

        instagramLogin.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissLoginViewController))
        instagramLogin.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshPage))
        instagramLogin.modalPresentationStyle = .overFullScreen
        instagramLogin.isModalInPresentation = true
        present(UINavigationController(rootViewController: instagramLogin), animated: true)
    }
    @objc func dismissLoginViewController() {
        instagramLogin.dismiss(animated: true)
    }
    @objc func refreshPage() {
        instagramLogin.reloadPage()
    }
    
    func alertMessageForAddPepole()  {
        let alert = UIAlertController(title:"Legends would like acces to your contacts", message: "This let’s you see which of your friends are on Legends.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Don't allow", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (result) in
           // self.fetchContacts()
            self.moveTonext()
        }))
        self.present(alert, animated: true, completion: nil)

    }
    
    //MARK:- Fetch the contact from the device
    func fetchContacts()  {
        let contactStore = CNContactStore()
        var contacts = [CNContact]()
        let keys = [
                CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
                        CNContactPhoneNumbersKey,
                        CNContactEmailAddressesKey
                ] as [Any]
        let request = CNContactFetchRequest(keysToFetch: keys as! [CNKeyDescriptor])
        do {
            try contactStore.enumerateContacts(with: request){
                    (contact, stop) in
                // Array containing all unified contacts from everywhere
                contacts.append(contact)
                for phoneNumber in contact.phoneNumbers {
                    if let number = phoneNumber.value as? CNPhoneNumber, let label = phoneNumber.label {
                        let localizedLabel = CNLabeledValue<CNPhoneNumber>.localizedString(forLabel: label)
                        print("\(contact.givenName) \(contact.familyName) tel:\(localizedLabel) -- \(number.stringValue), email: \(contact.emailAddresses)")
                    }
                }
            }
            print(contacts)
            self.moveTonext()
        } catch {
            print("unable to fetch contacts")
        }
    }
    
    func moveTonext() {
        let objProfileCompleteViewController:ContactListViewController = UIStoryboard(name: MainStoryBoard, bundle: nil).instantiateViewController(identifier: "ContactListViewController") as! ContactListViewController
        self.navigationController?.pushViewController(objProfileCompleteViewController, animated: true)
    }
}
extension ProfileCompleteViewController: InstagramLoginViewControllerDelegate {

    func instagramLoginDidFinish(accessToken: String?, error: InstagramError?) {
        dismissLoginViewController()

        if accessToken != nil {
            Alert().showAlert(message: "Successfully logged in!", viewController: self)
        } else {
            Alert().showAlert(message: error!.localizedDescription, viewController: self)
        }
    }
}
