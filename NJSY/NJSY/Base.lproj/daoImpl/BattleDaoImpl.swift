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
    
    func updateBattleInfo(battlePO: BattlePO) -> String {
        if let battle = getBattleLCObject(roomID: battlePO.getRoomId()){
            let object = LCObject(className: "Battle", objectId: "\(battle.objectId!.stringValue!)")
            object.set("Round",value: battlePO.getRound())
            object.set("CharacterList",value: battlePO.getCharacterList())
            let result = object.save()
            switch result {
            case .success:
                return "update battle success"
            case .failure(let error):
                return error.reason!
            }
        }else{
            return "no such battle"
        }
    }
    
    func getBattleByRoomId(roomId:Int) -> BattlePO?{
        if let battle = getBattleLCObject(roomID: roomId){
            if battle.get("CharacterList")?.dictionaryValue?.count != 0{
                var characterDictionary = [String:Int]()
                let characterList = battle.get("CharacterList")!
                for character in (characterList.dictionaryValue!.keys){
                    let lcNumber = (characterList.dictionaryValue![character])?.lcValue
                    characterDictionary[character] = Int((lcNumber as! LCNumber).value)
                }
            return BattlePO(roomId: roomId, characterList: characterDictionary, round: (battle.get("Round")?.intValue)!)
            }else{
                return BattlePO(roomId: roomId, characterList: [String : Int](), round: (battle.get("Round")?.intValue)!)
            }
        }else{
            return nil
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
