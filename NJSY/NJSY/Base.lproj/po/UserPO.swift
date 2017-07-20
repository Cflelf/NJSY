//
//  User.swift
//  NJSY
//  用户的持久化模型
//  Created by Pxr on 2017/7/17.
//  Copyright © 2017年 apple. All rights reserved.
//

class UserPO{
    private var account:String!//账号
    private var password:String!//密码
    
    init(account:String , password:String) {//初始化
        self.account = account
        self.password = password
    }
    func getAccount()->String{return self.account}
    func getPassword()->String{return self.password}
}
