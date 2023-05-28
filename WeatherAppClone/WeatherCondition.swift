//
//  WeatherCondition.swift
//  WeatherAppClone
//
//  Created by Temirlan on 14.05.2023.
//

import Foundation

enum WeatherCondition {
    case clouds
    case sunny
    case rainy
    case snowy
    
    var iconName: String {
        switch self {
        case .clouds:
            return "clouds"
        case .sunny:
            return "clouds"
        case .rainy:
            return "clouds"
        case .snowy:
            return "clouds"
        }
    }
    
    var condition: String {
        switch self {
        case .clouds:
            return "Преимущественно облачно"
        case .sunny:
            return "Ясно"
        case .rainy:
            return "Идет дождь"
        case .snowy:
            return "Идет снег"
        }
    }
}
