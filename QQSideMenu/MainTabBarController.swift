//
//  MainTabBarController.swift
//  QQSideMenu
//
//  Created by mk on 17/4/11.
//  Copyright © 2017年 makiZz. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController(HomeViewController(), title: "消息", image: "tab_recent_nor",selectedImage:"tab_recent_press")
        addChildViewController(OtherViewController(), title: "联系人", image: "tab_buddy_nor",selectedImage:"tab_buddy_press")
        addChildViewController(OtherViewController(), title: "动态", image: "tab_qworld_nor",selectedImage:"tab_qworld_press")
    
    }
    
    func addChildViewController(_ childController: UIViewController, title: String, image: String, selectedImage:String) {
        childController.tabBarItem.image = UIImage.init(named: image)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImage)
        childController.title = title
        
        let nav = UINavigationController.init(rootViewController: childController)
        self.addChildViewController(nav)
        
    }
    
}
