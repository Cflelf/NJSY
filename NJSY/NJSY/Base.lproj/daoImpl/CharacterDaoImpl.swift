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
            array.append(CharacterPO(name: (data?[key] as! Dictionary<String, Any>)["name"] as! String, id: (data?[key] as! Dictionary<String, Any>)["id"] as! Int, blood: (data?[key] as! Dictionary<String, Any>)["blood"] as! Int))
        }
        print(array.count)
        return array
    }
    
    func getCharacterById(id:Int)->CharacterPO?{
        let data = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "Character", ofType: "plist")!)
        for key in (data?.allKeys)!{
            if key as! Int == id{
                return CharacterPO(name: (data?[key] as! Dictionary<String, Any>)["name"] as! String, id: (data?[key] as! Dictionary<String, Any>)["id"] as! Int, blood: (data?[key] as! Dictionary<String, Any>)["blood"] as! Int)
            }
        }
        return nil
    }
}
