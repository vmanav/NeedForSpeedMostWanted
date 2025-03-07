//
//  XMLParsing.swift
//  PeopleInformation
//
//  Created by Manav Verna on 24/02/2025.
//

import Foundation

class XMLParsing:NSObject, XMLParserDelegate{
    var fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    //MARK: Vars for parsing
    var pName, pBrand, pImage, pUrl, pprice,
        pengine, pblacklist, pblacklistRacer: String!
    
    var pTopSpeed: Int = 0
    var pAcceleration: Int = 0
    var pHandling: Int = 0
    var pBraking: Int = 0
    
    //spy vars for delegate method
    var passElement : Int = -1
    var passData : Bool = false
    
    //data object
    var carData : Car!
    var garageData = [Car]()
     
    //xml parsing elements
    var parser: XMLParser!
    var tags = [
        "name", "brand", "topSpeed", "acceleration", "handling", "braking",
        "image", "url", "price", "engine", "blacklist", "blacklistRacer"
    ]
    
    //MARK: Parsing delegate methods
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if tags.contains(elementName){
            passData = true
            passElement = tags.firstIndex(of: elementName)!
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if(passData){
            switch passElement{
                case 0: pName = string
                case 1: pBrand = string
                case 2: pTopSpeed = Int(string) ?? 0
                case 3: pAcceleration = Int(string) ?? 0
                case 4: pHandling = Int(string) ?? 0
                case 5: pBraking = Int(string) ?? 0
                case 6: pImage = string
                case 7: pUrl = string
                case 8: pprice = string
                case 9: pengine = string
                case 10: pblacklist = string
                case 11: pblacklistRacer = string
                default:
                    break
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        // Reset the spies to false when element name is in tags
        if tags.contains(elementName){
            passData = false
            passElement = -1
        }
        
        if(elementName == "car"){
            carData = Car(
                name: pName,
                brand: pBrand,
                topSpeed: pTopSpeed,
                acceleration: pAcceleration,
                handling: pHandling,
                braking: pBraking,
                image: pImage,
                url: pUrl,
                price: pprice,
                engine: pengine,
                blacklist: pblacklist,
                blacklistRacer: pblacklistRacer
            )
            garageData.append(carData)
        }
    }
    
    func parsing(){
        let bundleUrl = Bundle.main.bundleURL
        let fileUrl = URL(string: self.fileName, relativeTo: bundleUrl)
        
        parser = XMLParser(contentsOf: fileUrl!)
        parser.delegate = self
        
        parser.parse()
    }
}
