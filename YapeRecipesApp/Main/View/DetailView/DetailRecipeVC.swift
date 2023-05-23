//
//  DetailRecipeVC.swift
//  YapeRecipesApp
//
//  Created by Nelida Valencia on 18/05/23.
//

import UIKit
import MapKit
import CoreLocation

class DetailRecipeVC: UIViewController, UIViewControllerTransitioningDelegate {
    @IBOutlet private weak var imageRecipe: UIImageView!
    @IBOutlet private weak var nameRecipe: UILabel!
    @IBOutlet private weak var descriptionRecipe: UITextView!
    @IBOutlet private weak var mapView: MKMapView!
    var recipe : Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalle Receta"
        navigationController?.navigationBar.barTintColor = .blue
        prepareDataView()
        prepareMap()
    }
    
    func prepareMap() {
        let location = CLLocationCoordinate2D(latitude: recipe?.coordinates?.latitude ?? 0.0, longitude: recipe?.coordinates?.longitude ?? 0.0)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = recipe?.name

        let targetDistance = 500.0
        let camera = MKMapCamera(lookingAtCenter: location, fromDistance: targetDistance, pitch: 0, heading: 0)
        
        self.mapView.addAnnotation(annotation)
        self.mapView.setCamera(camera, animated: false)
    }
    
    func prepareDataView() {
        self.nameRecipe.text = recipe?.name
        self.descriptionRecipe.text = recipe?.description
        self.imageRecipe.imageFromServerURL(urlString: (recipe?.image)!, placeholderImage:UIImage(named: "default_image")!)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func goToMap(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "MapRecipeVC", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MapRecipeVC") as! MapRecipeVC
        let object = recipe
        nextViewController.recipe = object
        nextViewController.modalPresentationStyle = .fullScreen
        nextViewController.transitioningDelegate = self
        self.present(nextViewController, animated: true)
    }
    
}
