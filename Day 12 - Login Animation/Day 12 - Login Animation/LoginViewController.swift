//
//  LoginViewController.swift
//  Day 12 - Login Animation
//
//  Created by gaoshilei on 2019/7/31.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init?(hexValue:Int) {
        if hexValue<0 {
            return nil
        }
        let r = CGFloat((hexValue & 0xFF0000) >> 16)/255
        let g = CGFloat((hexValue & 0x00FF00) >> 8)/255
        let b = CGFloat(hexValue & 0x0000FF)/255
        let a = CGFloat(1)
        self.init(red:r,green:g,blue:b,alpha:a)
    }
}

class LoginViewController: UIViewController {
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        loginButton.isEnabled = false
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
            self.loginButton.frame.size.width = 220
            self.loginButton.center.x = self.view.center.x
        }, completion: { (completed) in
            self.loginButton.isEnabled = true
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hexValue: 0x229819)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userNameTF.transform = CGAffineTransform(translationX: -800, y: 0)
        passwordTF.transform = CGAffineTransform(translationX: -800, y: 0)
        UIView.animate(withDuration: 1.3, delay: 0.15, usingSpringWithDamping: 0.85, initialSpringVelocity: 10, options: [], animations: {
            self.userNameTF.transform = CGAffineTransform(translationX: 0, y: 0)
            self.passwordTF.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
    }
    
}
