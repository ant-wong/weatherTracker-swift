//
//  WeatherAPIClient.swift
//  WeatherApp
//
//  Created by Anthony Wong on 2018-07-27.
//  Copyright © 2018 Anthony Wong. All rights reserved.
//

import Foundation

class WeatherAPIClient: APIClient {
    var session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func weather(with endpoint: WeatherEndpoint, completion: @escaping (Either<Daily, APIError>) -> Void) {
        let request = endpoint.request
        self.fetch(with: request) { (either: Either<Weather, APIError>) in
            switch either {
            case .value(let weather):
                let weather = weather.daily
                completion(.value(weather))
            case .error(let error):
                completion(.error(error))
            }
        }
    }
}
