//
//  TabBarController.swift
//  TestMovie
//
//  Created by Pungki Busneri on 29/01/24.
//

import Foundation
import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabs()
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 3)
        topBorder.backgroundColor = UIColor.lightGray.cgColor
        tabBar.layer.addSublayer(topBorder)
        
        tabBar.layer.cornerRadius = 5.5
        tabBar.layer.masksToBounds = true
        tabBar.layer.opacity = 1.0
        
       
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.backgroundColor = UIColor.white
        tabBar.isTranslucent = true

        tabBar.barTintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        tabBar.tintColor = UIColor.systemPink
        
    }
   
    
    private func setupTabs() {
        let home = self.tabBarNav(with: "Home", and: UIImage(systemName: "play.house"), vc: MainViewController())
        let genre = self.tabBarNav(with: "Genre", and: UIImage(systemName: "movieclapper"), vc: GenreViewController())
        let upcoming = self.tabBarNav(with: "UpComing", and: UIImage(systemName: "timelapse"), vc: UpComingViewController())
        let nowPlaying = self.tabBarNav(with: "Now Playing", and: UIImage(systemName: "tv"), vc: HomeViewController())
        
        self.setViewControllers([home, genre, nowPlaying, upcoming], animated: true)
        
    }
    
    private func tabBarNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        
        return nav
    }
}
