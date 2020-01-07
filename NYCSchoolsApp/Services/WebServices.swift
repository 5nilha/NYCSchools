//
//  WebServices.swift
//  NYCSchoolsApp
//
//  Created by Fabio Quintanilha on 1/6/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import Foundation
import Alamofire

class Webservices {
    
    static func fecthSchools(completion: @escaping ([[String : Any]?]?) -> ()) {
        let url = URL(string: "https://data.cityofnewyork.us/resource/uq7m-95z8.json")!
        AF.request(url).validate().responseJSON(queue: .global(), options: .mutableLeaves, completionHandler: { (response) in
            let data = response.value as! [[String : Any]]
            completion(data)
        })
    }
    
}
