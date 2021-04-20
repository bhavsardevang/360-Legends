//
//  TagViewTableViewCell.swift
//  Legends
//
//   on 19/04/21.
//

import UIKit

class TagRegionViewTableViewCell: UITableViewCell {
  
    @IBOutlet weak var collectionViewTag: UICollectionView!
    var objSelectInterstViewModel = SelectInterstViewModel()
    var index:Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        self.configureCollectionView()
    }
    func configureCollectionView() {
        self.collectionViewTag.delegate = self
        self.collectionViewTag.dataSource = self
        self.collectionViewTag.isScrollEnabled = true
    }
    func configureTag(tagView:CloudTagView) {
        self.updateFrame(mainTagView: tagView)
        self.index = 0
        self.addTag(strTagName: "Food & Drink", image: UIImage(named:"travel")!,mainTagView: tagView)
        self.addTag(strTagName: "Activity", image: UIImage(named:"music")!, mainTagView: tagView)
        self.addTag(strTagName: "Lodging", image: UIImage(named:"nature")!, mainTagView: tagView)
        self.addTag(strTagName: "Local Contact", image: UIImage(named:"food")!, mainTagView: tagView)
        self.addTag(strTagName: "Food & Drink", image: UIImage(named:"travel")!,mainTagView: tagView)
        self.addTag(strTagName: "Local Contact", image: UIImage(named:"food")!, mainTagView: tagView)
       
        
    }
    func addTag(strTagName:String,image:UIImage,mainTagView:CloudTagView) {
      
        let tagview = TagView(text: " " + strTagName + " ")
        tagview.iconImage = image
        tagview.tag = self.index
        self.index += 1
        tagview.font = UIFont(name: CustomFontName().sans_regular, size: (16.0 * fontMultiplier))!
        mainTagView.tags.append(tagview)
        tagview.isBackgroundColorChange = false
        tagview.backgroundColor = hexStringToUIColor(hex: "F3F4F6")
        //objSelectInterstViewModel.arrSelectedValue = [String]()
    }
    func updateFrame(mainTagView:CloudTagView) {
        mainTagView.frame = CGRect(x: 0.0, y: 0.0, width: (Double(6.0) * 80.0), height: 50.0)
    }

}
extension TagRegionViewTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return objJournalViewModel.arrImageTitle.count
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewTag.dequeueReusableCell(withReuseIdentifier: "TagRegionViewCollectionViewCell", for: indexPath)  as! TagRegionViewCollectionViewCell
        cell.viewForTag.delegate = self
        self.configureTag(tagView: cell.viewForTag)
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
        return CGSize(width: (collectionView.frame.size.width), height: collectionView.frame.size.height)

    }
}
extension TagRegionViewTableViewCell:TagViewDelegate {
    func tagTouched(_ tag: TagView) {
        print("tag index = \(tag.tag)")
        objSelectInterstViewModel.changeBackgroundTagView(tag: tag)
    }
}
