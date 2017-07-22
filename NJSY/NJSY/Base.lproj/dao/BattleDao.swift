//
//  BattleDao.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/7/21.
//  Copyright © 2017年 apple. All rights reserved.
//

protocol BattleDao{
    func startBattle(roomId:Int) -> BattlePO?
    
    func upDateBattleInfo(battlePO:BattlePO) ->String
}
