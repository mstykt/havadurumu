//
//  ViewController.swift
//  havadurumu
//
//  Created by Mesut on 04/10/16.
//  Copyright © 2016 Mesut. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImg: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var weather: CurrentWeather!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        weather = CurrentWeather()
        weather.downloadWeatherDetails {
            self.updateMainInfo()
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        return cell
    }
    
    func updateMainInfo() {
        dateLabel.text = "\(weather.date)"
        currentWeatherTypeLabel.text = "\(weather.weatherType)"
        currentTempLabel.text = "\(weather.currentTemp)"
        locationLabel.text = "\(weather.cityName)"
        currentWeatherImg.image = UIImage(named: weather.weatherType)
    }

}

