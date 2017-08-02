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
    private var characterList:[String:Int]!
    private var round:Int!
    
    init(roomId:Int,characterList:[String:Int],round:Int) {
        self.roomId = roomId
        self.characterList = characterList
        self.round = round
    }
    
    func getRoomId() -> Int{return self.roomId}
    func getCharacterList() -> [String:Int]{return self.characterList}
    func getRound()->Int{return self.round}
    func setRound(round:Int){self.round = round}
    func setCharacterList(characterList:[String:Int]){self.characterList = characterList}
}
