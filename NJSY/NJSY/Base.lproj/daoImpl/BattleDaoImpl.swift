//
//  BattleDaoImpl.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/7/21.
//  Copyright © 2017年 apple. All rights reserved.
//

import LeanCloud

class BattleDaoImpl:BattleDao{
    func startBattle(roomId: Int) -> BattlePO? {
        let battle = LCObject(className:"Battle")
        
        battle.set("roomId", value: roomId)
        battle.set("round",value: 0)
        
        let result = battle.save()
        
        switch result {
        case .success:
            return BattlePO(roomId: roomId, characterList: [String:String]())
        default:
            return nil
        }
    }
    
    func upDateBattleInfo(battlePO: BattlePO) -> String {
        return ""
    }
}
