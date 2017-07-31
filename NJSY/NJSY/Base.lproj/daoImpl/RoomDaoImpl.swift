//
//  RoomDao.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/7/20.
//  Copyright © 2017年 apple. All rights reserved.
//

import LeanCloud

class RoomDaoImpl:RoomDao{
    public func updateRoom(roomPO:RoomPO,account:String) -> String{
        let roomLCObject = getRoomLCObject(roomId: roomPO.getId())
        if roomLCObject != nil{
//            print(roomLCObject!.get("Master")!.stringValue!)
            if roomLCObject!.get("Master")!.stringValue!==""{//判断该房间内是否拥有房主，没有就把该玩家添加为房主
                let result = LCCQLClient.execute("update Room set UserList=\(roomPO.getUserList()), Master='\(account)', UserStatus=\(roomPO.getUserStatus()) where objectId='\(roomLCObject!.objectId!.stringValue!)'")
                switch result {
                case .success:
                    return "update room \(roomPO.getId()) success,\(account) is master"
                case .failure(let error):
                    return error.reason!
                }
            }else{
        let result = LCCQLClient.execute("update Room set UserList=\(roomPO.getUserList()), UserStatus=\(roomPO.getUserStatus()) where objectId='\(roomLCObject!.objectId!.stringValue!)'")
                switch result {
                case .success:
                    return "update room \(roomPO.getId()) success"
                case .failure(let error):
                    return error.reason!
                }
            }
        }else{
            return ("room not exist")
        }
    }
    
    public func getRoomById(roomId:Int) -> RoomPO?{
        let roomLCObject = getRoomLCObject(roomId: roomId)
        if roomLCObject != nil{
            return LCObject2PO(roomLCObject: roomLCObject!)
        }
        else{
            return nil
        }
    }
    
    func getRoomByType(roomType:String) -> [RoomPO]?{
        let result = LCCQLClient.execute("select * from Room where roomType = '\(roomType)'")
        var roomList = [RoomPO]()
        switch(result){
        case .success(let rooms):
            for room in rooms.objects{
                roomList.append(LCObject2PO(roomLCObject: room))
            }
            return roomList
        case .failure(let error):
            print(error)
            return nil
        }
    }
    
    private func LCObject2PO(roomLCObject:LCObject) -> RoomPO{
        let roomID = roomLCObject.get("id")!.intValue!
        let roomType = roomLCObject.get("roomType")!.stringValue!
        let roomName = roomLCObject.get("RoomName")!.stringValue!
        var user = roomLCObject.get("UserList")?.arrayValue
        let master = roomLCObject.get("Master")!.stringValue!
        var userStatus = roomLCObject.get("UserStatus")?.arrayValue
        if user==nil{
            user = Array<String>()
        }
        if userStatus == nil{
            userStatus = Array<Bool>()
        }
        let limit = roomLCObject.get("limit")!.intValue!
        let roomPO = RoomPO(limit: limit, id: roomID, roomType: roomType,userList: user as! Array<String>, master: master , userStatus: userStatus as! Array<Bool>,roomName: roomName)
        return roomPO
    }
    
    private func getRoomLCObject(roomId:Int) -> LCObject?{
        let result = LCCQLClient.execute("select * from Room where id = \(roomId)")
        switch(result){
        case .success(let room):
            return room.objects.first
        case .failure(let error):
            print(error)
            return nil
        }
    }
}
