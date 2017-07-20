//
//  UserVO.swift
//  NJSY
// 用户的模型用于界面与逻辑层之间的交互
//  Created by Pxr on 2017/7/18.
//  Copyright © 2017年 apple. All rights reserved.
//

class UserVO{
    var account:String!
    var password:String!
    var name:String!
    
    init(userPO:UserPO) {
        self.account = userPO.getAccount()
        self.password = userPO.getPassword()
    }
    
}
