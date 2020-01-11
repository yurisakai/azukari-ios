//
//  EditMyPageViewController.swift
//  azukari
//
//  Created by 境有梨 on 2019/11/23.
//  Copyright © 2019 yuri sakai. All rights reserved.
//

import UIKit
import Firebase

class EditMyPageViewController: UIViewController {

    @IBOutlet weak var editNameTextField: UITextField!
    
    @IBOutlet weak var editLocationTextField: UITextField!
    
    @IBOutlet weak var editBirthdayTextField: UITextField!
    
    @IBAction func saveBottun(_ sender: UIButton) {
        
        //ドキュメントを更新する.ドキュメント全体を上書きせずにドキュメントの一部のフィールドを更新するには、update() メソッドを使用します。
        let mypageupdata = db.collection("users").document("pQBbDF5xlFACmjMUfO3B")

        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy年MM月dd日"
        if let date = dfmatter.date(from: editBirthdayTextField.text ?? "") {
            mypageupdata.updateData([
                "name": editNameTextField.text ?? "",
                "location": editLocationTextField.text ?? "",
                "birthday": Timestamp(date: date)
            ]) { err in
              if let err = err {
                  print("Error updating document: \(err)")
              } else {
                print("Document successfully updated")
                self.navigationController?.popViewController(animated: true)
              }
            }
        }
    }
   
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let usersRef = db.collection("users")
              usersRef.document("pQBbDF5xlFACmjMUfO3B").getDocument { [unowned self] (document, error) in
                  
                self.editNameTextField.text = document?.data()?["name"] as? String
              
                self.editLocationTextField.text = document?.data()?["location"] as? String
                  
                  //タイムスタンプを使っているとき
                  guard let birthday = document?.data()?["birthday"] as? Timestamp else { return }
                              
                  let formatter = DateFormatter()
                  formatter.dateStyle = .long
                  formatter.locale = Locale(identifier: "ja_JP")

                  self.editBirthdayTextField.text = formatter.string(from: birthday.dateValue())
              }
        
        //データを追加する
//        db.collection("users").document("pQBbDF5xlFACmjMUfO3B").setData([
//            "name": "あああ",
//            "location": "いいい",
//            "birthday": "19900613"
//        ]) { err in
//            if let err = err {
//                print("Error writing document: \(err)")
//            } else {
//                print("Document successfully written!")
//            }
//        }

        
        
        
        
    }
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
               if (editNameTextField.isFirstResponder) {
                   editNameTextField.resignFirstResponder()
               }
               if (editLocationTextField.isFirstResponder) {
                   editLocationTextField.resignFirstResponder()
               }
               if (editBirthdayTextField.isFirstResponder) {
                              editBirthdayTextField.resignFirstResponder()
                          }
            
            
           
        

        
        
        
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

}
