//
//  itemViewController.swift
//  Proyecto
//
//  Created by Apps2M on 7/2/23.
//

import UIKit

class itemViewController: UIViewController {
    var item: Item?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var tectLabel: UITextView!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBAction func share(_ sender: Any) {
    }
    @IBAction func edit(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceLabel.layer.masksToBounds = true
        priceLabel.layer.cornerRadius = 10
        tagLabel.layer.masksToBounds = true
        tagLabel.layer.cornerRadius = 10
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        //imageView.image = UIImage(named: concert!.image)
        
        nameLabel.text = item?.nameObj
        nameLabel.textColor = UIColor.white
        tagLabel.text = item?.tagsObj
        tagLabel.textColor = UIColor.white
        tectLabel.text = item?.text
        priceLabel.text = item?.priceStr
        priceLabel.textColor = UIColor.white
    }


}
