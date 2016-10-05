//
//  Constans.swift
//  havadurumu
//
//  Created by Mesut on 05/10/16.
//  Copyright © 2016 Mesut. All rights reserved.
//

import Foundation


let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITU = "lat="
let LONGITUTE = "&lon="
let APP_ID = "&appid="
let APP_KEY = "ef901920d51660f57b335eb026695caf"

typealias DownlodComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITU)35\(LONGITUTE)139\(APP_ID)\(APP_KEY)"
