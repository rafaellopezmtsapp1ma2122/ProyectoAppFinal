import Foundation
import UIKit

class User: Codable{
    
    public let userName: String
    public let email: String
    public let token_pass: String
    public let token_log: String
    public let imagenUser: String
    
    init(json: [String: Any]){
        userName = json["userName"] as? String ?? ""
        email = json["email"] as? String ?? ""
        token_pass = json["token_pass"] as? String ?? ""
        token_log = json["token_log"] as? String ?? ""
        imagenUser = json["imagenUser"] as? String ?? ""
        
    }
}
