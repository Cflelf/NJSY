//
//  CharacterVO.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/8/1.
//  Copyright © 2017年 apple. All rights reserved.
//

class CharacterVO{
    var name:String!
    var id:Int!
    var blood:Int!
    
    init(characterPO:CharacterPO) {
        name = characterPO.getName()
        id = characterPO.getId()
        blood = characterPO.getBlood()
    }
}
