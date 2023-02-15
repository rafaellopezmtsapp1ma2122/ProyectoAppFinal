//
//  itemViewController.swift
//  Proyecto
//
//  Created by Apps2M on 7/2/23.
//

import UIKit

class itemViewController: UIViewController {
    var item: Item?

    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var tectLabel: UITextView!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBAction func share(_ sender: Any) {
    }
    @IBAction func edit(_ sender: Any) {
    }
    @IBAction func backItem(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func checkMarkTapped(_ sender: UIButton) {
        
               

               UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {

                   sender.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)

                    

                       }) { (success) in

                           UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {

                               sender.isSelected = !sender.isSelected

                               sender.transform = .identity

                           }, completion: nil)

                       }

                   }
    override func viewDidLoad() {
        super.viewDidLoad()
        priceLabel.layer.masksToBounds = true
        priceLabel.layer.cornerRadius = 10
        tagLabel.layer.masksToBounds = true
        tagLabel.layer.cornerRadius = 10
        Button.setImage(UIImage(named:"favorito"), for: .normal)
        Button.setImage(UIImage(named:"estrella"), for: .selected)
    }
    
    override func didReceiveMemoryWarning() {

                super.didReceiveMemoryWarning()

                // Dispose of any resources that can be recreated.

            }
    
    override func viewWillAppear(_ animated: Bool) {
        let strBase64 = item?.imagenObj ?? ""
        do {
            let dataDecoded : Data = Data(base64Encoded: strBase64, options: .ignoreUnknownCharacters)!
            let decodedimage:UIImage = UIImage(data: dataDecoded as Data)!
            print(decodedimage)
            imageView.image = decodedimage
        }
        catch {
            imageView.backgroundColor = .black
            print("Error jajaj xd")
        }
        
        nameLabel.text = item?.nameObj
        nameLabel.textColor = UIColor.white
        tagLabel.text = item?.tagsObj
        tagLabel.textColor = UIColor.white
        tectLabel.text = item?.text
        priceLabel.text = item?.priceObj
        priceLabel.textColor = UIColor.white
    }
    
    
}
