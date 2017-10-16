//
//  SecondViewController.swift
//  NJSY
//
//  Created by Mason Mei on 7/25/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var studentCardView: UIImageView!
    private var userService:UserService!
    override func viewDidLoad() {
        super.viewDidLoad()
        //初始化用户逻辑
        userService = UserServiceImpl()
        
        //加载标题字体
        titleLabel.font = UIFont(name: "PingFangTC-Thin", size: CGFloat(70/667*self.view.bounds.width))
        
        //设置输入框
        self.setTextField(textField: accountTextField)
        self.setTextField(textField: passwordTextField)
        
        //背景增加点击事件，关闭键盘
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(endEdit))
        tapGesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGesture)
        
        if let user = CoreDataImpl.getUserInfo(){
            self.accountTextField.text = user.account!
            self.passwordTextField.text = user.password!
        }
    }
    
    func endEdit(sender:UITapGestureRecognizer){
        self.view.endEditing(true)
    }

    @IBAction func login(_ sender: UIButton) {
        if(accountTextField.text == "" || passwordTextField.text == ""){
            self.showToast(message: "学号密码不能为空")
        }else{
            switch(userService.login(account: accountTextField.text!, password: passwordTextField.text!)){
            case .LOGIN_SUCCESS:
                self.performSegue(withIdentifier: "enterUserMain", sender: nil)
                CoreDataImpl.saveUserInfo(acccout: accountTextField.text!, password: passwordTextField.text!)
                self.showToast(message: "登录成功")
                break
            case .LOGIN_PASSWORD_WRONG:
                self.showToast(message: "密码错误")
                break
            case .LOGIN_NO_SUCH_ACCOUNT:
                self.showToast(message: "账号不存在")
                break
            default:
                break
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "enterUserMain"){
            let controller = segue.destination as! UserMainController
            controller.account = accountTextField.text!
        }
    }
    
    
    @IBAction func goToRegister(_ sender: UIButton) {
    }
    
    func setTextField(textField:UITextField){
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    @IBAction func beginEditTextField(_ sender: UITextField) {
        animateViewMoving(up: true, moveValue: 100)
    }
    
    @IBAction func endEditTextField(_ sender: UITextField){
        sender.resignFirstResponder()
        animateViewMoving(up: false, moveValue: 100)
    }
    
    @IBAction func endEditAccount(_ sender: UITextField) {
        passwordTextField.becomeFirstResponder()
    }
    
    @IBAction func endEditPassword(_ sender: UITextField) {
        passwordTextField.resignFirstResponder()
    }
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = self.view.frame.offsetBy(dx: 0,  dy: movement)
        UIView.commitAnimations()
    }
 
}
