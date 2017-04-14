//
//  RightMenuViewController.swift
//  QQSideMenu
//
//  Created by mk on 17/4/14.
//  Copyright © 2017年 makiZz. All rights reserved.
//

import UIKit

class RightMenuViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let imageArray = ["right_menu_nor-1","right_menu_addFri","right_menu_QR","right_menu_facetoface","right_menu_payMoney","right_menu_sendvideo","img_icon_redpocket_gray"]
    let titleArray = ["创建群聊","加好友/群","扫一扫","面对面快传","付款","拍摄","面对面红包"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.isScrollEnabled = false
        view.addSubview(tableView)
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = titleArray[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.imageView?.image = UIImage(named: imageArray[indexPath.row])
        cell.layoutMargins = .zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
    

}
