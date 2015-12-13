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

        self.locationManager.distanceFilter = 50
        self.locationManager.startUpdatingLocation()
        
        
        self.view.addSubview(mapView)
        
        let backButton = UIButton()
        backButton.frame = CGRectMake(10, 30, 20,25)
        backButton.setImage(UIImage(named: "backButton.png"), forState: .Normal)
        backButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        backButton.addTarget(self, action: "backPressed", forControlEvents: .TouchUpInside)
        
        
        
        self.view.addSubview(backButton)
        
        checkLocationAuthorizationStatus()
        createAnottations()
        
        
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
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {

        if let annotation = annotation as? Pacote {
            let identifier = "Teste"
            var pin:MKAnnotationView
            if let dequeudView = self.mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) {
                dequeudView.annotation = annotation
                pin = dequeudView
            }
            else {
                pin = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                pin.canShowCallout = true
                pin.calloutOffset = CGPointMake(-5, -5)
            }
            pin.image = UIImage(named: "locationIcon")
            return pin
        }
        return nil
        
    }
    
    

    func createAnottations() {
        
        let pacote1 = Pacote(title: "Christ the Redeemer",
            locationName: "4 Stickerz!",
            discipline: "DS",
            coordinate: CLLocationCoordinate2D(latitude: -22.951792446342846 , longitude: -43.20984743797453))

        let pacote2 = Pacote(title: "Maracanã",
            locationName: "8 Stickerz!",
            discipline: "DS",
            coordinate: CLLocationCoordinate2D(latitude: -22.91250752441889 , longitude: -43.230342864990234))
        
        let pacote3 = Pacote(title: "Engenhão",
            locationName: "4 Stickerz!",
            discipline: "DS",
            coordinate: CLLocationCoordinate2D(latitude: -22.893215833061202 , longitude: -43.291969299316406))
        
        let pacote4 = Pacote(title: "Leblon Beach",
            locationName: "4 Stickerz!",
            discipline: "DS",
            coordinate: CLLocationCoordinate2D(latitude: -22.987631958251498 , longitude: -43.223819732666016))
        
        let pacote5 = Pacote(title: "Leblon Beach",
            locationName: "4 Stickerz!",
            discipline: "DS",
            coordinate: CLLocationCoordinate2D(latitude: -22.979335149159237 , longitude: -43.21798324584961))
        
        mapView.addAnnotation(pacote1)
        mapView.addAnnotation(pacote2)
        mapView.addAnnotation(pacote3)
        mapView.addAnnotation(pacote4)
        mapView.addAnnotation(pacote5)

    }
}//end of class
