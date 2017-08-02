//
//  BattleDaoImpl.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/7/21.
//  Copyright © 2017年 apple. All rights reserved.
//

import LeanCloud

class BattleDaoImpl:BattleDao{
    func createBattle(roomId: Int) -> BattlePO? {
        let battle = LCObject(className:"Battle")
        
        battle.set("RoomId", value: roomId)
        battle.set("Round",value: 0)
        
        let result = battle.save()
        
        switch result {
        case .success:
            return BattlePO(roomId: roomId, characterList: [String:Int](), round: 0)
        default:
            return nil
        }
    }
    
    func upDateBattleInfo(battlePO: BattlePO) -> String {
        if let battle = getBattleLCObject(roomID: battlePO.getRoomId()){
            let result = LCCQLClient.execute("update Battle set round = \(battlePO.getRound()),CharacterList = \(battlePO.getCharacterList()))where objectId = '\(battle.objectId)'")
            switch result {
            case .success:
                return "update battle success"
            default:
                return "network error"
            }
        }else{
            return "no such battle"
        }
    }
    
    private func getBattleLCObject(roomID:Int)->LCObject?{
        let result = LCCQLClient.execute("Select * from Battle Where RoomId = \(roomID)")
        switch(result){
        case .success(let battle):
            return battle.objects.first
        case .failure(let error):
            print(error)
            return nil
        }
    }
}
