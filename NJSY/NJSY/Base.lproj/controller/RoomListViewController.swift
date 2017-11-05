//
//  RoomListViewController.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/7/31.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import Alamofire
import SocketIO
class RoomListViewController:UIViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var tableView: UIView!
    var gameMode:String!
    var roomVOList:[Room]!
    var roomTable:UITableView!
    var account:String!
    var roomInfo:[String:Any]!
    let font = UIFont(name: "PingFangTC-Thin", size: 17)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roomTable = UITableView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: tableView.bounds.height))
        roomTable.delegate = self
        roomTable.dataSource = self
        roomTable.tableFooterView = UIView()
        tableView.addSubview(roomTable)
        
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomVOList.count+1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellIdentifier")
        cell.selectionStyle = .none
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        let roomIdLabel = UILabel()
        cell.contentView.addSubview(roomIdLabel)
        roomIdLabel.font = font
        roomIdLabel.textAlignment = .center
        roomIdLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(8)
            make.centerY.equalTo(cell.contentView.snp.centerY)
            make.width.equalTo(64)
        }
        
        let roomNameLabel = UILabel()
        cell.contentView.addSubview(roomNameLabel)
        roomNameLabel.font = font
        roomNameLabel.textAlignment = .center
        roomNameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(roomIdLabel.snp.trailing).offset(16)
            make.centerY.equalTo(cell.contentView.snp.centerY)
            make.width.equalTo(100)
        }
        
        let statusLabel = UILabel()
        cell.contentView.addSubview(statusLabel)
        statusLabel.font = font
        statusLabel.textAlignment = .center
        statusLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(-8)
            make.centerY.equalTo(cell.contentView.snp.centerY)
            make.width.equalTo(80)
        }
        
        let peopleNumLabel = UILabel()
        cell.contentView.addSubview(peopleNumLabel)
        peopleNumLabel.font = font
        peopleNumLabel.textAlignment = .center
        peopleNumLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(statusLabel.snp.leading).offset(-16)
            make.centerY.equalTo(cell.contentView.snp.centerY)
            make.width.equalTo(64)
        }
        
        if indexPath.row == 0{
            roomIdLabel.text = "房间号"
            roomNameLabel.text = "房间名"
            peopleNumLabel.text = "人数"
            statusLabel.text = "房间状态"
        }else{
            let roomVO = roomVOList[indexPath.row-1]
            roomIdLabel.text = "\(roomVO.roomId!)"
            roomNameLabel.text = roomVO.roomName
            statusLabel.text = "未开始"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = ["account":account,"roomId":roomVOList[indexPath.row-1].roomId] as [String : Any]
        Alamofire.request("http://localhost:3000/room/enterRoom",method:.post,parameters:data,encoding:JSONEncoding.default).responseJSON{
            (response) in
            if let json = response.result.value as? [String:Any]{
                if json["ResultMessage"] as! Int == 2{
                    self.showToast(message: "房间已满，无法加入")
                }else{
                    self.roomInfo = json["roomInfo"] as! [String : Any]
                    SocketImpl.socket.emit("enterRoom", ["account":self.account,"roomId":"1"])
                    self.performSegue(withIdentifier: "showRoom", sender: nil)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRoom"{
            let controller = segue.destination as! RoomController
            controller.room = self.roomInfo
        }
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
