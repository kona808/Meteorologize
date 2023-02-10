//
//  City.swift
//  Meterologize
//
//  Created by Jacob Perez on 2/8/23.
//

import Foundation

class City {
    // It is possible to make a City without the 3 optional properties
    let name: String
    let currentTemp: Double
    let dailyHigh: Int?
    let dailyLow: Int?
    let currentStatus: String?
    
    init(name: String, currentTemp: Double, dailyHigh: Int?, dailyLow: Int?, currentStatus: String?) {
        self.name = name
        self.currentTemp = currentTemp
        self.dailyHigh = dailyHigh
        self.dailyLow = dailyLow
        self.currentStatus = currentStatus
    }
} //End of class
