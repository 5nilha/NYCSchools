//
//  SchoolViewModel.swift
//  NYCSchoolsApp
//
//  Created by Fabio Quintanilha on 1/6/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import Foundation

struct SchoolViewModel {
    
    let school: School!
    
    init(data: [String : Any]) {
        self.school = School(dataJSON: data)
    }
    
    var schoolName: String {
        return self.school.schoolName.capitalized
    }
    
    var address: String {
        return "\(self.school.address), \(self.school.city), \(self.school.state) \(self.school.zipcode)"
    }
    
    var website: String {
        return self.school.websiteURL
    }
    
    var geoPoint: (lat: Double, long: Double) {
        return (self.school.latitude, self.school.longitude)
    }
    
    var email: String {
        return self.school.email
    }
    
    var schoolTime: (start: String, end: String) {
        return (self.school.startingTime, self.school.endingTime)
    }
    
    var numOfStudents: String {
        return self.school.numOfStudents
    }
    
    var neighborhood: String {
        return self.school.neighborhood
    }
    
    var section: Character {
        return self.schoolName.first!
    }
}
