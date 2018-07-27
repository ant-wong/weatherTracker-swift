//
//  Weather.swift
//  WeatherApp
//
//  Created by Anthony Wong on 2018-07-27.
//  Copyright © 2018 Anthony Wong. All rights reserved.
//

import Foundation

class Weather: Codable {
    let daily: Daily
}

struct Daily: Codable {
    let summary: String
    let data: [ForecastDay]
}

struct ForecastDay: Codable {
    let time: Int
    let summary: String
    let icon: String
}
