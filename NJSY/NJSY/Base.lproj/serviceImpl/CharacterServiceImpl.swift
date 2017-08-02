//
//  CharacterServiceImpl.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/8/1.
//  Copyright © 2017年 apple. All rights reserved.
//

class CharacterServiceImpl:CharacterService{
    private var characterDao:CharacterDao!
    
    init() {
        self.characterDao = CharacterDaoImpl()
    }
    func getAllCharacters()->Array<CharacterVO>{
        let characterPOArray = characterDao.getAllCharacters()
        
        var characterVOArray = Array<CharacterVO>()
        
        for character in characterPOArray{
            characterVOArray.append(CharacterVO(characterPO: character))
        }
        return characterVOArray
    }
}
