import Foundation
import UIKit

struct User: Codable{
    
    public let name: String
    public let email: String
    public let token: String
    public let session: String
    public let image: String
    /*
    init(json: [String: Any]){
        name = json["name"] as? String ?? ""
        email = json["email"] as? String ?? ""
        token = json["token"] as? String ?? ""
        session = json["session"] as? String ?? ""
        image = json["image"] as? String ?? ""
        
    }
     */
    
}
