//
//  UserDao.swift
//  NJSY
//  管理用户的数据方面
//  Created by Pxr on 2017/7/18.
//  Copyright © 2017年 apple. All rights reserved.
//
import LeanCloud
class UserDaoImpl:UserDao{
    //根据账号获得用户
    func getUserByAccount(account:String) -> UserPO?{
        //如果没有对应用户返回nil
        var userPO:UserPO? = nil
        let result = LCCQLClient.execute("select * from GameUser where account = '\(account)'")
            switch(result){
            case .success(let user):
                if user.objects.count == 0 {
                    return userPO
                }
                let password:String = user.objects.first!.get("password")!.stringValue!
                userPO = UserPO(account: account,password: password)
                return userPO
            case .failure(let error):
                print(error)
                return userPO
            }
    }
    //添加用户
    func addUser(userPO:UserPO) -> String{
        //下面这段代码是调用leanCloud，向GameUser的表中插入一行元祖
        let user = LCObject(className: "GameUser")
        user.set("account",value:userPO.getAccount())
        user.set("password",value:userPO.getPassword())
        //这是保存这段元祖得到的结果
        let result = user.save()
        
        switch(result){
        case .success:
            return "Success"
        case .failure(let error):
            return error.reason!
        }
    }
}
