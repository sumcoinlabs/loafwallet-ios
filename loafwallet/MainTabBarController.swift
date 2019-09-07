//
//  TabBarController.swift
//  loafwallet
//
//  Created by Kerry Washington on 9/5/19.
//  Copyright © 2019 Litecoin Foundation. All rights reserved.
//

import UIKit

class TabBarController: UIViewController, UITabBarDelegate {
 
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViewControllers()
    self.navigationController?.setNavigationBarHidden(true, animated: false)
    self.view.layoutIfNeeded()
  }
  
  override var prefersStatusBarHidden: Bool { return true }
  
  override func viewWillAppear(_ animated: Bool) {}
  
  private func setupViewControllers() {
    
    let transactionsVC = UIStoryboard(name: "Transactions", bundle: nil).instantiateViewController(withIdentifier: "TransactionsViewController") as! TransactionsViewController
    let transactionsBarItem = UITabBarItem(title: "Account", image: UIImage(named: "flash"), selectedImage: UIImage(named: "flash"))
    transactionsVC.tabBarItem = transactionsBarItem
    
    let buyVC = UIStoryboard(name: "Buy", bundle: nil).instantiateViewController(withIdentifier: "BuyLTCViewController") as! BuyLTCViewController
    
    let buyBarItem = UITabBarItem(title: "Buy", image: UIImage(named: "litecoin-logo_cutout_small"), selectedImage: UIImage(named: "litecoin-logo_cutout_small"))
    buyVC.tabBarItem = buyBarItem
    
    let cardVC = UIStoryboard(name: "Card", bundle: nil).instantiateViewController(withIdentifier: "CardViewController") as! CardViewController
    
    let cardBarItem = UITabBarItem(title: "Spend", image: UIImage(named: "card_icon"), selectedImage: UIImage(named: "card_icon"))
    cardVC.tabBarItem = cardBarItem
    
    let sendVC = UIStoryboard(name: "Send", bundle: nil).instantiateViewController(withIdentifier: "SendLTCViewController") as! SendLTCViewController
    
    let sendBarItem = UITabBarItem(title: "Spend", image: UIImage(named: "sendIcon"), selectedImage: UIImage(named: "sendIcon"))
    sendVC.tabBarItem = sendBarItem
    
    let receiveVC = UIStoryboard(name: "Receive", bundle: nil).instantiateViewController(withIdentifier: "ReceiveLTCViewController") as! ReceiveLTCViewController
    
    let receiveBarItem = UITabBarItem(title: "Receive", image: UIImage(named: "receiveIcon"), selectedImage: UIImage(named: "receiveIcon"))
    receiveVC.tabBarItem = receiveBarItem
    
    let tabBarViewControllers = [transactionsVC, buyVC, cardVC, sendVC, receiveVC]
//    
//    self.tabBar.unselectedItemTintColor = .litecoinSilver
//    self.tabBar.tintColor = .litecoinBlue
//    
//    self.viewControllers  = tabBarViewControllers.map {UINavigationController.init(rootViewController: $0)}
  }

}
