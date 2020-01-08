//
//  SchoolsMapViewController.swift
//  NYCSchoolsApp
//
//  Created by Fabio Quintanilha on 1/7/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit
import MapKit

class SchoolsMapViewController: UIViewController {
 
    @IBOutlet weak var mapView: MKMapView!
    var schoolsMapViewModel: SchoolsMapViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.schoolsMapViewModel = SchoolsMapViewModel(schoolMap: mapView)
        self.navigationItem.title = "Schools Map"
    }
}

extension SchoolsMapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        return schoolsMapViewModel.mapView(mapView, viewFor: annotation)
    }
    
}
