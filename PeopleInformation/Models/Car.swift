//
//  Car.swift
//  PeopleInformation
//
//  Created by Manav Verma on 01/03/2025.
//

import Foundation

class Car {
    var name, brand, image, url, price, engine, blacklist, blacklistRacer: String

    var topSpeed, acceleration, handling, braking : Int

    init(
        name: String, brand: String, topSpeed: Int,
        acceleration: Int, handling: Int, braking: Int,
        image: String, url: String, price: String,
        engine: String, blacklist: String, blacklistRacer: String
    ) {
        self.name = name
        self.brand = brand
        self.topSpeed = topSpeed
        self.acceleration = acceleration
        self.handling = handling
        self.braking = braking
        self.image = image
        self.url = url
        self.price = price
        self.engine = engine
        self.blacklist = blacklist
        self.blacklistRacer = blacklistRacer
    }
}
