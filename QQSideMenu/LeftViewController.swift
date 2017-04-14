//
//  LeftViewController.swift
//  QQSideMenu
//
//  Created by mk on 17/4/11.
//  Copyright © 2017年 makiZz. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let titlesDictionary = ["了解会员特权","QQ钱包","个性装扮","我的收藏", "我的相册", "我的文件"]
    let imageArray = ["vip_shadow","sidebar_purse","sidebar_decoration","sidebar_favorit","sidebar_album","sidebar_file"]
    var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.frame = CGRect(x: 0, y: 0, width: Common.screenWidth * 0.85 , height: Common.screenHeight)
        
        setHeadView()
        setTableView()
        setFootView()
        
    
    }

    
    
    func setHeadView() {
        
        let headView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: Common.screenHeight/3))
        headView.image = #imageLiteral(resourceName: "sakura")
        view.addSubview(headView)
        
        let qrCodeBtn = UIButton(type: .custom)
        qrCodeBtn.frame = CGRect(x: view.frame.width - 50, y: 30, width: 35, height: 35)
        qrCodeBtn.setImage(UIImage.init(named: "sidebar_QRcode_normal"), for: .normal)
        headView.addSubview(qrCodeBtn)
        
        let headImage = UIImageView(frame: CGRect(x: 20, y: headView.center.y, width: 30, height: 30))
        headImage.image = #imageLiteral(resourceName: "IMG_0108")
        headImage.layer.cornerRadius = 15
        headImage.layer.borderWidth = 2
        headImage.layer.borderColor = UIColor.white.cgColor
        headImage.layer.masksToBounds = true
        headView.addSubview(headImage)
        
        let nickNameLabel = UILabel(frame: CGRect(x: headImage.frame.maxX + 10.0, y: headImage.frame.origin.y, width: 100, height: 30))
        nickNameLabel.textColor = .white
        nickNameLabel.font = UIFont.systemFont(ofSize: 25)
        nickNameLabel.text = "MakiZz"
        headView.addSubview(nickNameLabel)
        
        
        let starArray = ["usersummary_icon_lv_crown","usersummary_icon_lv_sun","usersummary_icon_lv_moon","usersummary_icon_lv_star"]
        for i in 0..<starArray.count {
            let starImage = UIImageView(frame: CGRect(x: 20 + i * 15 ,y:Int(headImage.frame.maxY + 10) ,width: 15,height: 15))
            
            starImage.image = UIImage(named: starArray[i])
            headView.addSubview(starImage)
        }
        
    }
    
    
    
    func setTableView() {
        
        tableView = UITableView(frame: CGRect(x:0,y:view.frame.height/3,width:view.frame.width,height:view.frame.height/3*2-44), style: .plain)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.separatorStyle = .none
        view.addSubview(tableView)
    }
    
    
    func setFootView() {
        
        let footView = UIView(frame: CGRect(x: 0 ,y: view.frame.height - 44, width: view.frame.width, height: 44))
        footView.backgroundColor = .white
        view.addSubview(footView)
        
        
        let settingBtn = UIButton(type: .custom)
        settingBtn.frame = CGRect(x: 20, y: 0, width: 80, height: 30)
        
        settingBtn.setImage(UIImage.init(named: "sidebar_setting"), for: .normal)
        settingBtn.setTitle("设置", for: .normal)
        settingBtn.setTitleColor(.black, for: .normal)
        settingBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        settingBtn.titleEdgeInsets.left += 10
        footView.addSubview(settingBtn)
        
        
        let nightmodeBtn = UIButton(type: .custom)
        nightmodeBtn.frame = CGRect(x: 130, y: 0, width: 80, height: 30)
        
        nightmodeBtn.setImage(UIImage.init(named: "sidebar_nightmode_off"), for: .normal)
        nightmodeBtn.setTitle("夜间", for: .normal)
        nightmodeBtn.setTitleColor(.black, for: .normal)
        nightmodeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        nightmodeBtn.titleEdgeInsets.left += 10
        footView.addSubview(nightmodeBtn)
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesDictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell" ,for: indexPath)
        cell.backgroundColor = .clear
        cell.textLabel?.text = titlesDictionary[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: imageArray[indexPath.row])
        
        return cell
    }
    
   

}
