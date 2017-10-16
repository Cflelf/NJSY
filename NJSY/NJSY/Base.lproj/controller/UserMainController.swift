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
    @IBOutlet weak var acccountLabel: UILabel!
    @IBOutlet weak var avatarButton: UIButton!
    @IBOutlet weak var navView: UIView!
    @IBOutlet weak var modeButton: UIButton!
    @IBOutlet weak var modeView: ModeView!
    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var rightArrowButton: UIButton!
    @IBOutlet weak var leftArrowButton: UIButton!
    var roomService:RoomService!
    var tableView:UITableView!
    var account:String!
    let font = "PingFangTC-Thin"
    let list = ["个人资料","游戏设置","游戏介绍","退出登录"]
    let iconList = [#imageLiteral(resourceName: "userInfo"),#imageLiteral(resourceName: "setting"),#imageLiteral(resourceName: "intro"),#imageLiteral(resourceName: "exit")]
    let modeImageList = [#imageLiteral(resourceName: "playground-default"),#imageLiteral(resourceName: "tower"),#imageLiteral(resourceName: "wende"),#imageLiteral(resourceName: "pool")]
    let modeNameList = ["热血操场","锁妖塔","文德茶座","天鹅湖"]
    var modeNum = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        navView.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(acccountLabel.snp.bottom).offset(8)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.bottom.equalTo(0)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        navView.layer.borderWidth = 0.5
        navView.layer.borderColor = UIColor.black.cgColor
        
        avatarButton.imageView?.layer.borderWidth = 0.5
        avatarButton.imageView?.layer.borderColor = UIColor.black.cgColor
        avatarButton.imageView?.layer.cornerRadius = 40
        
        acccountLabel.text = account
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.selectionStyle = .none
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        let icon = UIImageView(image: iconList[indexPath.row])
        cell.addSubview(icon)
        icon.snp.makeConstraints { (make) in
            make.centerY.equalTo(cell.contentView.snp.centerY)
            make.leading.equalTo(8)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        let label = UILabel()
        cell.contentView.addSubview(label)
        label.text = list[indexPath.row]
        label.font = UIFont(name: font, size: 17)
        label.snp.makeConstraints { (make) in
            make.centerY.equalTo(cell.contentView.snp.centerY)
            make.leading.equalTo(icon.snp.trailing).offset(8)
        }
        return cell
    }
    @IBAction func formerMode(_ sender: UIButton) {
        if modeNum>0{
            modeNum = modeNum - 1
        }
        modeButton.setImage(modeImageList[modeNum], for: .normal)
        modeLabel.text = modeNameList[modeNum]
    }
    @IBAction func nextMode(_ sender: UIButton) {
        if modeNum<modeNameList.count-1{
            modeNum = modeNum + 1
        }
        modeButton.setImage(modeImageList[modeNum], for: .normal)
        modeLabel.text = modeNameList[modeNum]
    }
}
