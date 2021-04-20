//
//  WelcomeViewController.swift
//  Legends
//
//   on 09/04/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var btnStartJourny: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureData()
    }
    
    func configureData() {
        btnStartJourny.setCorenerRedious()
        btnStartJourny.setTitleColor(UIColor.white, for: .normal)
        btnStartJourny.layer.borderColor = UIColor.white.cgColor
        self.lblWelcome.font = UIFont(name:CustomFontName().serif_regular, size: (56.0 * fontMultiplier))
        self.lblDescription.font = UIFont(name: CustomFontName().sans_regular, size: (20.0 * fontMultiplier))
    }

    @IBAction func btnStartJournyClicked(_ sender: Any) {
        let objJournalViewController:JournyViewController = UIStoryboard(name: LandingStoryBoard, bundle: nil).instantiateViewController(identifier: "JournyViewController") as! JournyViewController
        self.navigationController?.pushViewController(objJournalViewController, animated: true)
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
