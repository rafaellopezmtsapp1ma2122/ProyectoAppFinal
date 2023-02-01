//
//  DemoTableViewCell.swift
//  Proyecto
//
//  Created by Apps2M on 1/2/23.
//

import UIKit

class DemoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var objImage: UIImageView!
    
    @IBOutlet weak var objName: UILabel!
    
    @IBOutlet weak var objTags: UILabel!
    
    @IBOutlet weak var objPrice: UILabel!
    
    @IBOutlet weak var objBoton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
