//
//  GarageTableViewController.swift
//  PeopleInformation
//
//  Created by Manav Verma on 02/03/2025.
//
import UIKit

class GarageTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBAction func CompareAction(_ sender: UIBarButtonItem) {
            print("kahdkahksjd")
    }
    
    //MARK: - model data
    var garageData : Garage!
    var filteredCars: [Car] = []
    var selectedCars: [Car] = []
    var isSearching = false
    
    override func viewDidLoad() {
        searchBar.delegate = self
        super.viewDidLoad()
        self.title = "Garage"
        
        let backgroundImage = UIImageView(image: UIImage(named: "bg1"))
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.frame = self.tableView.bounds
        self.tableView.backgroundView = backgroundImage
        self.tableView.rowHeight = 100
        
        // Parse Data
        garageData = Garage(xmlFile: "carsData.xml")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredCars.count : garageData.count()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GarageTableViewCell", for: indexPath) as! GarageTableViewCell

        let carData = isSearching ? filteredCars[indexPath.row] : garageData.getCar(index: indexPath.row)
        cell.carBrandLabel?.text = carData.brand
        cell.carNameLabel?.text = carData.name
        cell.carImageView?.image = UIImage(named: carData.image)
        
        
        cell.toggleSwitch.isOn = selectedCars.contains { $0.name == carData.name }
        
        // Switch Toggle Action
        cell.switchAction = { isOn in
            if isOn {
                if self.selectedCars.count < 2 {
                    self.selectedCars.append(carData)
                } else {
                    cell.toggleSwitch.setOn(false, animated: true)
                }
            } else {
                self.selectedCars.removeAll { $0.name == carData.name }
            }
            
            self.navigationItem.rightBarButtonItem?.isEnabled = self.selectedCars.count == 2
        }

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue0" {
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            
            let carData = garageData.getCar(index: indexPath!.row)
            
            let destination = segue.destination as! CarViewController
            destination.carData = carData
            
        }
        if segue.identifier == "seguec" {
            let destination = segue.destination as! CarComparisonViewController
            destination.car1 = selectedCars[0]
            destination.car2 = selectedCars[1]
        }
    }

}

extension GarageTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            filteredCars = []
        } else {
            isSearching = true
            filteredCars = garageData.garage.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            filteredCars += garageData.garage.filter { $0.brand.lowercased().contains(searchText.lowercased()) }
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        isSearching = false
        tableView.reloadData()
    }
}
