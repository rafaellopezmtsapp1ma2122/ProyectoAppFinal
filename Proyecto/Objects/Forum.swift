import Foundation

class Forum: Codable{
    
    public let nameUser: String
    public let mensaje: String
    public let imagen: String
   
    init(json: [String: Any]){
        imagen = json["image"] as? String ?? ""
        nameUser = json["name"] as? String ?? ""
        mensaje = json["mensaje"] as? String ?? ""
       
    }
}
