//
//  BattleServiceImpl.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/8/3.
//  Copyright © 2017年 apple. All rights reserved.
//

class BattleServiceImpl:BattleService{
    private var battleDao:BattleDao!
    
    init() {
        self.battleDao = BattleDaoImpl()
    }
    func chooseCharacter(roomId:Int,userId:String,characterId:Int){
        if let battle = battleDao.getBattleByRoomId(roomId: roomId){
            var characterList = battle.getCharacterList()
            characterList[userId] = characterId
            battle.setCharacterList(characterList: characterList)
            print(battleDao.updateBattleInfo(battlePO: battle))
        }
    }
}
