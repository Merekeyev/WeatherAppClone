//
//  CityModel.swift
//  WeatherAppClone
//
//  Created by Temirlan on 27.05.2023.
//

import Foundation

struct CityModel {
    let name: String
    let time: String
    let weatherCondition: WeatherCondition
    let currentTemperature: Int
    let maximumTemperature: Int
    let minimumTemperature: Int
    
    static var cities: [CityModel] {
        [CityModel(name: "Алматы", time: "15:51", weatherCondition: .clouds, currentTemperature: 23, maximumTemperature: 25, minimumTemperature: 17),
         CityModel(name: "Нью-Йорк", time: "02:51", weatherCondition: .sunny, currentTemperature: 26, maximumTemperature: 28, minimumTemperature: 20),
         CityModel(name: "Дубай", time: "13:51", weatherCondition: .sunny, currentTemperature: 30, maximumTemperature: 34, minimumTemperature: 25),
         CityModel(name: "Лондон", time: "09:51", weatherCondition: .rainy, currentTemperature: 12, maximumTemperature: 15, minimumTemperature: 9),
         CityModel(name: "Стамбул", time: "12:51", weatherCondition: .sunny, currentTemperature: 25, maximumTemperature: 27, minimumTemperature: 19)]
    }
    
    static var defaultCity: CityModel = CityModel(name: "Алматы", time: "15:51", weatherCondition: .clouds, currentTemperature: 23, maximumTemperature: 25, minimumTemperature: 17)
}
