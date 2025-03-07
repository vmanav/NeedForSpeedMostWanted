//
//  CarViewController.swift
//  PeopleInformation
//
//  Created by Manav Verma on 02/03/2025.
//

import UIKit

class CarViewController: UIViewController {

    // MARK: - Outlets and Actions
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carBrand: UILabel!
    @IBOutlet weak var carName: UILabel!
    
    @IBOutlet weak var blacklistLabel: UILabel!
    @IBOutlet weak var moreDetailsBtn: UIButton!
    
    @IBAction func moreDetailsAction(_ sender: Any) {
    }

    var carData : Car!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Populate Data
        carBrand.text = carData.brand
        carName.text = carData.name
        carImage.image = UIImage(named: carData.image)
        blacklistLabel.text = carData.blacklist

        moreDetailsBtn.layer.borderWidth = 1.0
        moreDetailsBtn.layer.borderColor = UIColor(red: 255, green: 191, blue: 0, alpha: 1).cgColor
        moreDetailsBtn.layer.cornerRadius = 2

    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1"{
            let destinationController = segue.destination as! DetailsViewController
            
            destinationController.carData = self.carData
        }
    }

}
