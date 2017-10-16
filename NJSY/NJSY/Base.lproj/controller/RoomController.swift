//
//  RoomController.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/8/9.
//  Copyright © 2017年 apple. All rights reserved.
//
import UIKit
import SnapKit
class RoomController:UIViewController{
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var roomInfo: UILabel!
    var list = [PersonView]()
    override func viewDidLoad() {
        super.viewDidLoad()
        roomInfo.text = "来单挑吧"
        roomInfo.font = UIFont(name: "MStiffHei PRC", size: 17)
        for i in 1...6{
            let personView = PersonView(frame: CGRect(x: CGFloat((i-1)/2)*leftView.bounds.width/3, y: 0, width: leftView.bounds.width/3-1, height: leftView.bounds.height))
            personView.loadPersonView(i: i)
            list.append(personView)
            
            if i%2==1{
                leftView.addSubview(personView)
            }else{
                rightView.addSubview(personView)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        
    }
}
