//
//  RoomDao.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/7/21.
//  Copyright © 2017年 apple. All rights reserved.
//

protocol RoomDao{
    func updateRoom(roomPO:RoomPO,account:String) -> String
    
    func getRoomById(roomId:Int) -> RoomPO?
    
    func getRoomByType(roomType:String) -> [RoomPO]?

}
