import UIKit

class DemoTableViewCell: UITableViewCell {
   
    //Referenciamos los elementos del diseño en codigo para su posterior uso
    
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var objImage: UIImageView!
    
    @IBOutlet weak var objName: UILabel!
    
    @IBOutlet weak var objTags: UILabel!
    
    @IBOutlet weak var objPrice: UILabel!
    
    @IBOutlet weak var favItem: UIButton!
    
    @IBAction func favButtom(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {

            sender.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)

             

                }) { (success) in

                    UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {

                        sender.isSelected = !sender.isSelected

                        sender.transform = .identity

                    }, completion: nil)

                }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        favItem.setImage(UIImage(named:"favorito"), for: .normal)
        favItem.setImage(UIImage(named:"estrella"), for: .selected)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        objTags.layer.masksToBounds = true
        objTags.layer.cornerRadius = 10
    }

}
