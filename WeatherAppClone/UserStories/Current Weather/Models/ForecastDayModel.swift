//
//  ForecastDayModel.swift
//  WeatherAppClone
//
//  Created by Temirlan on 28.05.2023.
//

import Foundation

struct ForecastDayModel: Decodable {
    let date: String
    let day: ForecastDayDayModel
    var hours: [ForecastHourModel]
    
    enum CodingKeys: String, CodingKey {
        case date
        case day
        case hours = "hour"
    }
}

struct ForecastDayDayModel: Decodable {
    let maxTemperature: Double
    let minTemperature: Double
    let condition: WeatherConditionModel
    
    enum CodingKeys: String, CodingKey {
        case maxTemperature = "maxtemp_c"
        case minTemperature = "mintemp_c"
        case condition
    }
}

struct ForecastHourModel: Decodable {
    var time: String
    let currentTemperature: Double
    let condition: WeatherConditionModel
    
    enum CodingKeys: String, CodingKey {
        case time
        case currentTemperature = "temp_c"
        case condition
    }
}
