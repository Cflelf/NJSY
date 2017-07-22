//
//  BattlePO.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/7/21.
//  Copyright © 2017年 apple. All rights reserved.
//

//一局对战的信息
class BattlePO{
    private var roomId:Int!
    private var characterList:[String:String]!
    
    init(roomId:Int,characterList:[String:String]) {
        self.roomId = roomId
        self.characterList = characterList
    }
    
    func getRoomId() -> Int{return self.roomId}
    func getCharacterList() -> [String:String]{return self.characterList}
    func setCharacterList(characterList:[String:String]){self.characterList = characterList}
}
