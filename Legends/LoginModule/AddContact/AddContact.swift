//
//  AddContact.swift
//  Legends
//
//   on 13/04/21.
//

import Foundation

struct ContactAdd:Decodable {
    var phone:String?
    var code:String?
    enum CodingKeys: String, CodingKey {
        case phone = "phone"
        case code = "code"
    }
}
