//
//  LoginViewController.swift
//  azukari
//
//  Created by 境有梨 on 2019/10/16.
//  Copyright © 2019 yuri sakai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth





class LoginViewController: UIViewController {

    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    var handle:  AuthStateDidChangeListenerHandle?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    //[START auth_listener]
    handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            guard let displayName = user?.displayName else { return }
    
            print(displayName)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toHome") {
//            guard let ctrl = (segue.destination as? HomeViewController)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (EmailTextField.isFirstResponder) {
            EmailTextField.resignFirstResponder()
        }
        if (PasswordTextField.isFirstResponder) {
            PasswordTextField.resignFirstResponder()
        }
    }
    //UIテキストフィールド以外の部分をタッチしてキーボードを下げる処理

    
    @IBAction func Login(_ sender: Any) {
        
        if (!validation()) {return}
        
        guard let email = EmailTextField.text else { return }
        guard let password = PasswordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
             
            if error != nil {
                print(error!.localizedDescription)
                return
            }
                         
            print("ログイン完了")
            print(user?.user.email)
            
            self?.performSegue(withIdentifier: "toHome", sender: nil)

        }
    
    }
    
    private func validation() -> Bool {
        
        var success = true
        
    //メールアドレスが入力されているか
    
        emailErrorLabel.text = ""
        if(EmailTextField.text!.isEmpty) {
            success = false;
            emailErrorLabel.text = "メールアドレスが入力されていません"
            print("メールアドレスが入力されていません")
        }
        
        
        //パスワードが入力されているか
        passwordErrorLabel.text = ""
        if(PasswordTextField.text!.isEmpty) {
            success = false;
            passwordErrorLabel.text = "パスワードが入力されていません"
            print("パスワードが入力されていません")
        }
        
        return success
    }
    
    
    
}
