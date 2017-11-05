//
//  RoomController.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/8/9.
//  Copyright © 2017年 apple. All rights reserved.
//
import UIKit
import SnapKit
import SocketIO
import Alamofire
class RoomController:UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var skillTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var skillLabel: UILabel!
    @IBOutlet weak var bloodLabel: UILabel!
    @IBOutlet weak var helpCollectionView: UICollectionView!
    @IBOutlet weak var carryCollectionView: UICollectionView!
    @IBOutlet weak var strengthCollectionView: UICollectionView!
    @IBOutlet weak var roomInfo: UILabel!
    @IBOutlet weak var splitLineView: UIView!
    @IBOutlet weak var heroView: UIView!
    @IBOutlet weak var heroInfoView: UIView!
    var room:[String:Any]!
    let characterList = CharacterUtil.getAllCharacters()
    var list = [PersonView]()
    var font = "PingFangTC-Thin"
    var rightView: UIView!
    var leftView: UIView!
    var userPosition = -1;
    var playerList:[String]!
    var selectedHero:CharacterVO?
    override func viewDidLoad() {
        super.viewDidLoad()
        roomInfo.text = room["roomName"] as! String
        roomInfo.font = UIFont(name: font, size: 17)
        print(room)
        leftView = UIView()
        leftView.layer.borderWidth = 0.5
        leftView.layer.borderColor = UIColor.black.cgColor
        view.addSubview(leftView)
        leftView.snp.makeConstraints { (make) in
            make.top.equalTo(splitLineView.snp.bottom)
            make.leading.equalTo(30)
            make.width.equalTo(view.snp.width).dividedBy(2).offset(-45)
            make.height.equalTo(40)
        }
        
        rightView = UIView()
        rightView.layer.borderWidth = 0.5
        rightView.layer.borderColor = UIColor.black.cgColor
        view.addSubview(rightView)
        rightView.snp.makeConstraints { (make) in
            make.top.equalTo(splitLineView.snp.bottom)
            make.trailing.equalTo(-30)
            make.width.equalTo(leftView.snp.width)
            make.height.equalTo(leftView.snp.height)
        }
        let width = ((view.bounds.width/2) - 45)/3
        for i in 1...6{
            let personView = PersonView(frame:CGRect(x: (i-1)/2 * Int(width), y: 0, width: Int(width), height: 40))
            personView.loadPersonView(i: i)
            list.append(personView)
            if i%2==1 {
                leftView.addSubview(personView)
            }else{
                rightView.addSubview(personView)
            }
        }
        
        playerList = (room["playerList"] as! String).components(separatedBy: ";")
        for i in 0...playerList.count-2{
            if(playerList[i].components(separatedBy: ":")[1] as String != ""){
                list[i].nameLabel.text = playerList[i].components(separatedBy: ":")[1] as String;
                if(list[i].nameLabel.text == CoreDataImpl.getUserInfo()?.account){
                    userPosition = i;
                }
            }
        }
        
        heroView.layer.borderWidth = 0.5
        heroView.layer.borderColor = UIColor.gray.cgColor

        heroInfoView.layer.borderWidth = 0.5
        heroInfoView.layer.borderColor = UIColor.gray.cgColor
        
        setCollectionView(collectionView: strengthCollectionView)
        setCollectionView(collectionView: carryCollectionView)
        setCollectionView(collectionView: helpCollectionView)
        DispatchQueue.global(qos: .default).async {
            SocketImpl.socket.on("enterRoom") {data, ack in
                print("我收到进入房间消息啦！！！")
                    for i in 0...self.playerList.count-2{
                        if(self.playerList[i].components(separatedBy: ":")[1] as String == ""){
                            self.playerList[i].append("\(data[0])")
                            print(self.playerList)
                            print("\(i)*******************************")
                            self.list[i].nameLabel.text = "\(data[0])"
                            break;
                        }
                    }
            }
            SocketImpl.socket.on("exitRoom") {data, ack in
                print("我收到离开房间消息啦")
                self.list[data[0] as! Int].nameLabel.text = "无"
                self.playerList[data[0] as! Int] = "\(data[0] as! Int + 1):"
                print(self.playerList)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuse", for: indexPath)
        let button = CharacterButton()
        button.frame = CGRect(x: 0, y: 0, width: 0.15*heroView.bounds.height, height: 0.3*heroView.bounds.height)
        button.layer.borderWidth = 1
        button.character = self.characterList[indexPath.row]
        button.setImage(UIImage(named: (button.character?.image)!), for: .normal)
        button.addTarget(nil, action: #selector(showCharacterInfo), for: .touchUpInside)
        cell.contentView.addSubview(button)
        return cell
    }
    
    func setCollectionView(collectionView:UICollectionView){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: "reuse")
        
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: 0.15*heroView.bounds.height, height: 0.3*heroView.bounds.height)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.collectionViewLayout = layout
    }
    
    func showCharacterInfo(_ sender:CharacterButton){
        selectedHero = sender.character
        self.bloodLabel.text = "血量: \((sender.character?.blood)!)"
        self.nameLabel.text = "\((sender.character?.name)!)"
        self.imageView.image = sender.image(for: .normal)
        self.skillLabel.text = "技能: \((sender.character?.id)!)"
    }
    
    @IBAction func back(_ sender: UIButton) {
        let data = ["roomId":room["roomId"]!,"position":userPosition]
        print(data)
        Alamofire.request("http://localhost:3000/room/exitRoom",method:.post,parameters:data,encoding:JSONEncoding.default).responseJSON{
            (response) in
            if let json = response.result.value as? [String:Any]{
                print(json)
                if json["ResultMessage"] as! Int == 4{
                    SocketImpl.socket.emit("exitRoom", ["roomId":self.room["roomId"]!,"account":CoreDataImpl.getUserInfo()?.account!,"position":self.userPosition])
                    self.dismiss(animated: true, completion: nil)
                }else{
                    self.showToast(message: "EXIT ROOM FAILURE")
                }
            }
        }
    }
    @IBAction func randomSelect(_ sender: UIButton) {
    }
    @IBAction func confirmSelect(_ sender: UIButton) {
        self.list[self.userPosition].imageView.image = UIImage(named: (self.selectedHero?.image)!)
    }
    override func didReceiveMemoryWarning() {
        
    }
}
