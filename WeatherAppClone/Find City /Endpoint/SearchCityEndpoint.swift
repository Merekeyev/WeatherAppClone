//
//  SearchCityEndpoint.swift
//  WeatherAppClone
//
//  Created by Temirlan on 3.06.2023.
//

import Foundation

enum SearchCityEndpoint {
    case search(query: String)
}

extension SearchCityEndpoint: RequestProviding {
    var urlRequest: URLRequest {
        switch self {
        case .search(let query):
            guard let url = URL(string: Constants.apiHost + "search.json?key=\(Constants.apiKey)&q=\(query)") else { fatalError() }
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            return urlRequest
        }
    }
}
