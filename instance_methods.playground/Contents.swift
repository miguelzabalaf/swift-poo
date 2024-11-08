import UIKit

// Instance Methods

// 1. Always use self. when you want to reference a property inside of a class

class Counter {
    var count: Int = 0
    
    func incrementConstantCount() {
        self.count += 1
    }
    
    func increment() {
        self.count += 1
    }

    func increment(by amount: Int = 1) {
        self.count += amount
    }
    
    func decrement(by amount: Int = 1) {
        self.count -= amount
    }
    
    func reset() {
        self.count = 0
    }
}


var counter = Counter()
counter.increment()
counter.increment(by: 8)
counter.reset()

// Same example with struct

struct Point {
    var x = 0.0, y = 0.0
    
    func isToTheRight(of other: Point) -> Bool {
        return self.x > other.x
    }
    
    // To change whatever property of instance structs with his own methods, you will need to mark this methods as mutating and the instance of this struct need to be variable
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        // self.x += deltaX
        // self.y += deltaY
        self = Point(x: self.x + deltaX, y: self.y + deltaY) // Rewrite all value of my struct
    }
}

var somePoint = Point(x: 3.0, y: 4.0)
let anotherPoint = Point(x: 5.0, y: 6.0)

somePoint.isToTheRight(of: anotherPoint)
somePoint.moveBy(x: 2.0, y: 3.0)

// The same with enum

enum DifferentStateSwitch {
    case off, low, high
    
    mutating func toggle() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var controllerStatus = DifferentStateSwitch.off
controllerStatus.toggle()


// Methods of classes

class SomeClass {
    class func someMethod() {
        print("Hello from class method")
    }
}

SomeClass.someMethod()


// Sub Index
