//
//  CharacterDaoImpl.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/11/5.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
class CharacterUtil{
    static func getAllCharacters()->Array<CharacterVO>{
        let data = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "Character", ofType: "plist")!)
        var array = Array<CharacterVO>()
        for key in (data?.allKeys)!{
            array.append(CharacterVO(name: (data?[key] as! Dictionary<String, Any>)["name"] as! String, id: (data?[key] as! Dictionary<String, Any>)["id"] as! Int, blood: (data?[key] as! Dictionary<String, Any>)["blood"] as! Int, image: (data?[key] as! Dictionary<String, Any>)["image"] as! String))
        }
        print(array.count)
        return array
    }
    
    static func getCharacterById(id:Int)->CharacterVO?{
        let data = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "Character", ofType: "plist")!)
        for key in (data?.allKeys)!{
            if key as! Int == id{
                return CharacterVO(name: (data?[key] as! Dictionary<String, Any>)["name"] as! String, id: (data?[key] as! Dictionary<String, Any>)["id"] as! Int, blood: (data?[key] as! Dictionary<String, Any>)["blood"] as! Int, image: (data?[key] as! Dictionary<String, Any>)["image"] as! String)
            }
        }
        return nil
    }
}
