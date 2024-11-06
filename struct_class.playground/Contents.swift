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
    let width: CGFloat
    let height: CGFloat
}

// Example of class
class VideoMode {
    var resolution: Resolution(width: 1280, height: 720)
    var frameRate: CGFloat
}

// Creating some resolutions, they can't change his property values because all of them are constants
let vga = Resolution(width: 640, height: 480)
let qvga = Resolution(width: 320, height: 240)
let hd720p = Resolution(width: 1920, height: 1080)
let hd1080p = Resolution(width: 1920, height: 1080)

// Creating a list of resolutions
let resolutions = [vga, qvga, hd720p, hd1080p]
print(resolutions)

// Creating a VideoMode, using one of our resolution struct created recently
let highVideoMode = VideoMode(resolution: vga, frameRate: 30)
print(highVideoMode)

// Changing varible values of our recenly instance class (highVideoMode)
highVideoMode.frameRate = 120
highVideoModel.resolution = hd1080p
print("Resolution: \(highVideoMode.resolution)")
print("Frame rate: \(highVideoMode.frameRate)")
