//
//  RoomVO.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/7/21.
//  Copyright © 2017年 apple. All rights reserved.
//
import HandyJSON

struct Room : HandyJSON {
    var roomId:Int!
    //    var userList:Array<String>!
    //    var userStatus:Array<Bool>!
    var mode:String!
    var roomLimit:Int!
    var master:String! //房主，默认为房间第一个用户
    var roomName:String!
}
