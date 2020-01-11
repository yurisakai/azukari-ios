//
//  SignUpViewController.swift
//  azukari
//
//  Created by 境有梨 on 2019/10/26.
//  Copyright © 2019 yuri sakai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var usernameErrorLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    @IBOutlet weak var passwordconfirmTextField: UITextField!
    @IBOutlet weak var passwordconfirmErrorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       if (usernameTextField.isFirstResponder) {
           usernameTextField.resignFirstResponder()
       }
        
        if (emailTextField.isFirstResponder) {
            emailTextField.resignFirstResponder()
        }
        if (passwordTextField.isFirstResponder) {
            passwordTextField.resignFirstResponder()
        }
        if (passwordconfirmTextField.isFirstResponder) {
            passwordconfirmTextField.resignFirstResponder()
        }
    }
    
    @IBAction func signup(_ sender: UIButton) {
        
        if (!validation()) {return}
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) {[weak self] user, error in
            
            print(error?.localizedDescription)
            print("新規登録完了")

        }
    }
    
    private func validation() -> Bool {
    
        var success = true
    
        usernameErrorLabel.text = ""
        if(usernameTextField.text!.isEmpty) {
            success = false;
            usernameErrorLabel.text = "ユーザー名が入力されていません"
            print("ユーザー名が入力されていません")
            
        }
        
        emailErrorLabel.text = ""
        if(emailTextField.text!.isEmpty) {
           success = false;
           emailErrorLabel.text = "メールアドレスが入力されていません"
           print("メールアドレスが入力されていません")
        }

        passwordErrorLabel.text = ""
        if(passwordTextField.text!.isEmpty) {
            success = false;
            passwordErrorLabel.text = "パスワードが入力されていません"
            print("パスワードが入力されていません")
        }

        passwordconfirmErrorLabel.text = ""
        if(passwordconfirmTextField.text!.isEmpty) {
            success = false;
            passwordconfirmErrorLabel.text = "パスワードが入力されていません"
            print("パスワードが入力されていません")
        }

        return success
    }
}
