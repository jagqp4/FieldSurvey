//
//  FieldSurveyJSONLoader.swift
//  FieldSurvey
//
//  Created by Jordan Gunter on 7/20/17.
//  Copyright © 2017 Jordan Gunter. All rights reserved.
//

import Foundation

class FieldSurveyJSONLoader{
    
    class func load(fileName : String) -> [Species]{
        var species = [Species]()
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            species = FieldSurveyJSONParser.parse(data)
        }
        
        return species
    }
}
