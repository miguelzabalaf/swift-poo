import UIKit

class Vehicle {
    var currentSpeed: Double = 0.0
    var description: String {
        "Vehicle is currently \(currentSpeed) km/h"
    }
    
    func makeNoise() {
        
    }
}

let someVehicle = Vehicle()
print(someVehicle.description)

class Bicycle: Vehicle {
    
    var hasBasket: Bool = false
    
    override func makeNoise() {
        print("Ring ring!")
    }
}

let someBicycle = Bicycle()
someBicycle.currentSpeed = 15
print(someBicycle.description)

class Tandem: Bicycle {
    var currentNumberOfPassengers: Int = 0
}

let someTandem = Tandem()
someTandem.currentNumberOfPassengers = 2
someTandem.currentSpeed = 22

class Train: Vehicle {
    final var numberOfWagons: Int = 0 // With final, this property can't be overrided
    
    override func makeNoise() {
        print("Choo Choo!")
    }
}

class Car: Vehicle {
    var gear: Int = 1
    override var description: String {
        super.description + ", gear \(gear)"
    }
}

let someCar = Car()
print(someCar.description)

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            self.gear = Int(self.currentSpeed / 15.0) + 1
        }
    }
}


let automaticCar = AutomaticCar()
automaticCar.currentSpeed = 35
print(automaticCar.description)
