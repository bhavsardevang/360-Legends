//
//  ImagePicker.swift
//  Legends
//
//   on 10/04/21.
//

import UIKit
import Photos
import AssetsLibrary
typealias ImagePass = (UIImage) -> Void
final class ImagePicker: NSObject {
    static var sharedObject = ImagePicker()
    private override init() {
    }
    var selectedImage:ImagePass?
    func openCamera(viewController:UIViewController)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            imagePicker.isModalInPresentation = true
            imagePicker.modalPresentationStyle = .overFullScreen
            viewController.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            Alert().showAlert(message: "You don't have camera", viewController: viewController)
        }
    }
    func openGallery(viewController:UIViewController)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            imagePicker.isModalInPresentation = true
            imagePicker.modalPresentationStyle = .overFullScreen
            //viewController.present(imagePicker, animated: true, completion: nil)
            if PHPhotoLibrary.authorizationStatus() == .notDetermined {
                PHPhotoLibrary.requestAuthorization { [weak self](_) in
                    // Present the UIImagePickerController
                    viewController.present(imagePicker, animated: true, completion: nil)
                }
            } else {
                viewController.present(imagePicker, animated: true, completion: nil)
            }
        }
        else
        {
             Alert().showAlert(message: "don't have permission to access gallery.", viewController: viewController)
        }
    }
    
}
extension ImagePicker:UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let coordinate = (info[UIImagePickerController.InfoKey.phAsset] as? PHAsset)?.location?.coordinate
        print("coordinate = \(String(describing: coordinate))")
             if let pickedImage = info[.originalImage] as? UIImage {
                
                    selectedImage!(pickedImage)
             }
      
             picker.dismiss(animated: true, completion: nil)
         }
}
