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
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var studentCardView:UIView!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    var studentCard:UIImageView!
    
    private var userService:UserService!
    override func viewDidLoad() {
        super.viewDidLoad()
        userService = UserServiceImpl()
        studentCardView = UIView()
        self.view.addSubview(studentCardView)
        studentCardView.snp.makeConstraints{(make) -> Void in
//            make.leading.equalTo(self.view.snp.leading).offset(self.view.bounds.width*0.07)
//            make.trailing.equalTo(self.view.snp.trailing).offset(self.view.bounds.width * -0.07)
//            make.bottom.equalTo(self.view.bounds.height * -0.92)
            make.bottom.equalTo(self.view.snp.bottom).offset(self.view.bounds.height * -1)
            make.centerX.equalTo(self.view.snp.centerX)
            make.width.equalTo(self.view.bounds.width*0.86)
            make.height.equalTo(self.view.bounds.height*0.8)
        }

        signInButton.snp.makeConstraints{(make) -> Void in
            make.leading.equalTo(self.view.snp.leading).offset(self.view.bounds.width*0.27)
            make.bottom.equalTo(self.view.snp.bottom).offset(-30)
        }
        
        signUpButton.snp.makeConstraints{(make) -> Void in
            make.trailing.equalTo(self.view.snp.trailing).offset(self.view.bounds.width * -0.27)
            make.bottom.equalTo(self.view.snp.bottom).offset(-30)
        }
        studentCard = UIImageView()
        studentCard.image = #imageLiteral(resourceName: "login card")
        studentCardView.addSubview(studentCard)
        studentCard.snp.makeConstraints{(make) -> Void in
            make.leading.equalTo(studentCardView.snp.leading)
            make.trailing.equalTo(studentCardView.snp.trailing)
            make.top.equalTo(studentCardView.snp.top)
            make.bottom.equalTo(studentCardView.snp.bottom)
        }
        
        studentCardView.addSubview(accountTextField)
        accountTextField.snp.makeConstraints{(make) -> Void in
            make.centerX.equalTo(studentCardView.snp.centerX)
            make.width.equalTo(self.view.bounds.width*0.25*0.86)
            make.height.equalTo(self.view.bounds.height*0.16*0.8)
            make.top.equalTo(studentCardView.snp.top).offset(30)
        }
        
        studentCardView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints{(make) -> Void in
            make.centerX.equalTo(studentCard.snp.centerX)
            make.width.equalTo(self.view.bounds.width*0.25*0.86)
            make.height.equalTo(self.view.bounds.height*0.8*0.16)
            make.top.equalTo(accountTextField.snp.bottom).offset(30)
        }
        loginButton.snp.makeConstraints{(make) -> Void in
            make.centerY.equalTo(signUpButton.snp.centerY)
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.leading.equalTo(signUpButton.snp.trailing).offset(30)
        }
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        registerButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    }
    
    func login(){
        print(userService.login(account: accountTextField.text!, password: passwordTextField.text!))
        let destinationStoryboard = UIStoryboard(name:"UserMain", bundle: nil)
        let destinationViewController = destinationStoryboard.instantiateViewController(withIdentifier: "UserMain")
        self.present(destinationViewController, animated: true, completion: nil)
    }
    
    func signUp(){
        print(userService.register(account: accountTextField.text!, password: passwordTextField.text!))
        let destinationStoryboard = UIStoryboard(name:"UserMain", bundle: nil)
        let destinationViewController = destinationStoryboard.instantiateViewController(withIdentifier: "UserMain")
        self.present(destinationViewController, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    @IBAction func signInToggleMenu(_ sender: UIButton) {
        if studentCardView.transform == .identity {
            UIView.animate(withDuration: 0.3, animations: {
                self.signInButton.transform = CGAffineTransform(scaleX: 1.5, y:1.5)
                self.studentCardView.transform = CGAffineTransform(translationX: 0, y: self.studentCardView.bounds.height)
            }) {(true) in
            }
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.signInButton.transform = .identity
                self.signUpButton.transform = .identity
                self.studentCardView.transform = .identity
            }) { (true) in
                
            }
        }
    }
    
    @IBAction func signUpToggleMenu(_ sender: UIButton) {
        if studentCardView.transform == .identity {
            UIView.animate(withDuration: 0.3, animations: {
                self.signUpButton.transform = CGAffineTransform(scaleX: 1.5, y:1.5)
                self.studentCardView.transform = CGAffineTransform(translationX: 0, y: self.studentCardView.bounds.height)
            }) {(true) in
            }
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.signUpButton.transform = .identity
                self.signInButton.transform = .identity
                self.studentCardView.transform = .identity
            }) { (true) in
                
            }
        }
    }
 
}
