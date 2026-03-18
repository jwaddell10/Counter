//: [Previous](@previous)

import Foundation

//create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?

struct Car {
    //model, seats, gear
    
    let model: String
    let numberOfSeats: Int
    private var currentGear = 0
    
    init(model: String, numberOfSeats: Int) {
         self.model = model
         self.numberOfSeats = numberOfSeats
    }
    
    mutating func shiftGearUp() {
        if currentGear >= 20 {
            return
        }
        currentGear += 1
    }
    
    mutating func shiftGearDown() {
        if currentGear <= 0 {
            return
        }
        currentGear -= 1
    }
}

var honda = Car(model: "Civic", numberOfSeats: 5)
honda.shiftGearUp()
print(honda, "Honda")
