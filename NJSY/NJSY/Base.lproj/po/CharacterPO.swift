//
//  Character.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/7/21.
//  Copyright © 2017年 apple. All rights reserved.
//

class CharacterPO{
    private var name:String!
    private var id:Int!
    private var blood:Int!
    
    init(name:String,id:Int,blood:Int) {
        self.name = name
        self.id = id
        self.blood = blood
    }
    
    func getName()->String{return self.name}
    func getId()->Int{return self.id}
    func getBlood()->Int{return self.blood}
}
