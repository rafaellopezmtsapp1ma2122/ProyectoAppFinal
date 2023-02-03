import Foundation

class Forum: Codable{
    
    public let nameUser: String
    public let mensaje: String
    public let usersStr: String
    public let imagen: String
    public let users: Int
    
    
    init(json: [String: Any]){
        imagen = json["image"] as? String ?? ""
        nameUser = json["name"] as? String ?? ""
        mensaje = json["image"] as? String ?? ""
        users = json["price"] as? Int ?? 0
        usersStr = String(users)
    }
    
    
    
}
