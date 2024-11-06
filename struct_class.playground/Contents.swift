import UIKit

// Struct
struct SomeStruct {
    // Definition of struct
}

// Class
class SomeClass {
    // Definition of class
}

// Example of struct
struct Resolution {
    var width: CGFloat = 0
    var height: CGFloat = 0
}

// Example of class
class VideoMode {
    var resolution: Resolution = Resolution()
    var frameRate: CGFloat = 0.0
    
    init(resolution: Resolution, frameRate: CGFloat) {
        self.resolution = resolution
        self.frameRate = frameRate
    }
}

// Creating some resolutions, they can't change his property values because all of them are constants
let vga = Resolution(width: 640, height: 480)
let qvga = Resolution(width: 320, height: 240)
let hd720p = Resolution(width: 1920, height: 1080)
let hd1080p = Resolution(width: 1920, height: 1080)

// Creating a VideoMode, using one of our resolution struct created recently
let highVideoMode = VideoMode(resolution: vga, frameRate: 30)
print("Resolution: W: \(highVideoMode.resolution.width), H: \(highVideoMode.resolution.height)")
print("Frame rate: \(highVideoMode.frameRate)")

print("-----------------------------------------")

// Changing varible values of our recenly instance class (highVideoMode)
highVideoMode.frameRate = 120
highVideoMode.resolution = hd1080p
print("Resolution: W: \(highVideoMode.resolution.width), H: \(highVideoMode.resolution.height)")
print("Frame rate: \(highVideoMode.frameRate)")

print("-----------------------------------------")

// Copy the reference of highVideoMode instancied class
var cinema = highVideoMode
cinema.frameRate = 240
print("Frame rate (Cinema): \(cinema.frameRate)")
print("Frame rate (highVideoMode): \(highVideoMode.frameRate)")
// The value of frameRate of highVideoMode has been changed too, because, cinema variable it's a reference of highVideoMode
// With Struct this would be different, because, the struct doesn't share his reference, it's a copy like enum:

enum CompassPoint {
    case north, south, east, west
}

var currentDirection = CompassPoint.north
var oldDirecton = currentDirection
currentDirection = .south
// We would have a different values, because enum works like a copy, as structs too, totally different to classes
print("Old direction: \(oldDirecton)")
print("Current direction: \(currentDirection)")

