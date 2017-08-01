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
    var gameMode:String? = nil
    
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
        roomListView.backgroundColor = UIColor.white
        
        let closeRoomListButton = UIButton(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        closeRoomListButton.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        closeRoomListButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        roomListView.addSubview(closeRoomListButton)
        
        roomTable = UITableView(frame:CGRect(x: 0, y: 40, width: roomListView.bounds.width, height: roomListView.bounds.height-40))
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
            cell.textLabel?.text = String(roomVOList[indexPath.row].roomId)
            cell.textLabel?.textAlignment = NSTextAlignment.left
            
            let roomName = UILabel()
            roomName.text = roomVOList[indexPath.row].roomName
            roomName.textAlignment = NSTextAlignment.center
            cell.contentView.addSubview(roomName)
            
            roomName.snp.makeConstraints{(make) -> Void in
                make.centerY.equalTo((cell.textLabel?.snp.centerY)!)
                make.centerX.equalTo(cell.snp.centerX).offset(-30)
                make.width.equalTo(170)
                make.height.equalTo(20)
            }
            
            let maxNum = 5
            let currentNum = 0
            let roomPeopleNum = UILabel()
            roomPeopleNum.text = "\(currentNum)/\(maxNum)"
            cell.contentView.addSubview(roomPeopleNum)
            
            roomPeopleNum.snp.makeConstraints{(make) -> Void in
                make.centerY.equalTo((cell.textLabel?.snp.centerY)!)
                make.trailing.equalTo(-30)
                make.width.equalTo(29)
                make.height.equalTo(20)
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
}
