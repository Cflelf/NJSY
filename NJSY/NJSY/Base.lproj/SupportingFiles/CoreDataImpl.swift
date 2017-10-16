//
//  CoreDataImpl.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/10/15.
//  Copyright © 2017年 apple. All rights reserved.
//
import UIKit
import CoreData
class CoreDataImpl{
    static func saveUserInfo(acccout:String,password:String){
        //获取数据上下文对象
        let app = UIApplication.shared.delegate as! AppDelegate
        let userMO = UserMO(context:app.persistentContainer.viewContext)
        userMO.account = acccout
        userMO.password = password
        app.saveContext()
    }
    
    static func getUserInfo() -> UserMO?{
        let app = UIApplication.shared.delegate as! AppDelegate
        var userList:[UserMO] = []
        do{
            userList = try app.persistentContainer.viewContext.fetch(UserMO.fetchRequest())
            if userList.count == 0{
                return nil
            }else{
                return userList[0]
            }
        }catch{
            
        }
        return nil
    }
    
    static func deleteUserInfo(){
        let app = UIApplication.shared.delegate as! AppDelegate
        do{
            let userMO = try app.persistentContainer.viewContext.fetch(UserMO.fetchRequest())
            if userMO.count != 0{
                app.persistentContainer.viewContext.delete(userMO[0] as! NSManagedObject)
                app.saveContext()
            }
        }catch{
            
        }
    }
}
