//
//  Model.swift
//  BeSpotAssignment
//
//  Created by Angelos Staboulis on 4/6/22.
//

import Foundation
struct Model:Decodable{
    var uuid: String?
    var address:String?
    var code:String?
    var location:LocationModel?
    var name:String?
    var reward_checkin_points:Int?
    var tags:[String]=[]
    var type: String?
    enum CodingKeys:String,CodingKey{
        case uuid
        case address
        case code
        case location
        case name
        case reward_checkin_points
        case tags
        case type
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try container.decode(String.self, forKey: CodingKeys.uuid)
        address = try container.decode(String.self, forKey: CodingKeys.address)
        code = try container.decode(String.self, forKey: CodingKeys.code)
        location = try container.decode(LocationModel.self, forKey: CodingKeys.location)
        name = try container.decode(String.self, forKey: CodingKeys.name)
        reward_checkin_points = try container.decode(Int.self, forKey: CodingKeys.reward_checkin_points)
        tags = try container.decode([String].self, forKey: CodingKeys.tags)
        type = try container.decode(String.self, forKey: CodingKeys.type)
    }
   
}
