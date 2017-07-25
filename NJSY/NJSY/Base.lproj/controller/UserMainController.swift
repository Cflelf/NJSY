//
//  UserMainController.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/7/25.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import SnapKit

class UserMainController:UIViewController{
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(self.view).offset(33)
            make.leading.equalTo(self.view.snp.leading).offset(self.view.bounds.width*0.38)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func EnterRoom(_ sender: UIButton) {
    }
}
