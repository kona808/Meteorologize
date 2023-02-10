//
//  CityListTableViewController.swift
//  Meterologize
//
//  Created by Jacob Perez on 2/9/23.
//

import UIKit

class CityListTableViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var cityTempTextField: UITextField!
    
    // MARK: - Lifescycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Actions
    // What needs to happen when the add button is tapped? Create a City.
    // We will need to grab the text from the textFields,
    // access our function that creates cities, we will need to adjust the function to suit our needs, provide an optional nil default value for our data types in the createCity function.
    // Then we need to unwrap our optionals with guard. At the same time we are also guarding that it is NOT empty, so that nothing gets added if the textField is empty. If there is not a ! it will check if it is empty and will not return.
    @IBAction func addCityButtonTapped(_ sender: Any) {
        guard let cityName = cityNameTextField.text, !cityName.isEmpty,
              let cityTemp = cityTempTextField.text, !cityTemp.isEmpty else { return }
        CityController.sharedInstance.createCity(name: cityName, currentTemp: Double(cityTemp) ?? 0 )
        
        updateTableView()
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // How many Cities do I want?
        // Return the number of sections
        return CityController.sharedInstance.cities.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        // Configure the cell....
        // This code does not highlight the cell so the User does not feel like they can interact with it because it does not do anything.
        cell.selectionStyle = .none
        // We are going to our cities array of our shared instance in our CityController class and grabbing that array, cities AND storing in another property called cityList.
        let cityList = CityController.sharedInstance.cities
        // We want to grab the first index/ item, in that new array.
        //        let city = cityList[0]
        // indexPath.row will go through each cell as the index suggested as we are using an array.
        // If row 1 grab item 1, if row 2 grab item 2 using indexes. [0,0], [1,1]
        let cityForIndex = cityList[indexPath.row]
        
        // How do we put text on the cell?
        // city.name will show the name in all the cells if it is not specified
        // Code below will be deprecated in the future.
        //        cell.textLabel?.text = cityForIndex.name
        //        cell.detailTextLabel?.text = "\(cityForIndex.currentTemp)"
        // New/ Future way to write text, we create the configuration, then assign it to the cell.
        var config = cell.defaultContentConfiguration()
        config.text = cityForIndex.name
        config.secondaryText = "\(cityForIndex.currentTemp)"
        // Configure cell, assigned to cell
        cell.contentConfiguration = config
        
        return cell
    }
    // How do we get a poplation of text to load in the cell after it is created with the add button?
    // MARK: - Helper
    func updateTableView() {
        self.tableView.reloadData()
    }
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        /// What segue has been triggered?
        if segue.identifier == "toDetailViewController" {
            /// Index - Discovering what row the user has seleceted
            /// What cell did the user tap on?
            if let index = tableView.indexPathForSelectedRow {
                /// Destination - Verifying the segues destination leads to the *ViewController* we want. This also allows us to access the properties on that *ViewController*
                /// Where is the user going?
                if let destination = segue.destination as? CityDetailViewController {
                    /// Object to send - Using the index we discovered earlier we retrieve the *City* that matches in our *cities* array.
                    /// What object am I sending to the detail VC?
                    let city = CityController.sharedInstance.cities[index.row]
                    /// Object to receive - Sets the value of the optional *city* on the *destination* to the *city* we just retrived.
                    /// What object is recieving the data? The city
                    destination.objectToRecieveTheDataFromOurPrepareForSegue = city
                }
            }
        }
    }
} // End of class
