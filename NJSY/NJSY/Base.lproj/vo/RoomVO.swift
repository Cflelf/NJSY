//
//  RoomVO.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/7/21.
//  Copyright © 2017年 apple. All rights reserved.
//

class RoomVO{
    var roomId:Int!
    var userList:Array<String>!
    var userStatus:Array<Bool>!
    var roomType:String
    var limit:Int
    var master:String! //房主，默认为房间第一个用户
    var roomName:String!
    init(roomPO:RoomPO) {
        self.roomId = roomPO.getId()
        self.userList = roomPO.getUserList()
        self.roomType = roomPO.getRoomType()
        self.limit = roomPO.getLimit()
        self.master = roomPO.getMaster()//这里第一个用户理论上都是存在的,因为用到roomVO的时候房间里都是有人的
        self.userStatus = roomPO.getUserStatus()
        self.roomName = roomPO.getRoomName()
    }
}
