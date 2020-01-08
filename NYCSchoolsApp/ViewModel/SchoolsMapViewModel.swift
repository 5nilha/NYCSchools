//
//  SchoolsMapViewModel.swift
//  NYCSchoolsApp
//
//  Created by Fabio Quintanilha on 1/7/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import Foundation
import MapKit

class SchoolsMapViewModel: NSObject {
    
    var schoolMap: MKMapView!
    
    init(schoolMap: MKMapView) {
        super.init()
        self.schoolMap = schoolMap
        self.setInitialZoomOnMap()
        updateSchoolsPins(schoolList: SchoolsListViewModel.schoolList)
    }
    
    private func setInitialZoomOnMap() {
        let nycCoordinate = CLLocationCoordinate2D(latitude: 40.724582, longitude: -73.980309)
        let regionRadius: CLLocationDistance = 4000
        let coordinateRegion = MKCoordinateRegion(center: nycCoordinate, latitudinalMeters: regionRadius * 2.0, longitudinalMeters: regionRadius * 2.0)
        self.schoolMap.setRegion(coordinateRegion, animated: true)
    }
    
    private func setPin(school: SchoolViewModel) {
        let coordinate = CLLocationCoordinate2D(latitude: school.geoPoint.lat, longitude: school.geoPoint.long)
        let pinAnnotation = MKPointAnnotation()
        pinAnnotation.title = school.schoolName
        pinAnnotation.coordinate = coordinate
        self.schoolMap.addAnnotation(pinAnnotation)
    }
    
}

extension SchoolsMapViewModel{

    func updateSchoolsPins(schoolList: [SchoolViewModel]?) {
        print(schoolList!.count)
        if let schoolMap = self.schoolMap {
            if !schoolMap.annotations.isEmpty {
                schoolMap.removeAnnotations(schoolMap.annotations)
            }
            if let schoolList = schoolList {
                for school in schoolList {
                    self.setPin(school: school)
                }
            }
        }
    }
    
}

extension SchoolsMapViewModel: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        let identifier = "School Annotation"
        var annotationView = self.schoolMap.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
    
}
