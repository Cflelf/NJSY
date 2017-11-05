//
//  PersonView.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/10/14.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class PersonView:UIView{
    var userVO:UserVO?
    var font = "PingFangTC-Thin"
    var nameLabel:UILabel!
    var imageView:UIImageView!
    func loadPersonView(i:Int){
        layer.borderWidth = 0.5
        let id = UILabel()
        id.text = "\(i)"
        id.font = UIFont(name: font, size: 12)
        self.addSubview(id)
        id.snp.makeConstraints({ (make) in
            make.leading.equalTo(4)
            make.top.equalTo(4)
        })
    
        self.nameLabel = UILabel()
        nameLabel.text = "无"
        nameLabel.font = UIFont(name: font, size: 12)
        nameLabel.textAlignment = .center
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(id.snp.centerY)
        })
    
        self.imageView = UIImageView()
        self.addSubview(imageView)
        imageView.snp.makeConstraints({ (make) in
            make.top.equalTo(id.snp.bottom)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(self.snp.width).offset(-8)
            make.bottom.equalTo(0)
        })
    }
}
