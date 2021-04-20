//
//  AllImageTableViewCell.swift
//  Legends
//
//   on 20/04/21.
//

import UIKit

class AllImageTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionViewImages: UICollectionView!
    var numberOfSections:Int = 1
    var numberofItems:Int = 1
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        self.configCollectionView()
        
    }
    
    func configCollectionView() {
        self.collectionViewImages.delegate = self
        self.collectionViewImages.dataSource = self
        self.collectionViewImages.isScrollEnabled = false
    }
    
    func setCornerRadious(imageView:UIImageView)  {
        imageView.layer.cornerRadius = 10.0
        imageView.contentMode = .scaleToFill
    }
    
    func setRoundedImage(imageView:UIImageView) {
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.contentMode = .scaleToFill
    }

}
extension AllImageTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfSections
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let data = numberofItems - (section * 4)
        print("All Data = \(data)")
        if data > 3 {
            return 4
        } else {
            return data
        }
    //    return 4
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0.0, height: 0.0)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewImages.dequeueReusableCell(withReuseIdentifier: "ImagesCollectionViewCell", for: indexPath)  as! ImagesCollectionViewCell
        cell.imgmainImage.image = UIImage(named: "refferalImage")
        self.setCornerRadious(imageView: cell.imgmainImage)
        cell.imgSelectionImage.image = UIImage(named: "square")
        self.setRoundedImage(imageView: cell.imgSelectionImage)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        //CGSize(width: 78.0,height: 78.0)
        return CGSize(width: ((screenWidth - 40)/4) ,height: ((screenWidth - 40)/4))
    }
}
