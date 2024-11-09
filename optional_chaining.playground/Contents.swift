import UIKit

class Person {
    var residence: Residence?
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int { rooms.count }
    var address: Address?
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
}

class Room {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildIdentifier() -> String? {
        var identifier = ""
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber), \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

let edgar = Person()

if let roomCount = edgar.residence?.numberOfRooms {
    print("Edgar's residence has \(roomCount) rooms.")
} else {
    print("Edgar doen't have a house")
}

func createAddress() -> Address {
    let address = Address()
    address.buildingName = "The Shire"
    address.buildingNumber = "1234"
    address.street = "Baker Street"
    return address
}

edgar.residence?.address = createAddress()

edgar
