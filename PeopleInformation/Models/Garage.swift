//
//  Garage.swift
//  Table Screen App
//
//  Created by Manav Verma on 01/03/2025.
//

import Foundation

class Garage{
    
    var garage : [Car]
    
    init(garage: [Car]) {
        self.garage = garage
    }
    
    init(xmlFile: String){
        let dataParser = XMLParsing(fileName: xmlFile)
        dataParser.parsing()

        self.garage = dataParser.garageData
    }

    
    func count()->Int{return garage.count}
    func getCar(index:Int)->Car{return garage[index]}
    
}
