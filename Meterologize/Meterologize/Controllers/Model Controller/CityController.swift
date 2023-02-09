//
//  CityController.swift
//  Meterologize
//
//  Created by Jacob Perez on 2/8/23.
//

import Foundation

class CityController {
    
    // MARK:- Properties
    static let sharedInstance = CityController()
    var cities: [City] = []
    
    
    // What do we need to create a City? Anything that doesn't have a defauly value.
    // tell the parameters what to expect.. What information am I going to need?
    func createCity(name: String, currentTemp: Double, dailyHigh: Int, dailyLow: Int, currentStatus: String) {
        // How are we going to make a City from these parameters?
        // Call a function we've made
        let newCity = City(name: name, currentTemp: currentTemp, dailyHigh: dailyHigh, dailyLow: dailyLow, currentStatus: currentStatus)
        // How to get a new City onto the cities array?
        cities.append(newCity)
        
        
    }
} //End of class
