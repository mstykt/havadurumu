//
//  CurrentWeather.swift
//  havadurumu
//
//  Created by Mesut on 04/10/16.
//  Copyright © 2016 Mesut. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _currentTemp: Double!
    var _weatherType: String!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        
        return _weatherType
    }
    
    func downloadWeatherDetails(completed: DownlodComplete) {
        let currentURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentURL).responseJSON { response in
            let result = response.result
            print(result)
            //print(response)
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print("city::: \(self._cityName)")
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print("weather::: \(self._weatherType)")
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let temp = main["temp"] as? Double {
                        
                        self._currentTemp = Double(temp - 272.15)
                        print("curentTep::: \(self._currentTemp)")
                    }
                }
            }
        }
        completed()
    }
}
