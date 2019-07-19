//
//  ViewController.swift
//  Day 3 - Find My Position
//
//  Created by gaoshilei on 2019/7/18.
//  Copyright © 2019 gaoshilei. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager:CLLocationManager = CLLocationManager()
    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longtitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    var currLocation:CLLocation! {
        didSet {
            latitudeLabel.text = String(describing: "latitude: \(currLocation.coordinate.latitude)")
            longtitudeLabel.text = String(describing: "longtitude: \(currLocation.coordinate.longitude)")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func findMyPosition(_ sender: Any) {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 100
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            print("定位已开启...")
        }
    }
    
    func getAddress(location:CLLocation!) {
        if (nil == location?.coordinate.latitude) {
            return
        }
        var request = URLRequest(url: URL(string: "https://apis.map.qq.com/ws/geocoder/v1/?location=\(location.coordinate.latitude),\(location.coordinate.longitude)&key=CTXBZ-5F3RX-WIM43-ZGTCZ-F2AFK-OKFNM&get_poi=1")!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if (nil == data) {return}
            self.handleData(data: data)
        }
        task.resume()
    }
    
    func handleData(data:Data!) {
        let jsonData:Dictionary<String, Any>? = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? Dictionary<String, Any>
        let resultDic:Dictionary? = jsonData?["result"] as? Dictionary<String, Any>
        DispatchQueue.main.async {
            self.addressLabel.text = resultDic?["address"] as? String
            print(self.addressLabel.text!)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location:CLLocation? = locations.first
        print("latitude=\(String(describing: location?.coordinate.latitude)),longitude=\(String(describing: location?.coordinate.longitude))")
        currLocation = location
        getAddress(location: location)
    }
}

