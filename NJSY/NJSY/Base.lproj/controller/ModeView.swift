//
//  ModeView.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/10/16.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class ModeView:UIView{
    var modeButton:UIButton!
    var modeNameLabel:UILabel!
    var image:UIImage!
    var i:Int!
    
    func load(modeButton:UIButton,modeNameLabel:UILabel,image:UIImage){
        self.modeButton = modeButton
        self.modeNameLabel = modeNameLabel
        self.image = image
    }
}
