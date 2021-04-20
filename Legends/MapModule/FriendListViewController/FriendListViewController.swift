//
//  FriendListViewController.swift
//  Legends
//
//   on 19/04/21.
//

import UIKit

class FriendListViewController: UIViewController {

    @IBOutlet weak var lblTitleMessage: UILabel!
    @IBOutlet weak var lblfriends: UILabel!
    @IBOutlet weak var tblFriendList: UITableView!
    var objFriendListViewModel = FriendListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureData()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnClearAllClicked(_ sender: Any) {
        for i in 0...self.objFriendListViewModel.arrFriendList.count - 1 {
            var objFriend = self.objFriendListViewModel.arrFriendList[i]
            objFriend.isSelected = false
            self.objFriendListViewModel.arrFriendList[i] = objFriend
        }
        self.tblFriendList.reloadData()
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
