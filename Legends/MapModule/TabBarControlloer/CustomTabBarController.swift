//
//  CustomTabBarController.swift
//  Legends
//
//   on 12/04/21.
//

import UIKit

typealias selectedPointClosure = (Float,Float) -> Void
class CustomTabBarController: UITabBarController {
   open var kBarHeight:CGFloat = 200
    var tranferrentView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    override func viewWillAppear(_ animated: Bool) {
        UITabBar.appearance().barTintColor = UIColor.white
        self.configureData()
    }
    
    func configureData() {
         let value = self.tabBar as! CustomizedTabBar
        let newvalue:Float = Float((self.view.bounds.width / 2) - 25)
        let lastvalue:Float = newvalue + 50
        value.selectedPointValue = {[weak self] (x,y) in
            print("Result = \(x),\(y) width = \(newvalue)")
            if x > newvalue && x < lastvalue {
                self?.menuButtonAction(sender:UIButton())
            }
        }
        self.setupMiddleButton()
        self.setupAllController()
        tranferrentView.frame = CGRect(x: 0, y: -30, width: self.view.frame.width, height: self.view.frame.height + 30)
        tranferrentView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.65)
        tranferrentView.isHidden = true
        tabBar.addSubview(tranferrentView)
    }
    
    func setupMiddleButton() {
        
          let middleBtn = UIButton(frame: CGRect(x: (self.view.bounds.width / 2)-25, y: -25, width: 50, height: 50))
        middleBtn.setBackgroundImage(UIImage(named: "addMap"), for: .normal)
          
          //add to the tabbar and add click event
          self.tabBar.addSubview(middleBtn)
          middleBtn.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)

          self.view.layoutIfNeeded()
      }

      // Menu Button Touch Action
      @objc func menuButtonAction(sender: UIButton) {
          self.selectedIndex = 2   //to select the middle tab. use "1" if you have only 3 tabs.
      }

    func setupAllController() {
        let Item1ViewController:HomeViewController = UIStoryboard(name: MapStoryBoard, bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let item1 = UINavigationController(rootViewController: Item1ViewController)//Item1ViewController()
        Item1ViewController.updateTransferantView = {[weak self] result in
            //print(result)
                DispatchQueue.main.async {
                    if result == true {
                        self!.tranferrentView.isHidden = false
                    } else {
                        self!.tranferrentView.isHidden = true
                    }
                }
               
        }
        item1.setNavigationBarHidden(true, animated: false)
        item1.tabBarItem =  UITabBarItem.init(title: "Discover", image: UIImage(named: "invite"), tag: 0)//icon1

        item1.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -32.0)
        item1.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font:(UIFont(name: CustomFontName().sans_regular, size: 14.0)) as Any],for: .normal)
        item1.tabBarItem.imageInsets = UIEdgeInsets(top: 25.0, left: 0.0, bottom: -5.0, right: 0.0)
        self.setTabBarFont(item: item1)

        let Item2ViewController:UIViewController = UIStoryboard(name: MapStoryBoard, bundle: nil).instantiateViewController(withIdentifier: "QuationViewController") as! QuationViewController
        let item2 = UINavigationController(rootViewController: Item2ViewController)//Item1ViewController()
        item2.setNavigationBarHidden(true, animated: false)
        item2.tabBarItem =  UITabBarItem.init(title: "", image: UIImage(named: "chat"), tag: 1)//icon1
        item2.tabBarItem.imageInsets = UIEdgeInsets(top: 5.0, left: -30.0, bottom: 3.0, right: 30.0)
        self.setTabBarFont(item: item2)


        let Item3ViewController:UIViewController = UIStoryboard(name: MapStoryBoard, bundle: nil).instantiateViewController(withIdentifier: "BookMarkViewController") as! BookMarkViewController
        let item3 = UINavigationController(rootViewController: Item3ViewController)//Item1ViewController()
        item3.setNavigationBarHidden(true, animated: false)
        item3.tabBarItem =  UITabBarItem.init(title: "", image: UIImage(named: "bookMark"), tag: 2)//icon1
        item3.tabBarItem.imageInsets = UIEdgeInsets(top: 5.0, left: 30.0, bottom: 3.0, right: -30.0)
        self.setTabBarFont(item: item3)


        let Item4ViewController:UIViewController = UIStoryboard(name: MapStoryBoard, bundle: nil).instantiateViewController(withIdentifier: "BellViewController") as! BellViewController
        let item4 = UINavigationController(rootViewController: Item4ViewController)//Item1ViewController()
        item4.setNavigationBarHidden(true, animated: false)
        item4.tabBarItem =  UITabBarItem.init(title: "", image: UIImage(named: "bell"), tag: 3)//icon1
        item4.tabBarItem.imageInsets = UIEdgeInsets(top: 5.0, left: 0.0, bottom: 3.0, right: 0.0)
        self.setTabBarFont(item: item4)

         let controllers = [item1,item2,item3,item4]//item2,item3,item4
         self.viewControllers = controllers


    }

    func setTabBarFont(item:UINavigationController) {
        item.tabBarItem.badgeColor = UIColor.white
        item.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : hexStringToUIColor(hex: CustomColor().orangeType)], for: .selected)
        UITabBar.appearance().tintColor =  hexStringToUIColor(hex: CustomColor().orangeType)//UIColor.white
        item.navigationBar.isHidden = true
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
extension CustomTabBarController:UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true;
    }
}
extension UITabBar {
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 100
        return sizeThatFits
    }
}
