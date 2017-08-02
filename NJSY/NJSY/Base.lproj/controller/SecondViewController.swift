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
    

    @IBOutlet weak var secondView: UIImageView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var studentCard: UIImageView!
    @IBOutlet weak var signUpButton: UIButton!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInButton.snp.makeConstraints{(make) -> Void in
            make.leading.equalTo(self.view.snp.leading).offset(self.view.bounds.width*0.27)
            make.bottom.equalTo(self.view.snp.bottom).offset(-30)
        }
        
        signUpButton.snp.makeConstraints{(make) -> Void in
            make.trailing.equalTo(self.view.snp.trailing).offset(self.view.bounds.width * -0.27)
            make.bottom.equalTo(self.view.snp.bottom).offset(-30)
        
        studentCard.snp.makeConstraints{(make) -> Void in
            make.leading.equalTo(self.view.snp.leading).offset(self.view.bounds.width*0.07)
            make.trailing.equalTo(self.view.snp.trailing).offset(self.view.bounds.width * -0.07)
            make.top.equalTo(self.view.bounds.height * -0.8)
            make.bottom.equalTo(self.view.snp.bottom).offset(self.view.bounds.height * -1)
        }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    @IBAction func signInToggleMenu(_ sender: UIButton) {
        if studentCard.transform == .identity {
            UIView.animate(withDuration: 0.3, animations: {
                self.signInButton.transform = CGAffineTransform(scaleX: 1.5, y:1.5)
                self.studentCard.transform = CGAffineTransform(translationX: 0, y: self.studentCard.bounds.height)
            }) {(true) in
            }
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.signInButton.transform = .identity
                self.signUpButton.transform = .identity
                self.studentCard.transform = .identity
            }) { (true) in
                
            }
        }
    }
    
    @IBAction func signUpToggleMenu(_ sender: UIButton) {
        if studentCard.transform == .identity {
            UIView.animate(withDuration: 0.3, animations: {
                self.signUpButton.transform = CGAffineTransform(scaleX: 1.5, y:1.5)
                self.studentCard.transform = CGAffineTransform(translationX: 0, y: self.studentCard.bounds.height)
            }) {(true) in
            }
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.signUpButton.transform = .identity
                self.signInButton.transform = .identity
                self.studentCard.transform = .identity
            }) { (true) in
                
            }
        }
    }
 
}
