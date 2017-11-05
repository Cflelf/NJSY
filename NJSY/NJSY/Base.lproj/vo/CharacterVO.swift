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
    var image:String!
    
    init(name:String,id:Int,blood:Int,image:String) {
        self.name = name
        self.id = id
        self.blood = blood
        self.image = image
    }
}
