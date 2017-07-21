//
//  UserDao.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/7/21.
//  Copyright © 2017年 apple. All rights reserved.
//

protocol UserDao{
    func getUserByAccount(account:String) -> UserPO?
    
    func addUser(userPO:UserPO) -> String
}
