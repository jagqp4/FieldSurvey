//
//  Classification.swift
//  FieldSurvey
//
//  Created by Jordan Gunter on 7/20/17.
//  Copyright © 2017 Jordan Gunter. All rights reserved.
//

import UIKit

enum Classification: String {
    case amphibian
    case bird
    case fish
    case insect
    case mammal
    case plant
    case reptile
    
    var image: UIImage?{
        return UIImage(named: self.rawValue + "Icon")
    }
}
