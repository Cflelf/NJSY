//
//  ChooseCharacterController.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/10/14.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class ChooseCharacterController:UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    @IBOutlet weak var characterView: UIView!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var carryButton: UIButton!
    @IBOutlet weak var heavyButton: UIButton!
    var userVO:UserVO!
    var characterList:[CharacterVO]!
    var collectionView:UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterView.layer.borderWidth = 2
        heavyButton.layer.borderWidth = 1
        carryButton.layer.borderWidth = 1
        helpButton.layer.borderWidth = 1
        
        let shieldImage = UIImageView(image: #imageLiteral(resourceName: "shield"))
        heavyButton.addSubview(shieldImage)
        shieldImage.snp.makeConstraints { (make) in
            make.width.equalTo(20)
            make.height.equalTo(20)
            make.left.equalTo(10)
            make.centerY.equalTo(heavyButton.snp.centerY)
        }
        
        let swordImage = UIImageView(image: #imageLiteral(resourceName: "sword"))
        carryButton.addSubview(swordImage)
        swordImage.snp.makeConstraints { (make) in
            make.width.equalTo(20)
            make.height.equalTo(20)
            make.left.equalTo(10)
            make.centerY.equalTo(carryButton.snp.centerY)
        }
        
        let helpImage = UIImageView(image: #imageLiteral(resourceName: "help"))
        helpButton.addSubview(helpImage)
        helpImage.snp.makeConstraints { (make) in
            make.width.equalTo(20)
            make.height.equalTo(20)
            make.left.equalTo(10)
            make.centerY.equalTo(helpButton.snp.centerY)
        }
        
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: 80, height: 80)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 30
        layout.sectionInset = UIEdgeInsets.init(top: 15, left: 30, bottom: 0, right: 30)
        collectionView = UICollectionView(frame: CGRect(x:0,y:0,width:0,height:0), collectionViewLayout: layout)
        self.characterView.addSubview(collectionView)
        collectionView.snp.makeConstraints{(make) in
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(32)
            make.bottom.equalTo(0)
        }
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: "reuse")
        loadCharacter()
    }
    
    override func didReceiveMemoryWarning() {

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuse", for: indexPath)
        let button = CharacterButton()
        button.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        button.layer.borderWidth = 1
        button.character = self.characterList[indexPath.row]
        button.addTarget(nil, action: #selector(showCharacterInfo), for: .touchUpInside)
        button.addTarget(nil, action: #selector(selectCharacter), for: .touchDownRepeat)
        cell.contentView.addSubview(button)
        return cell
    }
    
    func selectCharacter(_ sender:CharacterButton){
        print("选中")
    }
    
    func showCharacterInfo(_ sender:CharacterButton){
        print(sender.character?.name!)
    }
    
    func loadCharacter(){
        let characterService = CharacterServiceImpl()
        self.characterList = characterService.getAllCharacters()
    }
}
