//
//  MyPageViewController.swift
//  
//
//  Created by 境有梨 on 2019/11/23.
//

import UIKit
import Firebase
import Kingfisher

class MyPageViewController: UIViewController {
    
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var birthdayLabel: UILabel!
   
    @IBAction func editButton(_ sender: UIButton) {
        
        
    }
    
    
    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        

    
        //FirebaseのDatebase上に反映させるコード
//        usersRef.document("test2").setData([
//            "name": "test2"
//        ])
        

       // Do any additional setup after loading the view.
//        let db = Firestore.firestore()
//        db.collection("users").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//               for document in querySnapshot!.documents {
//                   print("\(document.documentID) => \(document.data())")
//                    let data = document.data()

//                }
//           }
//       }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("読み込み")
        let usersRef = db.collection("users")
        usersRef.document("pQBbDF5xlFACmjMUfO3B").getDocument { [unowned self] (document, error) in
            
            self.nameLabel.text = document?.data()?["name"] as? String
        
            self.locationLabel.text = document?.data()?["location"] as? String
            
            //タイムスタンプを使っているとき
            guard let birthday = document?.data()?["birthday"] as? Timestamp else { return }
                        
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.locale = Locale(identifier: "ja_JP")

            self.birthdayLabel.text = formatter.string(from: birthday.dateValue())
            
            //データベース上の画像を持ってくる
            if let imagePath = document?.data()?["avatar"] as? String {
                let url = URL(string: imagePath)
                self.myImageView.kf.setImage(with: url)
            }
        }
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

