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
    public let numero: String
    public let imagen: String
   
    
    
    init(json: [String: Any]){
        imagen = json["image"] as? String ?? ""
        nameForum = json["name"] as? String ?? ""
        numero = json["numForum"] as? String ?? ""
        
       
    }
}
