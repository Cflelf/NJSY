//
//  FromCenterSegue.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/10/14.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class FromCenterSegue:UIStoryboardSegue{
    // 重载perform方法，在这里我们添加想要的自定义逻辑
    override func perform() {
        
        // 得到源控制器和目标控制器的视图
        let sourceView = self.source.view as UIView!
        let destinationView = self.destination.view as UIView!
        
        // 得到屏幕的宽和高
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        // 把destinationView放在sourceView的下面
        destinationView?.frame = CGRect(x: 0, y: screenHeight, width: screenWidth, height: screenHeight)
        
        let window = UIApplication.shared.keyWindow
        // 把目标视图添加到当前视图中
        window?.insertSubview(destinationView!, aboveSubview: sourceView!)
        
        UIView.animate(withDuration: 5, animations: { () -> Void in
            
            sourceView?.frame = (sourceView?.frame.offsetBy(dx: 0.0, dy: -screenHeight))!
            destinationView?.frame = (destinationView?.frame.offsetBy(dx: 0.0, dy: -screenHeight))!
            
        }, completion: { _ in
            // 展示新的视图控制器
            self.destination.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.source.present(self.destination as UIViewController, animated: true, completion: nil)
        })
    }
}
