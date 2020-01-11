//
//  TableViewCell.swift
//  azukari
//
//  Created by 境有梨 on 2019/12/02.
//  Copyright © 2019 yuri sakai. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var CCFImageView: UIImageView!
    
    @IBOutlet weak var childcarefacilityLabel: UILabel!
    
    @IBOutlet weak var CCFaddressLabel: UILabel!
    
    
    
   
 
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
