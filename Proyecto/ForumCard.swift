//
//  ForumCard.swift
//  Proyecto
//
//  Created by Apps2M on 7/2/23.
//

import Foundation
import UIKit

class ForumCard: Codable{
    
 
    public let nameForum: String
    public let numero: Int
    public let num: String
    //public let imagen: String
   
    
    
    init(json: [String: Any]){
        //imagen = json["image"] as? String ?? ""
        nameForum = json["nameForum"] as? String ?? ""
        numero = json["numForum"] as? Int ?? 0
        num = String(numero)
       
    }
}
