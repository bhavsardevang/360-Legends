//
//  JournyViewController.swift
//  Legends
//
//   on 09/04/21.
//

import UIKit

class JournyViewController: UIViewController {

    @IBOutlet weak var collectionImageView: UICollectionView!
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var pagerView: UIPageControl!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    let objJournalViewModel = JournyViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.collectionImageView.delegate = self
        self.collectionImageView.dataSource = self
        self.collectionImageView.isScrollEnabled = false
        self.configureData()
    }
    
    @IBAction func btnSubmitClicked(_ sender: Any) {
        objJournalViewModel.index += 1
        self.objJournalViewModel.swipenext = true
        //objJournalViewModel.isright = true
        self.changeData(index: objJournalViewModel.index)
    }
    
    @IBAction func btnSkipClicked(_ sender: Any) {
        self.btnSubmit.setCorenerRedious()
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
