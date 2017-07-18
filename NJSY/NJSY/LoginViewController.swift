//
//  GameViewController.swift
//  NJSY
//
//  Created by Pxr on 2017/7/16.
//  Copyright © 2017年 apple. All rights reserved.
//

/*
 范围查询
 等于	whereKey("drink", .EqualTo("Pepsi"))
 不等于	whereKey("hasFood", .NotEqualTo(true))
 大于	whereKey("expirationDate", .GreaterThan(NSDate()))
 大于等于	whereKey("age", .GreaterThanOrEqualTo(18))
 小于	whereKey("pm25", .LessThan(75))
 小于等于	whereKey("count", .LessThanOrEqualTo(10))
 
 // 使用非空值查询获取有图片的 Todo
 query.whereKey("images", .Existed)
 
 // 使用空值查询获取没有图片的 Todo
 query.whereKey("images", .NotExisted)
 */

import UIKit
import SpriteKit

class LoginViewController: UIViewController {
    
    private var userService:UserService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userService = UserService()//页面加载时初始化用户业务逻辑
        print(userService.login(account: "pxr", password: "123456"))
//        userService.getUserByAccount(account: "pxr")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
