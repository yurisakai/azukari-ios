//
//  HomeViewController.swift
//  azukari
//
//  Created by 境有梨 on 2019/10/26.
//  Copyright © 2019 yuri sakai. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "facilitiesCell", for: indexPath) as? TableViewCell
        
        cell?.childcarefacilityLabel?.text = self.childcareFacility[indexPath.row]
        cell?.CCFaddressLabel.text = self.CCFaddress[indexPath.row]
        cell?.CCFImageView.image = UIImage(named: self.CCFImageView[indexPath.row])
        
        
        //cell?.imageView?.image = UIImage(named: "チャイルドハウス")
        
        return cell!
    }
   
    
    @IBOutlet weak var TableView: UITableView!
    
    let childcareFacility = ["チャイルドハウス", "おかえりランド"]
    let CCFaddress = ["宗像市田熊2丁目1-1","福岡県福岡市中央区大名1丁目5-3エスパース大名ビル1F・3F"]
    let CCFImageView = ["チャイルドハウス", "おかえりランド"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childcareFacility.count
        
    }
        
//        func tableview(_ tableview: UITableView, nunberOfInSection section: Int) -> Int {
//            return childcareFacility.count
//        }
//
      
       
       
       
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toDetails", sender: nil)
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return view.frame.size.height/6
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





