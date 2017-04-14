//
//  HomeViewController.swift
//  QQSideMenu
//
//  Created by mk on 17/4/11.
//  Copyright © 2017年 makiZz. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {


    var panGesture: UIPanGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let segmentView = UISegmentedControl(items: ["消息","电话"])
        segmentView.selectedSegmentIndex = 0
        segmentView.setWidth(60, forSegmentAt: 0)
        segmentView.setWidth(60, forSegmentAt: 1)
        self.navigationItem.titleView = segmentView
        
    
        
        let leftItem = UIBarButtonItem()
        leftItem.image = #imageLiteral(resourceName: "qq")
        let rightItem = UIBarButtonItem()
        rightItem.image = #imageLiteral(resourceName: "right_menu_nor")
    
        
        navigationItem.leftBarButtonItem = leftItem
        navigationItem.rightBarButtonItem = rightItem
        
        
        panGesture = UIPanGestureRecognizer.init()
        self.view.addGestureRecognizer(panGesture)
    
        
    }
    
    
  
}
