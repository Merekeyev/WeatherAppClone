//
//  ForecastDataSource.swift
//  WeatherAppClone
//
//  Created by Temirlan on 28.05.2023.
//

import Foundation

class ForecastDataSource {
    func getForecast(cityName: String, days: Int, completion: @escaping (Result<CityModel, Error>) -> Void) {
        let urlRequest = WeatherEndpoint.forecast(cityName: cityName, days: days).urlRequest
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            do {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    throw NSError(domain: "base error", code: 0)
                }
                
                let decoder = JSONDecoder()
                
                if let response = response as? HTTPURLResponse {
                    switch response.statusCode {
                    case 200..<300:
                        let decodedObject = try decoder.decode(CityModel.self, from: data)
                        completion(.success(decodedObject))
                    default:
                        throw NSError(domain: "base error", code: 0)
                    }
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        .resume()
    }
}
