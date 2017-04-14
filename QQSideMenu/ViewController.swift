//
//  ViewController.swift
//  QQSideMenu
//
//  Created by mk on 17/4/11.
//  Copyright © 2017年 makiZz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate{

    
    var mainTabBarContoller: MainTabBarController!
    var tapGesture: UITapGestureRecognizer!
    
    var homeNavi: UINavigationController!
    var homeViewController: HomeViewController!
    var leftViewController: LeftViewController!
    
    var mainView: UIView!
    
    var distance: CGFloat = 0
    let FullDistance: CGFloat = 0.85
    let Proportion: CGFloat = 0.84
    var LeftViewBeginningX: CGFloat!
    var tempView : UIView!  // 用来固定 popover 弹窗的位置
    
    var blackCover: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // 初始化左侧视图
        leftViewController = LeftViewController()
        leftViewController.view.frame.origin.x = -leftViewController.view.frame.size.width * 0.7
        LeftViewBeginningX = leftViewController.view.frame.origin.x + 0.5
        view.addSubview(leftViewController.view)
        
        
        // 创建中间视图容器 方便一起移动
        mainView = UIView(frame: view.frame)
        mainTabBarContoller = MainTabBarController()
        let tabBarView = mainTabBarContoller.view
        mainView.addSubview(tabBarView!)
        
        
        homeNavi = mainTabBarContoller.childViewControllers.first as! UINavigationController
        homeViewController = homeNavi.viewControllers.first as! HomeViewController
        
        
        tabBarView?.addSubview(homeViewController.navigationController!.view)
        tabBarView?.addSubview(homeViewController.view)
        tabBarView?.bringSubview(toFront: mainTabBarContoller.tabBar)
        view.addSubview(mainView)
        
        
        // 遮罩层
        blackCover = UIView(frame: view.frame)
        blackCover.backgroundColor = .black
        blackCover.alpha = 0
        mainView.addSubview(blackCover)
        
        // 绑定action
        homeViewController.navigationItem.leftBarButtonItem?.action = #selector(ViewController.showLeft)
        homeViewController.navigationItem.rightBarButtonItem?.action = #selector(showRight)
     

        // 绑定手势
        let panGesture = homeViewController.panGesture
        panGesture?.addTarget(self, action: #selector(ViewController.pan(recongnizer:)))
        mainView.addGestureRecognizer(panGesture!)
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(showHome))
        
        
        // 增加此透明视图 作为 popoverview 参照视图
        tempView = UIView(frame: CGRect(x: Common.screenWidth - 36, y: 64, width: 1, height: 1))
        mainView.addSubview(tempView)
    }
    
  
    

    
    func pan(recongnizer: UIPanGestureRecognizer) {
        
        
        let x = recongnizer.translation(in: self.view).x
 
        let trueDistance = distance + x
       
        // 判断滑动大小是否超过1/3
        if recongnizer.state == UIGestureRecognizerState.ended {
            
            if trueDistance > Common.screenWidth * (Proportion / 3){
                showLeft()
            }else if trueDistance < Common.screenWidth * -(Proportion / 3) {
                
            }else{
                showHome()
            }
            return
            
        }
        
        var proportion: CGFloat = recongnizer.view!.frame.origin.x >= 0 ? -1 : 1
        proportion *= trueDistance / Common.screenWidth
        proportion *= 1 - Proportion
        proportion /= FullDistance + Proportion/2 - 0.5
        proportion += 1
    
        if proportion <= Proportion {
            return
        }
        
        
        // 禁止 滑动右侧
        if (self.view.center.x + trueDistance) < Common.screenWidth / 2  {
            return
        }
        recongnizer.view?.center = CGPoint(x: view.center.x + trueDistance, y: view.center.y)
        
        blackCover.alpha = -trueDistance / LeftViewBeginningX * 0.7 - 0.4
        leftViewController.view.frame.origin.x = LeftViewBeginningX + trueDistance * 0.7
        
        
       
        
        
        
    }
    
    func showHome() {
        // 从首页 删除 点击自动关闭侧滑菜单功能
        mainView.removeGestureRecognizer(tapGesture)
        // 计算距离，执行菜单自动滑动动画
        distance = 0
        doTheAnimate(showWhat: "home")
    }
    
    
    func showLeft() {
        mainView.addGestureRecognizer(tapGesture)
        distance = -self.LeftViewBeginningX / 0.7
    
        doTheAnimate(showWhat: "left")
        
        
        
    }
    
    func showRight(){
        
       
        let rightMenuVc = RightMenuViewController()
        rightMenuVc.preferredContentSize = CGSize(width: Common.screenWidth/2 - 20, height: 308)
        
        rightMenuVc.modalPresentationStyle = UIModalPresentationStyle.popover
        let popover = rightMenuVc.popoverPresentationController
        popover?.delegate = self
        popover?.backgroundColor = .white
        popover?.sourceView = tempView
        popover?.sourceRect = tempView.bounds
        popover?.permittedArrowDirections = UIPopoverArrowDirection.up
        self.present(rightMenuVc, animated: true, completion: nil)
        
    }
    
    // MARK: - popver 代理方法
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    func doTheAnimate(showWhat: String) {
        
        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
            // 移动首页中心
                self.mainView.center = CGPoint(x: self.view.center.x + self.distance, y: self.view.center.y)
            
                if showWhat == "left"  {
                    self.leftViewController.view.frame.origin.x = 0
                    self.blackCover.alpha = 0.6

                }
                
                if showWhat == "home" {
                    self.leftViewController.view.frame.origin.x = self.LeftViewBeginningX
                    self.blackCover.alpha = 0
                }


            }, completion: nil)
    }
    

    
    
    
    
    
    
}

