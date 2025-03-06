//
//  DetailsViewController.swift
//  Multiple Screen App
//
//  Created by Manav Verma on 01/03/2025.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //MARK: - Outlets and action
    @IBOutlet weak var engineLabel: UILabel!
    @IBOutlet weak var topSpeedLabel: UILabel!
    @IBOutlet weak var accelerationLabel: UILabel!
    @IBOutlet weak var brakingLabel: UILabel!
    @IBOutlet weak var handlingLabel: UILabel!
    @IBOutlet weak var blacklistLabel: UILabel!
    
    var carData : Car!


    override func viewDidLoad() {
        super.viewDidLoad()

        // populate Data outlets
        engineLabel.text  = carData.engine
        topSpeedLabel.text = "\(carData.topSpeed) Km/h"
        accelerationLabel.text = generateStarRating(
            for: carData.acceleration
        )
        brakingLabel.text = generateStarRating(
            for: carData.acceleration
        )
        handlingLabel.text = generateStarRating(
            for: carData.acceleration
        )
        blacklistLabel.text = carData.blacklistRacer

    }
    
    
    func generateStarRating(for rating: Int) -> String {
        let filledStars = String(repeating: "★", count: rating)
        let emptyStars = String(repeating: "☆", count: 5 - rating)
        return filledStars + emptyStars
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue2" {
            let destination = segue.destination as! WebViewController
            destination.webURL = carData.url
        }
        
    }

}
