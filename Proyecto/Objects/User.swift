import Foundation
import UIKit

class User: Codable{
    
    public let userName: String
    public let email: String
    public let token_pass: String
    public let token_log: String
    public let imagenUser: String
    
    init(json: [String: Any]){
        userName = json["name"] as? String ?? ""
        email = json["email"] as? String ?? ""
        token_pass = json["token"] as? String ?? ""
        token_log = json["session"] as? String ?? ""
        imagenUser = json["image"] as? String ?? ""
        
    }
}
