//
//  School.swift
//  NYCSchoolsApp
//
//  Created by Fabio Quintanilha on 1/6/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import Foundation

struct School {
    let schoolName: String
    let overview: String
    let address: String
    let city: String
    let state: String
    let zipcode: String
    let phoneNumber: String
    let email: String
    let websiteURL: String
    let startingTime: String
    let endingTime: String
    let numOfStudents: String
    let latitude: Double
    let longitude: Double
    let neighborhood: String
    
    init(dataJSON: [String: Any]) {
        
        let schoolName = dataJSON["school_name"] as? String ?? ""
        let overview = dataJSON["overview_paragraph"] as? String ?? "N/A"
        let address = dataJSON["primary_address_line_1"] as? String ?? "N/A"
        let city = dataJSON["city"] as? String ?? "N/A"
        let state = dataJSON["state_code"] as? String ?? "N/A"
        let zipcode = dataJSON["zip"] as? String ?? "N/A"
        let phoneNumber = dataJSON["phone_number"] as? String ?? "N/A"
        let email = dataJSON["school_email"] as? String ?? "N/A"
        let websiteURL = dataJSON["website"] as? String ?? "N/A"
        let startingTime = dataJSON["start_time"] as? String ?? "N/A"
        let endingTime = dataJSON["end_time"] as? String ?? "N/A"
        let numOfStudents = dataJSON["total_students"] as? String ?? "N/A"
        let latitude = Double(dataJSON["latitude"] as? String ?? "\(dataJSON["latitude"] as? Double ?? 0)")
        let longitude = Double(dataJSON["longitude"] as? String ?? "\(dataJSON["longitude"] as? Double ?? 0)")
        let neighborhood = dataJSON["neighborhood"] as? String ?? "N/A"
        
        self.schoolName = schoolName
        self.overview = overview
        self.address = address
        self.city = city
        self.state = state
        self.zipcode = zipcode
        self.phoneNumber = phoneNumber
        self.email = email
        self.websiteURL = websiteURL
        self.startingTime = startingTime
        self.endingTime = endingTime
        self.numOfStudents = numOfStudents
        self.latitude = latitude!
        self.longitude = longitude!
        self.neighborhood = neighborhood
    }
    
}
