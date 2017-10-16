//
//  RoomListViewController.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/7/31.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
protocol ValueDelegate {
     func valueClicked(string : String)
}

class RoomListViewController:UIViewController,UITableViewDelegate,UITableViewDataSource{
    var roomListView:UIView!
    var roomTable:UITableView!
    var gameMode:String?
    
    private var roomService:RoomService!
    
    var roomVOList:[RoomVO]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.roomService = RoomServiceImpl()
        loadTable()
        roomTable.delegate = self
        roomTable.dataSource = self
        roomVOList = roomService.getRoomByType(roomType: self.gameMode!)
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    func loadTable(){
        roomListView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        self.view.addSubview(roomListView)
//        roomListView.backgroundColor = UIColor.white
        
        let background = UIImageView(image: #imageLiteral(resourceName: "roomList"))
        roomListView.addSubview(background)
        background.snp.makeConstraints{(make) -> Void in
            make.trailing.equalTo(0)
            make.leading.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
        }
        
        let closeRoomListButton = UIButton(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        closeRoomListButton.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        closeRoomListButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        roomListView.addSubview(closeRoomListButton)
        
        let roomIdLabel = UILabel()
        roomIdLabel.font = UIFont(name: "MStiffHei PRC", size: 25)
        roomIdLabel.text = "房间号"
        roomListView.addSubview(roomIdLabel)
        roomIdLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(closeRoomListButton.snp.bottom).offset(20)
            make.leading.equalTo(closeRoomListButton.snp.trailing).offset(20)
        }
        
        let peopleNumLabel = UILabel()
        peopleNumLabel.text = "人数"
        peopleNumLabel.font = UIFont(name: "MStiffHei PRC", size: 25)
        roomListView.addSubview(peopleNumLabel)
        peopleNumLabel.snp.makeConstraints{(make) -> Void in
            make.centerY.equalTo(roomIdLabel.snp.centerY)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        
        let statusLabel = UILabel()
        statusLabel.text = "状态"
        statusLabel.font = UIFont(name: "MStiffHei PRC", size: 25)
        roomListView.addSubview(statusLabel)
        statusLabel.snp.makeConstraints{(make) -> Void in
            make.centerY.equalTo(roomIdLabel.snp.centerY)
            make.trailing.equalTo(-50)
        }
        
        roomTable = UITableView(frame:CGRect(x: 0, y: 80, width: roomListView.bounds.width, height: roomListView.bounds.height-80))
        roomTable.backgroundColor = UIColor.clear
        roomListView.addSubview(roomTable)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomVOList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indentifier = "cell"
        let cell = UITableViewCell(style: .default, reuseIdentifier: indentifier)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        if let roomVOList = roomService.getRoomByType(roomType: self.gameMode!){
            cell.backgroundColor = UIColor.clear
            let roomNum = UILabel()
            roomNum.text = "\(indexPath.row)"
            cell.contentView.addSubview(roomNum)
            roomNum.snp.makeConstraints{(make) -> Void in
                make.leading.equalTo(50)
                make.centerY.equalTo(cell.snp.centerY)
            }
            let roomName = UILabel()
            roomName.text = roomVOList[indexPath.row].roomName
            roomName.textAlignment = NSTextAlignment.center
            cell.contentView.addSubview(roomName)
            
            roomName.snp.makeConstraints{(make) -> Void in
                make.centerY.equalTo(roomNum.snp.centerY)
                make.centerX.equalTo(cell.snp.centerX)
            }
            
            let maxNum = 5
            let currentNum = 0
            let roomPeopleNum = UILabel()
            roomPeopleNum.text = "\(currentNum)/\(maxNum)"
            cell.contentView.addSubview(roomPeopleNum)
            
            roomPeopleNum.snp.makeConstraints{(make) -> Void in
                make.centerY.equalTo(roomNum.snp.centerY)
                make.trailing.equalTo(-50)
            }
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func back(){
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationStoryboard = UIStoryboard(name:"Room", bundle: nil)
        let destinationViewController = destinationStoryboard.instantiateViewController(withIdentifier: "Room")
        self.present(destinationViewController, animated: true, completion: nil)
    }
}
