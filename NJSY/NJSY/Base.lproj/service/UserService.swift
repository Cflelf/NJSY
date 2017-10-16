//
//  UserService.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/7/21.
//  Copyright © 2017年 apple. All rights reserved.
//

protocol UserService {
    func register(account:String,password:String) ->String
    
    func login(account:String,password:String) -> ResultMessage
    
    func getUserByAccount(account:String) -> UserVO?
}
