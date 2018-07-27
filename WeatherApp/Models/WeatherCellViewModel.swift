//
//  WeatherCellViewModel.swift
//  WeatherApp
//
//  Created by Anthony Wong on 2018-07-27.
//  Copyright © 2018 Anthony Wong. All rights reserved.
//

import UIKit

struct WeatherCellViewModel {
    let time: Int
    let summary: String
    let icon: URL
    
    func loadImg(completion: @escaping (UIImage?) -> Void) {
        guard let imgData = try? Data(contentsOf: icon) else {
            return
        }
        let image = UIImage(data: imgData)
        DispatchQueue.main.async {
            completion(image)
        }
    }
}
