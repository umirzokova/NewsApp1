//
//  FavoritesViewController.swift
//  NewsApp1
//
//  Created by Nargiz Umirzokova on 17/08/23.
//

import UIKit

class FavoritesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.title = ""
        self.tabBarItem.image = UIImage(systemName: "star")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
