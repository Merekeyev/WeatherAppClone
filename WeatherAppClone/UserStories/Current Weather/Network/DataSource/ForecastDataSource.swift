//
//  ForecastDataSource.swift
//  WeatherAppClone
//
//  Created by Temirlan on 28.05.2023.
//

import Foundation

class ForecastDataSource {
    private let network = Network()
    
    func getForecast(cityName: String, days: Int, completion: @escaping (Result<CityModel, Error>) -> Void) {
        network.execute(WeatherEndpoint.forecast(cityName: cityName, days: days), completion: completion)
    }
}
