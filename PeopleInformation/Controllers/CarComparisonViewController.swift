//
//  CarComparisonViewController.swift
//  PeopleInformation
//
//  Created by Manav Verma on 06/03/2025.
//

import UIKit

class CarComparisonViewController: UIViewController {

    var car1: Car!
    var car2: Car!
    
    @IBOutlet weak var car1Image: UIImageView!
    @IBOutlet weak var car2Image: UIImageView!
    @IBOutlet weak var car1Name: UILabel!
    @IBOutlet weak var car2Name: UILabel!
    @IBOutlet weak var car1Brand: UILabel!
    @IBOutlet weak var car2Brand: UILabel!
    @IBOutlet weak var car1Speed: UILabel!
    @IBOutlet weak var car2Speed: UILabel!
    @IBOutlet weak var car1Engine: UILabel!
    @IBOutlet weak var car2Engine: UILabel!
    @IBOutlet weak var car1Acceleration: UILabel!
    @IBOutlet weak var car2Acceleration: UILabel!
    @IBOutlet weak var car1Handling: UILabel!
    @IBOutlet weak var car2Handling: UILabel!
    @IBOutlet weak var car1Braking: UILabel!
    @IBOutlet weak var car2Braking: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Car Comparison"

        car1Image.image = UIImage(named: car1.image)
        car2Image.image = UIImage(named: car2.image)
            
        car1Name.text = car1.name
        car2Name.text = car2.name
        car1Brand.text = car1.brand
        car2Brand.text = car2.brand
            
        car1Speed.text = "\(car1.topSpeed) Km/h"
        car2Speed.text = "\(car2.topSpeed) Km/h"
        
        car1Engine.text = car1.engine
        car2Engine.text = car2.engine

        car1Acceleration.text = "\(starRating(for: car1.acceleration))"
        car2Acceleration.text = "\(starRating(for: car2.acceleration))"
            
        car1Handling.text = "\(starRating(for: car1.handling))"
        car2Handling.text = "\(starRating(for: car2.handling))"
            
        car1Braking.text = "\(starRating(for: car1.braking))"
        car2Braking.text = "\(starRating(for: car2.braking))"
        
        self.navigationItem.rightBarButtonItem?.isEnabled = false // Disabled until 2 cars are selected

    }

    func starRating(for value: Int) -> String {
        return String(repeating: "★", count: value) + String(repeating: "☆", count: 5 - value)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
