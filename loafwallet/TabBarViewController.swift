//
//  TabBarViewController.swift
//  loafwallet
//
//  Created by Kerry Washington on 9/7/19.
//  Copyright © 2019 Litecoin Foundation. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UITabBarDelegate {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tabBar: UITabBar!
  
    
    
    var storyboardIDs:[String] = ["TransactionsViewController","BuyLTCViewController", "CardViewController", "SendLTCViewController", "ReceiveLTCViewController"]
    var viewControllers:[UIViewController] = []
    var activeController:UIViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        for storyboardID in self.storyboardIDs {
//            guard let controller = self.storyboard?.instantiateViewController(withIdentifier: storyboardID) else {return}
//            
//            viewControllers.append(controller)
//        }
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.layoutIfNeeded()
        
        self.containerView.isHidden = true
        
      //  self.tabBar.selectedItem = self.accountTabBarItem
        
        self.tabBar.unselectedItemTintColor = .litecoinSilver
        self.tabBar.tintColor = .litecoinBlue
        
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
