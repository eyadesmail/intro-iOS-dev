//
//  MapViewController.swift
//  simplynews2
//
//  Created by Esmail, Eyad Ehab Younis Othman on 5/12/19.
//  Copyright © 2019 Esmail, Eyad Ehab Younis Othman. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController {

   
    
    @IBOutlet weak var mapview: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    var matchingItems: [MKMapItem] = [MKMapItem]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapview.showsUserLocation = true
    
        let searchrequest = MKLocalSearch.Request()
        searchrequest.naturalLanguageQuery = "News"
        searchrequest.region = mapview.region
        
        let search = MKLocalSearch(request: searchrequest)
        search.start(completionHandler: {(response, error) in
            if error != nil {
            } else if response!.mapItems.count == 0 {
            } else {
                for item in response!.mapItems {
                    print("Name = \(item.name)")
                    print("Phone = \(item.phoneNumber)")
                    
                    self.matchingItems.append(item as MKMapItem)
                    print("Matching items = \(self.matchingItems.count)")
                    
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = item.placemark.coordinate
                    annotation.title = item.name
                    self.mapview.addAnnotation(annotation)
                }
            }
        })
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapview.setRegion(coordinateRegion, animated: true)
        mapview.mapType = MKMapType.hybrid
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
