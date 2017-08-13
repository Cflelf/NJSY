//
//  UserMainController.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/7/25.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import SnapKit
import LeanCloud

class UserMainController:UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    let modeList = ["科目:1V1","科目:2V2","科目:3V3"]
    
    @IBOutlet weak var NJLogo: UIImageView!
    var gameModeChoose: UIButton!
    var modeTable:UITableView!
    var gameNameLabel:UILabel!
    var chooseRoomButton:UIButton!
    var getPersonInfoButton:UIButton!
    var ruleButton:UIButton!
    var exitButton:UIButton!
    var nameLabel:UILabel!
    var gameMode:String = "1V1"
    private var roomService:RoomService!
    @IBOutlet weak var accountLabel: UILabel!
    var accountString:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAccountLabel()
        loadButton()
        modeTable.delegate = self
        modeTable.dataSource = self
        self.roomService = RoomServiceImpl()
        
//        let servie = BattleServiceImpl()
//        print(servie.chooseCharacter(roomId: 1, userId: "pxr", characterId: 1))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modeList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indentifier = "cell"
        let cell = UITableViewCell(style: .default, reuseIdentifier: indentifier)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        cell.textLabel?.text = modeList[indexPath.row]
        cell.textLabel?.textAlignment = NSTextAlignment.center
        cell.textLabel?.font = UIFont(name: "MStiffHei PRC", size: 17)
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gameModeChoose.setTitle(modeList[indexPath.row], for: .normal)
        gameModeChoose.titleLabel?.font = UIFont(name: "MStiffHei PRC", size: 20)
        modeTable.isHidden = true
        self.gameMode = (gameModeChoose.titleLabel?.text?.components(separatedBy: ":")[1])!
    }
    
    func GameModeChoose(){
        modeTable.isHidden = false
    }
    //界面初始化时需要加载的按钮
    func loadButton(){
        gameModeChoose = UIButton()
        gameModeChoose.layer.borderWidth = 2
        gameModeChoose.layer.borderColor = UIColor.black.cgColor
        gameModeChoose.setTitleColor(UIColor.black, for: .normal)
        gameModeChoose.setTitle("科目:1V1", for: .normal)
        gameModeChoose.titleLabel?.font = UIFont(name: "MStiffHei PRC", size: 20)
        self.view.addSubview(gameModeChoose)
        gameModeChoose.snp.makeConstraints{(make) -> Void in
            make.centerY.equalTo(NJLogo.snp.centerY)
            make.width.equalTo(self.view.bounds.width/6)
            make.height.equalTo(self.view.bounds.height/8)
            make.leading.equalTo(self.view.bounds.width/20)
        }
        gameModeChoose.addTarget(self, action: #selector(GameModeChoose), for: .touchUpInside)
        
        chooseRoomButton = UIButton()
        self.view.addSubview(chooseRoomButton)
        chooseRoomButton.setTitle("一:进入考试", for: .normal)
        chooseRoomButton.setTitleColor(UIColor.black, for: .normal)
        chooseRoomButton.titleLabel?.font = UIFont(name: "MStiffHei PRC", size: 30)
        chooseRoomButton.addTarget(self, action:#selector(showRoomList), for: .touchUpInside)
        chooseRoomButton.snp.makeConstraints{(make) -> Void in
            make.leading.equalTo(50)
            make.centerY.equalTo(self.view.snp.centerY)
            make.height.equalTo(40)
        }
        chooseRoomButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        getPersonInfoButton = UIButton()
        self.view.addSubview(getPersonInfoButton)
        getPersonInfoButton.setTitle("二:浏览学生信息", for: .normal)
        getPersonInfoButton.setTitleColor(UIColor.black, for: .normal)
        getPersonInfoButton.titleLabel?.font = UIFont(name: "MStiffHei PRC", size: 30)
        getPersonInfoButton.snp.makeConstraints{(make) -> Void in
            make.trailing.equalTo(-50)
            make.centerY.equalTo(self.view.snp.centerY)
            make.height.equalTo(40)
        }
        getPersonInfoButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        ruleButton = UIButton()
        self.view.addSubview(ruleButton)
        ruleButton.setTitle("三:考前须知", for: .normal)
        ruleButton.setTitleColor(UIColor.black, for: .normal)
        ruleButton.titleLabel?.font = UIFont(name: "MStiffHei PRC", size: 30)
//        ruleButton.addTarget(self, action:#selector(showRoomList), for: .touchUpInside)
        ruleButton.snp.makeConstraints{(make) -> Void in
            make.leading.equalTo(50)
            make.top.equalTo(chooseRoomButton.snp.bottom).offset(30)
            make.height.equalTo(40)
        }
        ruleButton.titleLabel?.adjustsFontSizeToFitWidth = true

        exitButton = UIButton()
        self.view.addSubview(exitButton)
        exitButton.setTitle("四:退出考试", for: .normal)
        exitButton.setTitleColor(UIColor.black, for: .normal)
        exitButton.titleLabel?.font = UIFont(name: "MStiffHei PRC", size: 30)
        //        ruleButton.addTarget(self, action:#selector(showRoomList), for: .touchUpInside)
        exitButton.snp.makeConstraints{(make) -> Void in
            make.leading.equalTo(getPersonInfoButton.snp.leading)
            make.top.equalTo(getPersonInfoButton.snp.bottom).offset(30)
            make.height.equalTo(40)
        }
        exitButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        nameLabel = UILabel()
        self.view.addSubview(nameLabel)
        nameLabel.text = "姓名:"
        nameLabel.font = UIFont(name: "MStiffHei PRC", size: 25)
        nameLabel.textColor = UIColor.black
        nameLabel.snp.makeConstraints{(make) -> Void in
            make.leading.equalTo(gameModeChoose.snp.trailing).offset(50)
            make.centerY.equalTo(gameModeChoose.snp.centerY)
            make.height.equalTo(20)
        }
        nameLabel.adjustsFontSizeToFitWidth = true
        
        modeTable = UITableView()
        self.view.addSubview(modeTable)
        modeTable.snp.makeConstraints{(make) -> Void in
            make.leading.equalTo(gameModeChoose.snp.leading)
            make.height.equalTo(75)
            make.top.equalTo(gameModeChoose.snp.bottom)
            make.trailing.equalTo(gameModeChoose.snp.trailing)
        }
        modeTable.isHidden = true
        
        gameNameLabel = UILabel()
        self.view.addSubview(gameNameLabel)
        gameNameLabel.text = "菁园物语"
        gameNameLabel.font = UIFont(name: "MStiffHei PRC", size: 50)
        gameNameLabel.snp.makeConstraints{(make) -> Void in
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(nameLabel.snp.bottom).offset(30)
        }
        gameNameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func showRoomList(){
        let roomController = RoomListViewController()
        roomController.gameMode = self.gameMode
        self.showDetailViewController(roomController, sender: nil)
    }
    
    func setAccountLabel(){
        self.accountLabel.text! = accountString
        self.view.addSubview(accountLabel)
        accountLabel.font = UIFont(name: "MStiffHei PRC", size: 25)
        accountLabel.textColor = UIColor.black
        accountLabel.snp.makeConstraints{(make) -> Void in
            make.height.equalTo(20)
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(32)
        }

        accountLabel.adjustsFontSizeToFitWidth = true

    }
    
}
