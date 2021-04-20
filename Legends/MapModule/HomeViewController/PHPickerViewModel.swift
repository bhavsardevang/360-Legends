//
//  PHPickerController.swift
//  Legends
//
//   on 15/04/21.
//

import UIKit
import PhotosUI
import MobileCoreServices
import GLWalkthrough

typealias UpdateGetImages = (Bool) -> Void
class PHPickerViewModel: NSObject {
    var allPhotos : PHFetchResult<PHAsset>? = nil
    var index:Int = 0
    var totalImage:Int = 0
}
//MARK:- PHPickerController
extension HomeViewController {
    //MARK:- Recommanded View
    func recommandedShow() {
        self.viewRecommanded.isHidden = false
        self.imgRecommanded.isHidden = false
        self.lblRecommandedTitle.isHidden = false
        self.lblRecommandedDescription.isHidden = false
    }
    func recommandedHidden() {
        self.viewRecommanded.isHidden = true
        self.imgRecommanded.isHidden = true
        self.lblRecommandedTitle.isHidden = true
        self.lblRecommandedDescription.isHidden = true
    }
    
    func setUpUserImageCornerRadious()  {
        objHomeViewModel.setCornerRediousOfImage(imageView: userIcon1)
        objHomeViewModel.setCornerRediousOfImage(imageView: userIcon2)
        objHomeViewModel.setCornerRediousOfImage(imageView: userIcon3)
        objHomeViewModel.setCornerRediousOfImage(imageView: userIcon4)
        objHomeViewModel.setCornerRediousOfImage(imageView: userIcon5)
        
        objHomeViewModel.setCornerRediousOfImage(imageView: imgChecked1)
        objHomeViewModel.setCornerRediousOfImage(imageView: imgChecked2)
        objHomeViewModel.setCornerRediousOfImage(imageView: imgChecked3)
        objHomeViewModel.setCornerRediousOfImage(imageView: imgChecked4)
        objHomeViewModel.setCornerRediousOfImage(imageView: imgChecked5)
        
    }
    
    //MARK:- Image Picker
    func presentPicker() {
        // Create configuration for photo picker
        var configuration = PHPickerConfiguration()
        
        // Specify type of media to be filtered or picked. Default is all
        configuration.filter = .any(of: [.images,.livePhotos])
        
        // For unlimited selections use 0. Default is 1
        configuration.selectionLimit = 0
        
        // Create instance of PHPickerViewController
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        PHPhotoLibrary.shared()
        if PHPhotoLibrary.authorizationStatus() == .notDetermined {
            PHPhotoLibrary.requestAuthorization { [weak self](_) in
                // Present the UIImagePickerController
                self?.present(picker, animated: true, completion: nil)
            }
        } else {
            present(picker, animated: true)
        }
        
    }
    //MARK:- Fetch All Images
    func fetchAllPhotos() {
        /// Load Photos
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case .authorized:
                    let fetchOptions = PHFetchOptions()
                    self.objPHPickerViewModel.allPhotos = PHAsset.fetchAssets(with: .image, options: fetchOptions)
                    self.arrAllImages.removeAll()
                    for i in 0...self.objPHPickerViewModel.allPhotos!.count - 1 {
                        let image = self.getAssetThumbnail(asset: self.objPHPickerViewModel.allPhotos![i])
                        self.arrAllImages.append(image.0)
                        self.arrAllCoordinator.append(image.1)
                    }
                    self.objPHPickerViewModel.totalImage = self.objPHPickerViewModel.allPhotos!.count
                    self.updateWhenGetAllImages!(true)
                case .denied, .restricted:
                    Alert().showAlert(message: "Not allowed", viewController: self)
                case .notDetermined:
                    Alert().showAlert(message: "Not determined yet", viewController: self)
                case .limited:
                    Alert().showAlert(message: "limited", viewController: self)
                @unknown default:
                    print("Not determined yet")
                }
            }
    }
    //MARK:- Convet Assert to Image
    func getAssetThumbnail(asset: PHAsset) -> (UIImage,CLLocationCoordinate2D) {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        var location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
        option.isSynchronous = true
        manager.requestImage(for: asset, targetSize: CGSize(width: 100.0, height: 100.0), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
                thumbnail = result!
        })
        if asset.location?.coordinate != nil {
            location = asset.location!.coordinate
        }
        return (thumbnail,location)
    }

    func managePHPickerAllImages(results : [PHPickerResult]) {
        self.arrAllImages.removeAll()
//        let coordinate = (results[UIImagePickerController.InfoKey.phAsset] as? PHAsset)?.location?.coordinate
        
//        let identifiers = results.compactMap(\.assetIdentifier)
//        let fetchResult = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil)
        arrAllCoordinator.removeAll()
        for result in results {
            if let assetId = result.assetIdentifier {
               let assetResults = PHAsset.fetchAssets(withLocalIdentifiers: [assetId], options: nil)
               print(assetResults.firstObject?.creationDate ?? "No date")
               print(assetResults.firstObject?.location?.coordinate ?? "No location")
                arrAllCoordinator.append((assetResults.firstObject?.location!.coordinate)!)
            }
            let itemProvider = result.itemProvider
            itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                DispatchQueue.main.async { [self] in
                    guard let self = self else { return }
                    if let image = image as? UIImage{
                        self.arrAllImages.append(image)
                        //self.display(image: image)
                    }
                }
            }
        }
        self.updateWhenGetAllImages!(true)
    }
}
// MARK: PHPickerViewControllerDelegate Methods
extension HomeViewController: PHPickerViewControllerDelegate {

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // Always dismiss the picker first
        dismiss(animated: true)
        self.presentLoader()
        if !results.isEmpty {managePHPickerAllImages(results: results)}
    }

}
extension HomeViewController:GLWalkThroughDataSource,GLWalkThroughDelegate {
    func numberOfItems() -> Int {
        return 2//4
    }
    
    func configForItemAtIndex(index: Int) -> GLWalkThroughConfig {
        
        switch index {
        case 2:
            var config = GLWalkThroughConfig()
             let configData = self.setUpFirstWalkThrought(config: config)
            config.position = .topCenter
            return configData
        case 0:
            var config = GLWalkThroughConfig()
            config.title = ""
            config.subtitle = "Change the views here to also discover your friends visited places and recommendations."
            config.frameOverWindow = CGRect(x: btnFilter.frame.origin.x, y: btnFilter.frame.origin.y, width: btnFilter.frame.width, height: btnFilter.frame.height)//btnFilter.frame
            config.position = .topLeft
            return config
        case 1:
            var config = GLWalkThroughConfig()
            config.title = ""
            config.subtitle = "You can share your view"
            config.frameOverWindow = btnFilter.bounds
            config.position = .topLeft
            return config
        default:
            var config = GLWalkThroughConfig()
            config.title = ""
            config.subtitle = "You can share your view"
            config.frameOverWindow = CGRect(x: btnFilter.frame.origin.x, y: btnFilter.frame.origin.y, width: btnFilter.frame.width, height: btnFilter.frame.height)//btnFilter.frame
            config.position = .topLeft
            return config
        }
        
    }
    func setUpFirstWalkThrought(config:GLWalkThroughConfig) -> GLWalkThroughConfig {
        var configNewData = GLWalkThroughConfig()
        for annotation in mapView.annotations {
            let anView = mapView.view(for: annotation)
            if (anView != nil) {
                print("All View =\(anView?.frame ?? CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0))")
                configNewData.title = "We've mapped travels!"
                configNewData.subtitle = "Now add your best recommendations to share with your friends"
                configNewData.frameOverWindow = anView?.frame
                return configNewData
            }
        }
        return configNewData
    }
    
    func didSelectNextAtIndex(index: Int) {
        if index == 2 {
            walkThrought!.dismiss()
            let alert = UIAlertController(title: "Walkthrough Completed", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func didSelectSkip(index: Int) {
            walkThrought!.dismiss()
    }
    
    
}
