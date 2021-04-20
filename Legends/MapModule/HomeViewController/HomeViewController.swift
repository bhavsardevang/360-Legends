//
//  HomeViewController.swift
//  Legends
//
//   on 13/04/21.
//

import UIKit
import MapKit
import GLWalkthrough
typealias UpdateTransferntViewCloser = (Bool) -> Void
class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var viewImages: UIView!
    @IBOutlet weak var userIcon1: UIImageView!
    @IBOutlet weak var imgChecked1: UIImageView!
    
    @IBOutlet weak var userIcon2: UIImageView!
    @IBOutlet weak var imgChecked2: UIImageView!
    
    @IBOutlet weak var viewSeprator: UIView!
    @IBOutlet weak var userIcon3: UIImageView!
    @IBOutlet weak var imgChecked3: UIImageView!
    @IBOutlet weak var userIcon4: UIImageView!
    @IBOutlet weak var imgChecked4: UIImageView!
    @IBOutlet weak var userIcon5: UIImageView!
    
    @IBOutlet weak var imgShare: UIImageView!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var imgChecked5: UIImageView!
    
    @IBOutlet weak var btnSeeAll: UIButton!
    public let CKMapViewDefaultAnnotationViewReuseIdentifier = "annotation"
    var objPHPickerViewModel = PHPickerViewModel()
    var arrAllImages = [UIImage]()
    var arrAllCoordinator = [CLLocationCoordinate2D]()
    var updateWhenGetAllImages:UpdateGetImages?
    @IBOutlet weak var btnFilter: UIButton!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblRecommandedTitle: UILabel!
    @IBOutlet weak var lblRecommandedDescription: UILabel!
    
    @IBOutlet weak var imgRecommanded: UIImageView!
    
    @IBOutlet weak var viewRecommanded: UIView!
    
    @IBOutlet weak var layoutConstraintAlertTopView: NSLayoutConstraint!
    @IBOutlet weak var viewTransperent: UIView!
    
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var btnAccess: UIButton!
    @IBOutlet weak var viewAlert: UIView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var imgFilter: UIImageView!
    var objHomeViewModel = HomeViewModel()
    var objPhotoLoading:PhotoLoadingViewController?
    var updateTransferantView:UpdateTransferntViewCloser?
    var locationManager:CLLocationManager!
    var walkThrought:GLWalkThrough?
    var customAnnotationView2 :AnnotationCustomView?
    @IBOutlet weak var lblDoNotUpload: UILabel!
    @IBOutlet weak var lblAlertDescription: UILabel!
    @IBOutlet weak var lblAlertTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewWillAppear(animated)
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.configData()
       // self.addAnnotation()
        self.perform(#selector(self.configureWalkThrough), with: nil, afterDelay: 1.0)
        self.setUpUserImageCornerRadious()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.determineCurrentLocation()
    }
    @IBAction func btnLocationClicked(_ sender: Any) {
        self.showAleart()
    }
    @IBAction func btnFilterClicked(_ sender: Any) {
        self.moveToFilter()
    }
    
    @IBAction func btnUserClicked(_ sender: Any) {
        
    }
    @IBAction func btnAccessClicked(_ sender: Any) {
        self.hideAleart()
        self.alertForAccessPhotos()
    }
    
    @IBAction func btnSeeAll(_ sender: Any) {
        let objFriendViewController:FriendListViewController = UIStoryboard(name: MapStoryBoard, bundle: nil).instantiateViewController(identifier: "FriendListViewController") as! FriendListViewController
        self.navigationController?.pushViewController(objFriendViewController, animated: true)
    }
    
    @IBAction func btnShareClicked(_ sender: Any) {
        let objRecommandation:RegionViewController = UIStoryboard(name: RecommendationStoryBoard, bundle: nil).instantiateViewController(identifier: "RegionViewController") as! RegionViewController
        self.navigationController?.pushViewController(objRecommandation, animated: true)
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
