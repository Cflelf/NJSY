//
//  PersonView.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/10/14.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class PersonView:UIView{
    var userVO:UserVO!
    
    func loadPersonView(i:Int){
        self.layer.borderWidth = 1
        let id = UIButton()
        id.setTitle("\(i)", for: .normal)
        id.setTitleColor(.black, for: .normal)
        id.titleLabel?.font = UIFont(name: "MStiffHei PRC", size: 12)
        id.layer.borderWidth = 0.5
        self.addSubview(id)
        id.snp.makeConstraints({ (make) in
            make.width.equalTo(self.snp.width)
            make.height.equalTo(15)
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(0)
        })
    
        let nameLabel = UILabel()
        nameLabel.text = "pxr"
        nameLabel.font = UIFont(name: "MStiffHei PRC", size: 14)
        nameLabel.textAlignment = .center
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints({ (make) in
            make.bottom.equalTo(-2)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
        })
    
        let imageView = UIImageView(image: #imageLiteral(resourceName: "notchoose"))
        self.addSubview(imageView)
        imageView.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(self.snp.height).dividedBy(4)
            make.height.equalTo(self.snp.height).dividedBy(2)
        })
    }
}
