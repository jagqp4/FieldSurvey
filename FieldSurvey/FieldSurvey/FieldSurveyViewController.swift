//
//  FieldSurveyViewController.swift
//  FieldSurvey
//
//  Created by Jordan Gunter on 7/20/17.
//  Copyright © 2017 Jordan Gunter. All rights reserved.
//

import UIKit

class FieldSurveyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let fieldSurvey = FieldSurveyJSONLoader.load(fileName: "field_observations")
    
    let dateFormatter = DateFormatter()
    
    @IBOutlet weak var fieldSurveyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldSurvey.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "observationCell", for: indexPath)
        
        if let cell = cell as? FieldSurveyTableViewCell {
            let species = fieldSurvey[indexPath.row]
            cell.speciesIconImageView.image = species.classification.image
            cell.titleLabel.text = species.title
            cell.dateLabel.text = dateFormatter.string(from: species.date)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailedViewController,
            let row = fieldSurveyTableView.indexPathForSelectedRow?.row {
        
            destination.observation = fieldSurvey[row]
        }
    
        
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
