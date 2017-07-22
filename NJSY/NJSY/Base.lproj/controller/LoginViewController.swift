//
//  GameViewController.swift
//  NJSY
//
//  Created by Pxr on 2017/7/16.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import SpriteKit

class LoginViewController: UIViewController {
    
    private var userService:UserService!
    
    private var roomService:RoomService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userService = UserServiceImpl()//页面加载时初始化用户业务逻辑
//        print(userService.login(account: "pxr", password: "123456"))
//        
//        
//        self.roomService = RoomServiceImpl()
//        
//        roomService.enterRoom(userAccount: "pxr", roomId: 1)
//        
//        roomService.UserReady(account:"pxr",roomId:1)
//        
//        print(roomService.GameStart(roomId:1))
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
