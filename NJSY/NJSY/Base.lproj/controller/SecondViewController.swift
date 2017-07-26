//
//  SecondViewController.swift
//  NJSY
//
//  Created by Mason Mei on 7/25/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var SignUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInButton.snp.makeConstraints{(make) -> Void in
            make.leading.equalTo(self.view.snp.leading).offset(self.view.bounds.width*0.27)
            make.bottom.equalTo(self.view.snp.bottom).offset(-30)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    
    
}
