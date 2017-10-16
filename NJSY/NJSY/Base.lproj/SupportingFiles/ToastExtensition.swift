//
//  ToastExtensition.swift
//  NJSY
//
//  Created by 潘潇睿 on 2017/10/15.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import EasyToast

extension UIViewController {
    func showToast(message: String) {
        self.view.showToast(message, position: .bottom, popTime: 3, dismissOnTap: true)
    }
}
