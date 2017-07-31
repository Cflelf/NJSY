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
    private var userList:Array<String>!//房间内的所有玩家编号与其是否准备的状态
    
    private var limit:Int!//房间人数限制
    
    private var id:Int!//房间编号
    
    private var roomType:String!//房间类型
    
    private var master:String!
    
    private var userStatus:Array<Bool>!
    
    private var roomName:String!
    
    init(limit:Int,id:Int,roomType:String,userList:Array<String>,master:String,userStatus:Array<Bool>,roomName:String) {
        self.userList = userList
        self.id = id
        self.limit = limit
        self.roomType = roomType
        self.master = master
        self.userStatus = userStatus
        self.roomName = roomName
    }
    
    public func getUserList() -> Array<String>{return self.userList}
    public func getLimit() -> Int{return self.limit}
    public func getId() -> Int{return self.id}
    public func getRoomType() -> String{return self.roomType}
    public func getMaster() -> String{return self.master}
    public func getUserStatus() -> Array<Bool>{return self.userStatus}
    public func getRoomName() -> String{return self.roomName}
    
    public func setUserList(userList:Array<String>){self.userList = userList}
    public func setUserStatus(userStatus:Array<Bool>){self.userStatus = userStatus}
}
