//
//  SwiftImage.swift
//  QQSideMenu
//
//  Created by mk on 17/4/13.
//  Copyright © 2017年 makiZz. All rights reserved.
//

import UIKit

extension UIImage {
    
    func circleImage() -> UIImage {
        UIGraphicsBeginImageContext(self.size)
        let ctx = UIGraphicsGetCurrentContext()
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        ctx?.addEllipse(in: rect)
        ctx?.clip()
        draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}

