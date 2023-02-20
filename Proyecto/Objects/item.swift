import Foundation
import UIKit

class Item {
    
    public let nameObj: String
    public let text: String
    public let priceObj: String
    public let imagenObj: String
    public let tagsObj: String
    
    init(json: [String: Any]){
        nameObj = json["name"] as? String ?? "None"
        text = json["des"] as? String ?? "Without description"
        imagenObj = json["img"] as? String ?? ""
        tagsObj = json["tags"] as? String ?? "Empty"
        priceObj = json["price"] as? String ?? "0" + "€"
        
    }
}
