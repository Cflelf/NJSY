//
//  RoomService.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/7/21.
//  Copyright © 2017年 apple. All rights reserved.
//

protocol RoomService {
    func enterRoom(userAccount:String,roomId:Int)
    func getRoomById(roomId:Int) -> RoomVO?
    func UserReady(account:String,roomId:Int)
    func GameStart(roomId:Int) -> String
}
