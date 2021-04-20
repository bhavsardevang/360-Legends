//
//  PhotoLoadingViewController.swift
//  Legends
//
//   on 14/04/21.
//

import UIKit

class PhotoLoadingViewController: UIViewController {
    var index:Int = 0
    var arrAllText = ["Processing your photos","We will show you places you’ve visited, using photo location data","Complete"]
    var arrImageName = ["applogo","applogo","Invited"]
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.view.addGestureRecognizer(tap)
        lblDescription.font = UIFont(name: CustomFontName().sans_bold, size: (14.0 * fontMultiplier))
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
       index += 1
        self.updateView()
    }
    func updateView() {
        if index < arrAllText.count {
            imgLogo.image = UIImage(named: self.arrImageName[index])
            lblDescription.text = arrAllText[index]
            if index == arrAllText.count - 1 {
                imgLogo.tintColor = hexStringToUIColor(hex: CustomColor().orangeType)
                lblDescription.textColor = hexStringToUIColor(hex: CustomColor().orangeType)
            }
        } else {
            self.dismiss(animated: true, completion: nil)
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
