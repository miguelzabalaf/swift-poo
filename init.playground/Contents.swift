import UIKit

// Initializers

protocol TemperatureConvertible {
    var temperature: Double { get }
}

struct Fahrenheit: TemperatureConvertible {
    var temperature: Double
    
    init(_ temperature: Double) {
        self.temperature = temperature
    }
}

var f1 = Fahrenheit(32)
var f2 = Fahrenheit(98.6)

struct Celcius: TemperatureConvertible {
    var temperature: Double
    
    init(fromFahrenheit fahrengeit: Double) {
        self.temperature = (fahrengeit - 32) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        self.temperature = kelvin - 273.15
    }
}

let boilingPointOfWater = Celcius(fromFahrenheit: 212)
let freezingPointOfWater = Celcius(fromKelvin: 273.15)

// Names, tags and options

struct Color {
    let red, green, blue, alpha: Double
    
    /// Initialize a RGB color
    /// - Parameters:
    ///   - red: R color.
    ///   - green: G color.
    ///   - blue: B color.
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = 1
    }
    
    /// Initialize a RGBa Color
    init(red: Double, green: Double, blue: Double, alpha: Double) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
}

let red = Color(red: 0.5, green: 0, blue: 0)
let blackOpacity = Color(red: 0, green: 0, blue: 0, alpha: 0.5)


class SurveyQuestion {
    var text: String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let question = SurveyQuestion(text: "What's your name?")
question.ask()
question.response = "John"

// Initializers in Sub Classes

class Vehicle {
    var numberOfWheels: Int = 0
    var description: String {
        return "\(self.numberOfWheels) Wheels"
    }
}

let vehicle1 = Vehicle()
print(vehicle1.description)

class Bicycle: Vehicle {
    override init() {
        super.init()
        self.numberOfWheels = 2
    }
}

let bicycle1 = Bicycle()
print(bicycle1.description)

class Hoverboard: Vehicle {
    var color: String
    
    init(color: String) {
        // super.init() was called implicitly
        self.color = color
    }
}

let hoverboard1 = Hoverboard(color: "Red")
print(hoverboard1.description)

// Failable Initializer

enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    
    init?(_ symbol: Character) {
        switch symbol.lowercased() {
        case "k":
            self = .kelvin
        case "c":
            self = .celsius
        case "f":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

let temperatureUnit1 = TemperatureUnit("K")
let temperatureUnit2 = TemperatureUnit("k")
let temperatureUnit3 = TemperatureUnit("c")
let temperatureUnit4 = TemperatureUnit("f")
let temperatureUnit5 = TemperatureUnit("z") // Return nil

class Product {
    var name: String
    
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class CartItem: Product {
    var quantity: Int
    
    init?(name: String, quantity: Int) {
        if quantity <= 0 {
            return nil
        }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let someSocks = CartItem(name: "Socks", quantity: 10) {
    print("\(someSocks.name) - \(someSocks.quantity)")
} else {
    print("Invalid quantity")
}


// Destruction of objects with deinit

class Bank {
    var coinsInBank = 2_000
    
    func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, self.coinsInBank)
        self.coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    
    func receive(coins: Int) {
        self.coinsInBank += coins
    }
}

var bank: Bank = Bank()

class Player {
    var coinsInPurse: Int
    var bank: Bank
    
    init(coins: Int, bank: Bank) {
        self.bank = bank
        self.coinsInPurse = bank.distribute(coins: coins)
    }
    
    func win(coins: Int) {
        self.coinsInPurse += bank.distribute(coins: coins)
    }
    
    deinit {
        print("\(self) is being deinitialized")
        bank.receive(coins: self.coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 1_000, bank: bank)
bank.coinsInBank
playerOne!.win(coins: 1_000)
bank.coinsInBank
playerOne = nil
bank.coinsInBank
