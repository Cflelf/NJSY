//
//  UserMainController.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/7/25.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import SnapKit

class UserMainController:UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    let modeList = ["1V1","2V2","3V3"]
    
    @IBOutlet weak var NJLogo: UIImageView!
    var gameModeChoose: UIButton!
    var modeTable:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadButton()
        
        modeTable.delegate = self
        modeTable.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indentifier = "cell"
        let cell = UITableViewCell(style: .default, reuseIdentifier: indentifier)
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        cell.textLabel?.text = modeList[indexPath.row]
        cell.textLabel?.textAlignment = NSTextAlignment.center
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gameModeChoose.setTitle(modeList[indexPath.row], for: .normal)
        modeTable.isHidden = true
    }
    
    func GameModeChoose(){
        modeTable.isHidden = false
    }
    
    func loadButton(){
        gameModeChoose = UIButton(frame:CGRect(x: self.view.bounds.width/20, y: 0, width: self.view.bounds.width*0.2, height: self.view.bounds.height/10))
        gameModeChoose.layer.borderWidth = 2
        gameModeChoose.layer.borderColor = UIColor.black.cgColor
        gameModeChoose.setTitleColor(UIColor.black, for: .normal)
        self.view.addSubview(gameModeChoose)
        gameModeChoose.snp.makeConstraints{(make) -> Void in
            make.centerY.equalTo(NJLogo.snp.centerY)
            make.width.equalTo(self.view.bounds.width/6)
            make.height.equalTo(self.view.bounds.height/8)
            make.leading.equalTo(self.view.bounds.width/20)
        }
        gameModeChoose.addTarget(self, action: #selector(GameModeChoose), for: .touchUpInside)
        
        modeTable = UITableView()
        self.view.addSubview(modeTable)
        modeTable.snp.makeConstraints{(make) -> Void in
            make.leading.equalTo(gameModeChoose.snp.leading)
            make.height.equalTo(75)
            make.top.equalTo(gameModeChoose.snp.bottom)
            make.trailing.equalTo(gameModeChoose.snp.trailing)
        }
        modeTable.isHidden = true
    }
}
