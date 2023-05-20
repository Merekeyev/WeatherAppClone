//
//  CurrentTemperatureModel.swift
//  WeatherAppClone
//
//  Created by Temirlan on 13.05.2023.
//

import Foundation

struct CurrentTemperatureModel {
    let city: String
    let temperature: Int
    let condition: String
    private let maxTemperature: Int
    private let minTemperature: Int
    
    init(city: String, temperature: Int, condition: String, maxTemperature: Int, minTemperature: Int) {
        self.city = city
        self.temperature = temperature
        self.condition = condition
        self.maxTemperature = maxTemperature
        self.minTemperature = minTemperature
    }
    
    var temperatureRange: String {
        "Макс.: \(maxTemperature.withTemperature), мин.: \(minTemperature.withTemperature)"
    }
    
    static var test: CurrentTemperatureModel {
        CurrentTemperatureModel(city: "New York", temperature: 18, condition: "Ясно", maxTemperature: 25, minTemperature: 12)
    }
}
