//
//  chatViewCell.swift
//  Proyecto
//
//  Created by Apps2M on 8/2/23.
//

import UIKit

class chatViewCell: UITableViewCell {

    @IBOutlet weak var celda: UIView!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var mensage: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
