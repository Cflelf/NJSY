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
        var userStatus = roomPO?.getUserStatus()
        userStatus?.append(false)
        
        roomPO?.setUserList(userList: userList!)
        roomPO?.setUserStatus(userStatus: userStatus!)
        print("\(userAccount) enter room \(roomId)")
        print(roomDao.updateRoom(roomPO: roomPO!,account:userAccount))
    }
    
    public func getRoomById(roomId:Int) -> RoomVO?{
        let roomPO = roomDao.getRoomById(roomId: roomId)
        var roomVO:RoomVO? = nil
        if roomPO != nil{
            roomVO = RoomVO(roomPO: roomPO!)
        }
        return roomVO
    }
    
    public func UserReady(account:String,roomId:Int){
        let roomPO = roomDao.getRoomById(roomId: roomId)!
        var userStatus = roomPO.getUserStatus()
        userStatus[roomPO.getUserList().index(of: account)!] = true
        
        roomPO.setUserStatus(userStatus: userStatus)
        
        print("\(account) is ready")
        print(roomDao.updateRoom(roomPO: roomPO, account: account))
    }
    
    public func GameStart(roomId:Int) -> String{//房主按开始按钮时触发
        let roomVO = self.getRoomById(roomId: roomId)
        if roomVO != nil{
            for b in (roomVO?.userStatus)!{
                if !b{//如果有一个玩家没准备
                    return "someone is not ready"
                }
            }
            return "game will start"
        }else{
            return "error"
        }
    }
    
    
}
