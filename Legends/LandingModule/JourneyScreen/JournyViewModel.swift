//
//  JournyViewModel.swift
//  Legends
//
//   on 09/04/21.
//

import UIKit

class JournyViewModel: NSObject {
    var arrImageTitle = ["discoveryImage","recommandation","mobileSkatch","mobileSkatch"]
 var arrTitle = ["Map your travels","Make recommendations","Discover","Ask for recommendations"]
 var arrDescription = ["See the places you have visited with one click using photo location data...","Share your best recommendations with friends.","See where your friends have been, explore and save their best recommendations to help plan your next trip...","Ask Legends and your friends for tailored trusted recommendations."]
    var index:Int = 0
    var swipenext:Bool = true
    var isright:Bool = false
}
extension JournyViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return objJournalViewModel.arrImageTitle.count
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objJournalViewModel.arrImageTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionImageView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath)  as! ImageCollectionViewCell
        let imageName = objJournalViewModel.arrImageTitle[indexPath.row]
        cell.imgDisplay.image = UIImage(named:imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)

    }
}
extension JournyViewController {
    func  configureData() {
      
        self.changeFont(index: 0)
        self.lblTitle.text = objJournalViewModel.arrTitle[0]
        self.lblDescription.text = objJournalViewModel.arrDescription[0]
        self.lblDescription.font = UIFont(name: lblDescription.font.familyName, size: (16.0 * fontMultiplier))
     
        btnSubmit.setCorenerRedious()
        btnSubmit.setOrangeColor()
        var leftRecognizer = UISwipeGestureRecognizer(target: self, action:
        #selector(swipeMade(_:)))
           leftRecognizer.direction = .left
        var rightRecognizer = UISwipeGestureRecognizer(target: self, action:
        #selector(swipeMade(_:)))
           rightRecognizer.direction = .right
           self.view.addGestureRecognizer(leftRecognizer)
           self.view.addGestureRecognizer(rightRecognizer)
    }

    func changeData(index:Int) {
        self.changeFont(index: index)
        if index < objJournalViewModel.arrImageTitle.count {
            self.lblTitle.text = objJournalViewModel.arrTitle[index]
            self.lblDescription.text = objJournalViewModel.arrDescription[index]
            DispatchQueue.main.async {
                if  self.objJournalViewModel.swipenext {
                    self.collectionImageView.scrollToNextItem()
                }
                else {
                    self.collectionImageView.scrollToPreviousItem()
                }
      
            }
          
            self.pagerView.currentPage = index
        }
        if index == objJournalViewModel.arrImageTitle.count - 1 {
            self.btnSubmit.setTitle("Join the community", for: .normal)
        } else {
            self.btnSubmit.setTitle("Next", for: .normal)
        }
        if self.btnSubmit.titleLabel?.text == "Join the community" && objJournalViewModel.swipenext {
            self.moveToNextViewController()
           // objJournalViewModel.isright = false
        }
       
    }
    
    func changeFont(index:Int) {
        switch index {
        case 0:
            self.lblTitle.font = UIFont(name: CustomFontName().helvatica_regular, size: (20.0 * fontMultiplier))
            return
        case 1:
            self.lblTitle.font = UIFont(name: CustomFontName().sans_bold, size: (20.0 * fontMultiplier))
            return
        case 2:
            self.lblTitle.font = UIFont(name: CustomFontName().helvatica_regular, size: (20.0 * fontMultiplier))
            return
        case 3:
            self.lblTitle.font = UIFont(name: CustomFontName().sans_bold, size: (20.0 * fontMultiplier))
            return
        default:
            self.lblTitle.font = UIFont(name: CustomFontName().helvatica_regular, size: (20.0 * fontMultiplier))
            return
        }
    }
    func moveToNextViewController() {
        let objViewController = UIStoryboard(name: MainStoryBoard, bundle: nil).instantiateViewController(identifier: "SIgnUpNavigation")
        self.view.window?.rootViewController = objViewController
    }
    @IBAction func swipeMade(_ sender: UISwipeGestureRecognizer) {
       if sender.direction == .left {
        objJournalViewModel.index += 1
        objJournalViewModel.swipenext = true
        self.changeData(index: objJournalViewModel.index)
       }
       if sender.direction == .right {
        objJournalViewModel.index -= 1
        if objJournalViewModel.index < 0 {
            objJournalViewModel.index = 0
            return
        }
       // objJournalViewModel.isright = true
        objJournalViewModel.swipenext = false
        self.changeData(index: objJournalViewModel.index)
        
       }
    }
}
extension UICollectionView {
    func scrollToNextItem() {
        let contentOffset = CGFloat(floor(self.contentOffset.x + self.bounds.size.width))
        self.moveToFrame(contentOffset: contentOffset)
    }

    func scrollToPreviousItem() {
        let contentOffset = CGFloat(floor(self.contentOffset.x - self.bounds.size.width))
        self.moveToFrame(contentOffset: contentOffset)
    }

    func moveToFrame(contentOffset : CGFloat) {
        self.setContentOffset(CGPoint(x: contentOffset, y: self.contentOffset.y), animated: true)
    }
}
