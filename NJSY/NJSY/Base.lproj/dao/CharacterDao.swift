//
//  CharacterDao.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/8/1.
//  Copyright © 2017年 apple. All rights reserved.
//

protocol CharacterDao {
    func getAllCharacters()->Array<CharacterPO>
}
