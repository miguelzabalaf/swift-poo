import UIKit

// Stored Properties

struct FixedLengthRange {
    var firstValue: Int // This is an stored property
    let lenght: Int // This is an stored property
}

// The stored properties persist and exist while his object exist (Created by class or struct)

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, lenght: 3)

// You can modify rangeOfThreeItems.firstValue beacuse, 1st rangeOfThreeItems it's a mutable object, and his property firstValue it's a mutable property too
rangeOfThreeItems.firstValue = 100

// -----------------------------------------------------

// Lazy Stored Properties

// This is an example of a class with high resources of memory
class DataImporter  {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter() // Only create an instance of DataImporter() when you will use importer variable at first time
    var data = [String]()
}

var manager = DataManager()

manager.data.append("Hello") // importer is not instantiated yet
manager.data.append("World") // importer is not instantiated yet
manager
manager.importer.fileName // importer was initialized

// -----------------------------------------------------

// Computed properties

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()

    var center: Point {
//        get {
//            Point(
//                x: origin.x + size.width / 2,
//                y: origin.y + size.height / 2
//            )
//        }

        get {
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.height / 2
            return Point(x: centerX, y: centerY)
        }
        
//        set {
//            origin.x = newValue.x - size.width / 2 // New value it's a default param of setters
//            origin.y = newValue.y - size.height / 2 // New value it's a default param of setters
//        }

        set(newCenter) {
            origin.x = newCenter.x - size.width / 2
            origin.y = newCenter.y - size.height / 2
        }
    }
}

var square = Rect(origin: Point(x: 0, y: 0), size: .init(width: 10, height: 10))
square.center

let initialSquareCenter = square.center
square.center = Point(x: 20, y: 20)


// -----------------------------------------------------

// Computed properties (Only lecture)

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    
    var volume: Double {
        width * height * depth
    }
}

let myFirstCuboid = Cuboid(width: 10, height: 20, depth: 30)
myFirstCuboid.volume // 'volume' it's a get-only property


// -----------------------------------------------------

// Property Observers

// willSet: It's called before change the property value
// didSet: It's called after change the property value

class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("About to set totalSteps to \(newValue)") // newValue it's a default param of willSet
        }
        didSet {
            print("Just set totalSteps to \(oldValue)") // oldValue it's a default param of didSet
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 100
// About to set totalSteps to 100
// Just set totalSteps to 0


// -----------------------------------------------------

// Type Property

struct SomeStruct {
    var counter = 0
    static let storedTypeProperty = "Some Value" // All instances of my "SomeStruct" will have an static value in his property "storedTypeProperty"
    static var computedTypeProperty: Int {
        return 1
    }
}

var instanceStr = SomeStruct()
// instanceStr.storedTypeProperty You cant access to static properties by instance, you need to call it directly from the struct

print(SomeStruct.storedTypeProperty) // Correct
print(SomeStruct.computedTypeProperty) // Correct

enum SomeEnum {
    static let storedTypeProperty = "Some Value from enum"
}

print(SomeEnum.storedTypeProperty)

class SomeClass {
    static let storedTypeProperty = "Some Value from class"
    static var computedTypeProperty: Int {
        return -9
    }

    // We can override this computed type property
    class var overrideableComputedTypeProperty: Int {
        return 108
    }
}
