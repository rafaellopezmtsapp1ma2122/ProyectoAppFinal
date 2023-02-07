import Foundation
import UIKit

class Item: Codable{
    
    public let nameObj: String
    public let text: String
    public let priceObj: Int
    public var priceStr: String
    public let imagenObj: String
    public let tagsObj: String
    
    init(json: [String: Any]){
        nameObj = json["name"] as? String ?? "None"
        text = json["desc"] as? String ?? "Without description"
        imagenObj = json["image"] as? String ?? ""
        tagsObj = json["tags"] as? String ?? "Empty"
        priceObj = json["price"] as? Int ?? 0
        priceStr = String(priceObj)
        priceStr = priceStr + "€"
    }
    
    
    
}
