//
//  DemoTableViewCell.swift
//  Proyecto
//
//  Created by Apps2M on 1/2/23.
//

import UIKit

class DemoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var objImage: UIImageView!
    
    @IBOutlet weak var objName: UILabel!
    
    @IBOutlet weak var objTags: UILabel!
    
    @IBOutlet weak var objPrice: UILabel!
    
 
    @IBAction func more(_ sender: Any) {
      
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        objTags.layer.masksToBounds = true
        objTags.layer.cornerRadius = 10
       
 
        
        
        // Configure the view for the selected state
    }
    
    
}
