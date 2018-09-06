//
//  ViewController.swift
//  WeatherAPP
//
//  Created by leon on 2018/9/6.
//  Copyright © 2018年 leonlee. All rights reserved.
//

import UIKit

import CoreLocation

class WeatherViewController: UIViewController ,CLLocationManagerDelegate{

    //Constants
    
    let WeatherURL = "http://api.openweathermap.org/data/2.5/weather"
    let APPID = "e27ca729af228beabd5d20e3b7749713"
    
    //Declare instance varialbles here
    
    let locationManager = CLLocationManager()
    
    //Pre-linked IBOutlets
    
    @IBOutlet weak var cityLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //Setup the location manager here
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    //MARK - Networking
    
    //Write the getWeatherData method here
    
    //MARK - JSON parsing
    
    //Write the updateWeatherData method here
    
   
    
    //MARK - UI Updates
    
    //Write the updateUIWithWeatherData method here
    
    //MARK - Location Manager Delegate Method
    
    //Write the didUpdataLocations method here
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
           locationManager.stopUpdatingLocation()
            print("longitude = \(location.coordinate.longitude),latitude = \(location.coordinate.latitude)")
            
            let latitude = String(location.coordinate.latitude)
            
            let longitude = String(location.coordinate.longitude)
            
            let params : [String : String] = ["lat" : latitude , "lon" : longitude , "appid" : APPID]
        }
    }
    
    //Write the didFailedWithError method here
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "location unavalable!"
    }
    
    //MARK - Change City Delegate method
    
    //Write the userEnteredANewCityName Delegate method here
    
    //Write the PrepareForSegue Method here
    
    
}

