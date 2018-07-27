//
//  Endpoints.swift
//  WeatherApp
//
//  Created by Anthony Wong on 2018-07-27.
//  Copyright © 2018 Anthony Wong. All rights reserved.
//

import Foundation

protocol Endpoint {
    var baseUrl: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    
}

extension Endpoint {
    var urlComponent: URLComponents {
        var component = URLComponents(string: baseUrl)
        component?.path = path
        component?.queryItems = queryItems
        return component!
    }
    var request: URLRequest {
        print(urlComponent.url!)
        return URLRequest(url: urlComponent.url!)
    }
}

enum WeatherEndpoint: Endpoint {
    case dailyForecast(Long: Double, Lat: Double)
    var baseUrl: String {
        return "https://api.darksky.net"
    }
    var path: String {
        switch self {
        case .dailyForecast(let Long, let Lat):
            /* Find a way to convert city strings into long/lat! */
            return "/forecast/bbbcba57fb912215822aefa9bce04b55/\(Long),\(Lat)"
        }
    }
    var queryItems: [URLQueryItem] {
        return []
    }
}
