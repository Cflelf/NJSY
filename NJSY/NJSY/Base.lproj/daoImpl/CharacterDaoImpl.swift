//
//  CharacterDaoImpl.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/8/1.
//  Copyright © 2017年 apple. All rights reserved.
//
import UIKit
class CharacterDaoImpl:CharacterDao{
    func getAllCharacters()->Array<CharacterPO>{
        let data = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "Character", ofType: "plist")!)
        var array = Array<CharacterPO>()
        for key in (data?.allKeys)!{
            array.append(CharacterPO(name: (data?.value(forKey: key as! String) as! Dictionary)["name"]!, id: key as! Int, blood: (data?.value(forKey: key as! String) as! Dictionary)["blodd"]!))
        }
        print(array.count)
        return array
    }
}
