//
//  RoomPO.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/7/20.
//  Copyright © 2017年 apple. All rights reserved.
//

/*
 存储房间信息
 */
class RoomPO{
    private var userList:[String]!//房间内的所有玩家编号
    
    private var limit:Int!//房间人数限制
    
    private var id:Int!//房间编号
    
    private var roomType:String!//房间类型
    
    init(limit:Int,id:Int,roomType:String,userList:[String]) {
        self.userList = userList
        self.id = id
        self.limit = limit
        self.roomType = roomType
    }
    
    public func getUserList() -> [String]{return self.userList}
    public func getLimit() -> Int{return self.limit}
    public func getId() -> Int{return self.id}
    public func getRoomType() -> String{return self.roomType}
    
    public func setUserList(userList:[String]){self.userList = userList}
}
