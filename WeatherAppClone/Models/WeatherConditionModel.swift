//
//  WeatherConditionModel.swift
//  WeatherAppClone
//
//  Created by Temirlan on 28.05.2023.
//

import Foundation

struct WeatherConditionModel: Decodable {
    let text: String
    let iconURLPath: String
    
    enum CodingKeys: String, CodingKey {
        case text
        case iconURLPath = "icon"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        self.iconURLPath = try container.decode(String.self, forKey: .iconURLPath)
    }
}
