//
//  RoomService.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/7/20.
//  Copyright © 2017年 apple. All rights reserved.
//

class RoomServiceImpl:RoomService{
    private var roomDao:RoomDao!
    init() {
        self.roomDao = RoomDaoImpl()
    }
    public func enterRoom(userAccount:String,roomId:Int){//某个用户进入某个房间👨👩
        let roomPO = roomDao.getRoomById(roomId: roomId)
        var userList = roomPO?.getUserList()
        userList?.append(userAccount)
        roomPO?.setUserList(userList: userList!)
        print("\(userAccount) enter room \(roomId)")
        print(roomDao.updateRoom(roomPO: roomPO!))
    }
}
