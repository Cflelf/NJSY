//
//  UserService.swift
//  NJSY
//
//  Created by Pxr on 2017/7/17.
//  Copyright © 2017年 apple. All rights reserved.
//

class UserServiceImpl:UserService{
    
    private var userDao:UserDao!
    
    init() {//初始化时创建用户数据服务
        self.userDao = UserDaoImpl()
    }
    
    func register(account:String,password:String) ->String{
        return userDao.addUser(userPO: UserPO(account:account,password:password))
    }
    
    func login(account:String,password:String) -> ResultMessage{
        let userVO = self.getUserByAccount(account: account)
        if userVO != nil{
            if(userVO!.password == password){
                return ResultMessage.LOGIN_SUCCESS
            }else{
                return ResultMessage.LOGIN_PASSWORD_WRONG
            }
        }else{
            return ResultMessage.LOGIN_NO_SUCH_ACCOUNT
        }
    }
    
    func getUserByAccount(account:String) -> UserVO?{
        let userPO = userDao.getUserByAccount(account: account)
        var userVO:UserVO? = nil
        if(userPO != nil){
            userVO = UserVO(userPO: userPO!)
        }
        return userVO
    }
}
