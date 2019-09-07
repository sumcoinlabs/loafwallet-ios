//
//  TabBarViewController.swift
//  loafwallet
//
//  Created by Kerry Washington on 9/7/19.
//  Copyright © 2019 Litecoin Foundation. All rights reserved.
//

import UIKit
import Foundation

class TabBarViewController: UIViewController, UITabBarDelegate {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tabBar: UITabBar!
  
    var storyboardNames:[String] = ["Transactions","Send","Buy","Receive","Spend"]
    var storyboardIDs:[String] = ["TransactionsViewController","SendLTCViewController", "BuyLTCViewController","ReceiveLTCViewController","SpendViewController"]
    var viewControllers:[UIViewController] = []
    var activeController:UIViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (index, storyboardID) in self.storyboardIDs.enumerated() {
            print(storyboardNames[index])
            print(storyboardID)
             let controller = UIStoryboard.init(name: storyboardNames[index], bundle: nil).instantiateViewController(withIdentifier: storyboardID)
             
            viewControllers.append(controller)
        }
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.layoutIfNeeded()
        
        self.containerView.isHidden = true
        
        guard let firstTabBarItem = self.tabBar.items?.first else {
            NSLog("ViewController cannot be initialized")  
            return
        }
        self.tabBar.selectedItem = firstTabBarItem
        self.tabBar.unselectedItemTintColor = .litecoinSilver
        self.tabBar.tintColor = .litecoinGreen
    }
    
    override var prefersStatusBarHidden: Bool { return true }
    
    func displayContentController(contentController:UIViewController) {
        self.addChildViewController(contentController)
        contentController.view.frame = self.containerView.frame
        self.view.addSubview(contentController.view)
        contentController.didMove(toParentViewController: self)
        self.activeController = contentController
    }
    
    func hideContentController(contentController:UIViewController) {
        contentController.willMove(toParentViewController: nil)
        contentController.view .removeFromSuperview()
        contentController.removeFromParentViewController()
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let tempActiveController = activeController {
            self.hideContentController(contentController: tempActiveController)
        }
        switch item.tag {
        case 0: //Transactions
            self.displayContentController(contentController: viewControllers[0])
        case 1://Send
            self.displayContentController(contentController: viewControllers[1])
        case 2://Buy
            self.displayContentController(contentController: viewControllers[2])
        case 3://Receive
            self.displayContentController(contentController: viewControllers[3])
        case 4://Spend
            self.displayContentController(contentController: viewControllers[4])
        default:
            fatalError("ERROR viewcontroller count is not matching")
        }
    }
}
