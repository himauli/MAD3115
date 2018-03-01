//
//  ViewController.swift
//  Maps_Day8
//
//  Created by MacStudent on 2018-03-01.
//  Copyright © 2018 Himauli. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var myMap: MKMapView!
    
    let lambtonCollegeLocation = CLLocation(latitude: 43.773257, longitude: -79.335899)
    let regionRadius: CLLocationDistance = 500
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myMap.mapType = MKMapType.standard
        
        centerMapOnLocation(location: lambtonCollegeLocation, title: "LambtonCollege", subTitle: "Location")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func centerMapOnLocation(location: CLLocation, title: String, subTitle: String)
    {
        
        //get the location cordinates
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        
        //focus the map on specified location
        myMap.setRegion(coordinateRegion, animated: true)
        
        // Drop a pin at user's Current Location
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        
        myAnnotation.coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude);
        myAnnotation.title = title
        myAnnotation.subtitle = subTitle
        
        //display pin on location
        myMap.addAnnotation(myAnnotation)
    }
    


}

