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
    var resolution: Resolution
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
