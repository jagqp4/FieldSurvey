//
//  FieldSurveyJSONParser.swift
//  FieldSurvey
//
//  Created by Jordan Gunter on 7/20/17.
//  Copyright © 2017 Jordan Gunter. All rights reserved.
//

import Foundation

class FieldSurveyJSONParser{
    
    static let dateFormatter = DateFormatter()
    
    class func parse(_ data: Data)-> [Species]{
        var species = [Species]()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
           let root = json as? [String: Any],
           let status = root["status"] as? String,
           status == "ok" {
            
            if let observations = root["observations"] as? [Any] {
                for item in observations{
                    if let item = item as? [String: String] {
                            if let className = item["classification"],
                               let title = item["title"],
                               let description = item["description"],
                               let dateString = item["date"],
                               let date = dateFormatter.date(from: dateString){
                                
                                    if let newSpecies = Species(className: className, title: title, description: description, date: date) {
                                
                                        species.append(newSpecies)
                                
                                }
                        }
                            
                    }
                } //for item in observation
            }
        } //status == ok
        
        return species
    }
}
