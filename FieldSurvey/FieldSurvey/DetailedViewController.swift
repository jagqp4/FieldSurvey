//
//  DetailedViewController.swift
//  FieldSurvey
//
//  Created by Jordan Gunter on 7/20/17.
//  Copyright © 2017 Jordan Gunter. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    var observation : Species?
    
    var dateFormatter = DateFormatter()
    
    @IBOutlet weak var speciesImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        speciesImageView.image = observation?.classification.image
        titleLabel.text = observation?.title
        
        if let date = observation?.date {
            
            dateLabel.text = dateFormatter.string(from: date)
        }
        else{
            dateLabel.text = ""
        }
        
        descriptionTextView.text = observation?.description

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
