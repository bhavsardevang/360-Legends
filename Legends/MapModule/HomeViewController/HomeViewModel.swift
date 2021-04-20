//
//  HomeViewModel.swift
//  Legends
//
//   on 13/04/21.
//

import UIKit
import MapKit
import GLWalkthrough
class HomeViewModel: NSObject {
    func viewAnimationShow(view:UIView,layoutConstraintAlertTopView:NSLayoutConstraint) {
        UIView.animate(withDuration:0.5, delay: 0.3, options: [.curveEaseIn],
                     animations: {
                        layoutConstraintAlertTopView.constant =  66.0
                        view.layoutIfNeeded()
      }, completion: nil)
    }
    func viewAnimationHide(view:UIView,layoutConstraintAlertTopView:NSLayoutConstraint,viewTransperent:UIView) {
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [.curveLinear],
                       animations: {
                        layoutConstraintAlertTopView.constant =  1000.0
                        view.layoutIfNeeded()

        },  completion: {(_ completed: Bool) -> Void in
            view.isHidden = true
            viewTransperent.isHidden = true
            })
    }
    
    func setCornerRediousOfImage(imageView:UIImageView)  {
        imageView.layer.cornerRadius = imageView.frame.width/2.0
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.masksToBounds = true
    }
    func setCornerRadiousOfView(view:UIView) {
        view.layer.cornerRadius = 10.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.gray.cgColor
    }
}

//MARK:- Location Delegate
extension HomeViewController:CLLocationManagerDelegate {
    
    private func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let userLocation:CLLocation = locations[0] as CLLocation
            print("Updating location")
            let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            
            mapView.setRegion(region, animated: true)
            
            // Drop a pin at user's Current Location
//            let myAnnotation: MKPointAnnotation = MKPointAnnotation()
//            myAnnotation.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude);
//            myAnnotation.title = "User location"
//            mapView.addAnnotation(myAnnotation)
        }
        
    private func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
        {
            print("Error \(error)")
        }
}
//MARK:- MapView Delegate
extension HomeViewController:MKMapViewDelegate  {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is MKPointAnnotation) {
                    return nil
                }
       // let annotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationCustomView", for: annotation)
        let annotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier:"LocationWithUsericonAnnotationView", for: annotation)
        //self.mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationCustomView") as? AnnotationCustomView
        
        if annotationView != nil {
            print("title = \(annotation.title!!)")
            let name:String = annotation.title!!
            let lastName = name.last
            let id:Int = Int(String(lastName!))!
            print("Id = \(id)")
             if name == "User1" {
                let customAnnotationView = Bundle.main.loadNibNamed("AnnotationCustomViewWithText", owner: self, options: nil)?.first as? AnnotationCustomViewWithText
                customAnnotationView?.layoutConstraintWidthOfView.constant = (78 - 16)
                customAnnotationView?.layoutConstraintEqualyHightOfElipse.constant = 0.0
                customAnnotationView?.imgUserIcon.image = self.arrAllImages[id]
                customAnnotationView?.imgUserIcon.contentMode = .scaleAspectFit
                customAnnotationView?.eclipsicon.isHidden = true
                customAnnotationView?.layoutIfNeeded()
                objHomeViewModel.setCornerRadiousOfView(view: (customAnnotationView?.viewForText)!)
                 annotationView.addSubview(customAnnotationView!)
                
            } else if name == "User2" {
                let customAnnotationView1 = Bundle.main.loadNibNamed("AnnotationCustomViewWithText", owner: self, options: nil)?.first as? AnnotationCustomViewWithText
                customAnnotationView1?.imgUserIcon.image = self.arrAllImages[id]
                customAnnotationView1?.imgUserIcon.contentMode = .scaleAspectFit
                customAnnotationView1?.layoutIfNeeded()
                objHomeViewModel.setCornerRadiousOfView(view: (customAnnotationView1?.viewForText)!)
                 annotationView.addSubview(customAnnotationView1!)
            } else {
               let  customAnnotationView3 = Bundle.main.loadNibNamed("AnnotationCustomView", owner: self, options: nil)?.first as? AnnotationCustomView
                customAnnotationView3?.imgUserIcon.image = self.arrAllImages[id]
                customAnnotationView3?.imgUserIcon.contentMode = .scaleAspectFit
                 objHomeViewModel.setCornerRediousOfImage(imageView: customAnnotationView3!.imgUserSelected)
                 annotationView.addSubview(customAnnotationView3!)
              
                //self.configureWalkThrough()
            }
         
        }
        
        return annotationView
    }
}
//MARK:- Textfield Delegate
extension HomeViewController:UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        txtSearch.resignFirstResponder()
        if txtSearch.text == "Legends".lowercased() {
            Alert().showAlert(message: "Data Found", viewController: self)
        }else if txtSearch.text == "" {
        }else {
            Alert().showAlert(message: "No Data Found", viewController: self)
        }
       
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.count > 3 {
            
        }
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtSearch {
            txtSearch.resignFirstResponder()
        }
        return true
    }
}

extension HomeViewController {
    func configData() {
        self.mapView.delegate = self
        self.recommandedHidden()
       // self.mapView.register(LocationWithUsericonAnnotationView.self, forAnnotationViewWithReuseIdentifier: "AnnotationCustomView")
        mapView.register(LocationWithUsericonAnnotationView.self, forAnnotationViewWithReuseIdentifier: "LocationWithUsericonAnnotationView")
        self.layoutConstraintAlertTopView.constant = 1000
        self.viewAlert.isHidden = true
        self.viewTransperent.isHidden = true
        self.btnAccess.layer.cornerRadius = (20.0 * fontMultiplier)
        self.btnAccess.layer.masksToBounds = true
        self.btnSeeAll.titleLabel?.font = UIFont(name: CustomFontName().sans_bold, size: (14 * fontMultiplier))
        self.btnAccess.titleLabel?.font = UIFont(name: CustomFontName().sans_bold, size: (14 * fontMultiplier))
        self.lblAlertTitle.font = UIFont(name: CustomFontName().sans_regular, size: (24 * fontMultiplier))
        self.lblAlertDescription.font = UIFont(name: CustomFontName().sans_regular, size: (14 * fontMultiplier))
        self.lblDoNotUpload.font =  UIFont(name: CustomFontName().sans_regular, size: (13 * fontMultiplier))
        updateWhenGetAllImages = {[weak self] result in
            self?.setAllAnnotationFromFetchingData()
        }
        viewImages.layer.cornerRadius = (20.0 * fontMultiplier)
        viewSearch.layer.cornerRadius = (20.0 * fontMultiplier)
       // self.perform(#selector(addAnnotation), with: nil, afterDelay: 2)
       // self.addAnnotation()
    }
    @objc func configureWalkThrough() {
        walkThrought = GLWalkThrough()
        walkThrought!.dataSource = self
        walkThrought!.delegate = self
        walkThrought!.show()
        
    }
    
    func setAllAnnotationFromFetchingData() {
        
        for i in 0...arrAllCoordinator.count - 1 {
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
                myAnnotation.coordinate = arrAllCoordinator[i]//CLLocationCoordinate2DMake(40.7128, 74.0060)
                myAnnotation.title = "User\(i)"
                mapView.addAnnotation(myAnnotation)
    }
        objPhotoLoading?.dismiss(animated: true, completion: nil)
        //self.mapView.layoutIfNeeded()
    }
    func determineCurrentLocation()
        {
            locationManager.requestWhenInUseAuthorization()
            if CLLocationManager.locationServicesEnabled() {
                locationManager.startUpdatingLocation()
            }
        }
    
    @objc func addAnnotation() {
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
                myAnnotation.coordinate = CLLocationCoordinate2DMake(40.7128, 74.0060)
                myAnnotation.title = "User1"
                mapView.addAnnotation(myAnnotation)
        
        let myAnnotation1: MKPointAnnotation = MKPointAnnotation()
                myAnnotation1.coordinate = CLLocationCoordinate2DMake(34.0522, 118.2437)
                myAnnotation1.title = "User2"
                mapView.addAnnotation(myAnnotation1)
        let myAnnotation2: MKPointAnnotation = MKPointAnnotation()
                myAnnotation2.coordinate = CLLocationCoordinate2DMake(36.1699, 115.1398)
                myAnnotation2.title = "User3"
                mapView.addAnnotation(myAnnotation2)
       
       // mapView.addAnnotations([MKAnnotation])
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.hideAleart()
    }
    func showAleart() {
        updateTransferantView!(true)
        self.viewAlert.isHidden = false
        self.viewTransperent.isHidden = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.viewTransperent.addGestureRecognizer(tap)
        objHomeViewModel.viewAnimationShow(view: self.viewAlert, layoutConstraintAlertTopView: self.layoutConstraintAlertTopView)
    }
    func hideAleart() {
        updateTransferantView!(false)
        objHomeViewModel.viewAnimationHide(view: self.viewAlert, layoutConstraintAlertTopView: self.layoutConstraintAlertTopView, viewTransperent: self.viewTransperent)
    }
    func alertForAccessPhotos() {
          let alert = UIAlertController(title:"\("Legends") would like access to your photos", message: "This will allow us to organize and process the last places you’ve visited, using photo location data.", preferredStyle: UIAlertController.Style.alert)
        
          alert.addAction(UIAlertAction(title: "Select photos...", style: .default, handler: { (result) in
            self.presentPicker()
          }))
          alert.addAction(UIAlertAction(title: "Allow access to all photos", style: .default, handler: { (result) in
            self.fetchAllPhotos()
          }))
          alert.addAction(UIAlertAction(title: "Don’t allow", style: .default, handler: { (result) in
              
          }))
          self.present(alert, animated: true, completion: nil)
      }
    func presentLoader() {
        objPhotoLoading = (UIStoryboard(name: MapStoryBoard, bundle: nil).instantiateViewController(identifier: "PhotoLoadingViewController") as! PhotoLoadingViewController)
        self.objPhotoLoading!.modalPresentationStyle = .overFullScreen
        self.present(self.objPhotoLoading!, animated: true, completion: nil)
    }
    
    func moveToFilter() {
        let objFilterData:FilterViewController = UIStoryboard(name: MapStoryBoard, bundle: nil).instantiateViewController(identifier: "FilterViewController") as! FilterViewController
        objFilterData.modalPresentationStyle = .overFullScreen
        self.present(objFilterData, animated: true, completion: nil)
    }
   
}
