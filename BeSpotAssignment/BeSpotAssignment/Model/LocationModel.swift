//
//  LocationModel.swift
//  BeSpotAssignment
//
//  Created by Angelos Staboulis on 4/6/22.
//

import Foundation
struct LocationModel:Decodable{
    var lat:Double?
    var lon:Double?
    enum CodingKeys:String,CodingKey{
        case lat
        case lon
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        lat = try container.decode(Double.self, forKey: CodingKeys.lat)
        lon = try container.decode(Double.self, forKey: CodingKeys.lon)
    }
}
