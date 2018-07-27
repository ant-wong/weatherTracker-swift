//
//  WeatherTableViewController.swift
//  WeatherApp
//
//  Created by Anthony Wong on 2018-07-26.
//  Copyright © 2018 Anthony Wong. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let weatherApi = WeatherAPIClient()
        let weatherEndpoint =  WeatherEndpoint.dailyForecast(Long: 49.2827, Lat: -123.1207)
        weatherApi.weather(with: weatherEndpoint) { (either) in
            switch either {
            case .value(let daily):
                print(daily)
            case .error(let error):
                print(error)
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)

        // Configure the cell...

        return cell
    }

}
