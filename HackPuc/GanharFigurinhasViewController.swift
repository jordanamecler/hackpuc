//
//  GanharFigurinhasViewController.swift
//  HackPuc
//
//  Created by Leonardo Edelman Wajnsztok on 12/12/15.
//  Copyright © 2015 Flo. All rights reserved.
//

import UIKit
import MapKit

class GanharFigurinhasViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var mapView:MKMapView!
    var locationManager = CLLocationManager()

    var latitude:Double?
    var longitude:Double?
    let regionRadius: CLLocationDistance = 1000

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        mapView = MKMapView(frame: self.view.frame)
        mapView.delegate = self
        
        locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;

        self.locationManager.distanceFilter = 10
        self.locationManager.startUpdatingLocation()
        
        
        self.view.addSubview(mapView)
        
        let backButton = UIButton()
        backButton.frame = CGRectMake(10, 30, 20,20)
        backButton.setImage(UIImage(named: "backButton.png"), forState: .Normal)
        backButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        backButton.addTarget(self, action: "backPressed", forControlEvents: .TouchUpInside)
        
        
        
        self.view.addSubview(backButton)
        
        checkLocationAuthorizationStatus()
        
        
        
    }
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            mapView.showsUserLocation = true
        }
        else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    func backPressed() {
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        latitude = locValue.latitude
        longitude = locValue.longitude
        print(latitude)
        print(longitude)
        
        mapView.setCenterCoordinate(locValue, animated: true)
        
        let region = MKCoordinateRegion(center: locValue, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        mapView.setRegion(region, animated: true)
    }

    
}
