//
//  Species.swift
//  FieldSurvey
//
//  Created by Jordan Gunter on 7/20/17.
//  Copyright © 2017 Jordan Gunter. All rights reserved.
//

import Foundation

struct Species{
    let classification : Classification
    let title: String
    let description: String
    let date: Date
    
    init(classification: Classification, title: String, description: String, date: Date){
        self.classification = classification
        self.title = title
        self.description = description
        self.date = date
    }
    
    init?(className: String, title: String, description: String, date: Date){
        if let classification = Classification(rawValue: className){
            self.init(classification: classification, title: title, description: description, date: date)
        }
        else{
            return nil
        }
        
        
    }
}
