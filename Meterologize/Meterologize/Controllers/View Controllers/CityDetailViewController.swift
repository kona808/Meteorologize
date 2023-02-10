//
//  CityDetailViewController.swift
//  Meterologize
//
//  Created by Jacob Perez on 2/9/23.
//

import UIKit

class CityDetailViewController: UIViewController {

    
    // MARK: - Outlets
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentStatusLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var dailyHighLabel: UILabel!
    @IBOutlet weak var dailyLowLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    // MARK: - Methods
    func updateViews() {
        // We need to go to our sharedInstance, grab a City from array cities bring it back and use it to populate our labels.
        // How do we call our shared instance?
        let city = CityController.sharedInstance.cities[0]
        cityNameLabel.text = city.name
        currentStatusLabel.text = city.currentStatus
        currentTempLabel.text = "Current Status: \(city.currentTemp)"
        dailyHighLabel.text = "Daily High: \(city.dailyHigh ?? 0)"
        dailyLowLabel.text = "Daily Low: \(city.dailyLow ?? 0)"
        
        // Ternary
        self.view.backgroundColor = city.currentTemp <= 80 ? .systemBlue : .red
    }
    
} // End of class
