//
//  MapRecipeVC.swift
//  YapeRecipesApp
//
//  Created by Nelida Valencia on 19/05/23.
//

import UIKit
import MapKit
import CoreLocation

class MapRecipeVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var recipe : Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareMap()
    }
    
    func prepareMap() {
        let location = CLLocationCoordinate2D(latitude: recipe?.coordinates?.latitude ?? 0.0, longitude: recipe?.coordinates?.longitude ?? 0.0)
        
        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = location
        annotation3.title = recipe?.name

        let targetDistance = 500.0
        let camera = MKMapCamera(lookingAtCenter: location, fromDistance: targetDistance, pitch: 0, heading: 0)
        
        self.mapView.addAnnotation(annotation3)
        self.mapView.setCamera(camera, animated: true)
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

