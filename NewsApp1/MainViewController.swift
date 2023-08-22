//
//  ViewController.swift
//  NewsApp1
//
//  Created by Nargiz Umirzokova on 17/08/23.
//

import UIKit

class MainViewController: UITabBarController, UITabBarControllerDelegate{

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
   
    //MARK: - lifeCycle of UITabBarViewController
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Create News tab
        
        let newsTab = NewsViewController()
        let newsTabItem = UITabBarItem(title: "", image: UIImage(named: "newspaper"), selectedImage: UIImage(named: "newspaper.fill"))
        newsTab.tabBarItem = newsTabItem
        
        //Create favorites tab
        
        let favoritesTab = FavoritesViewController()
        let favoritesTabItem = UITabBarItem(title: "", image: UIImage(systemName: "star"), selectedImage: UIImage(named: "star.fill"))
        favoritesTab.tabBarItem = favoritesTabItem
        
        self.viewControllers = [newsTab, favoritesTab]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        //print("Selected \(String(describing: viewController.title))")
    }
    

    
}



